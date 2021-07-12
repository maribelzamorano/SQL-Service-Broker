/*	
 * topdev GmbH, erstellt am 28.10.2009 11:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-10-28 11:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (35) akkradm.ppr_AnbieterService.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.ppr_AnbieterService') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.ppr_AnbieterService
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.ppr_AnbieterService
as
begin
--> 
	set nocount on;
	declare
		@ConversationHandle UNIQUEIDENTIFIER,
		@Message	xml,
		@IMessage	int,
		@MessageType Sysname,
		@LogConversationHandle UNIQUEIDENTIFIER,
		@LogMessage xml,

		@rc			integer,
		@rc_text	nvarchar(1000),
		@sql_error	integer,
		@procName	nvarchar(250),
		@step		nvarchar(100),

--> this variables can be changed
		@EVENT_NAME   UDT_CODE,
		@ABIE_ID	UDT_ID,
		@ABIE_#PTS	UDT_#PTS
		

--<
--> Default code block: DO NOT CHANGE!
	set @rc = 0;
	set @rc_text = N'';
	set @sql_error = 0;
	set @procName = isNull( Object_Name( @@PROCID ), N'<<unbekannt>>' )
--<

	begin transaction; --no KZ_USE_TRANSACTION is used... because this procedure is executed automatically no receiving parameters are allowed
	begin try;


---> Message is received
		receive top(1)				-- message is received
			@ConversationHandle=Conversation_Handle
			,@Message=Message_Body
			,@MessageType=Message_Type_Name
		from akkradm.AkkrAnbieterQueue;

		if @rc != -1 and @ConversationHandle is not null
		end conversation @ConversationHandle;

----<

		if(@MESSAGE is null)	
			select @rc = -2, @rc_text = 'Message is null'; 
-- the -2 value is used so the other parts of the procedure aren't executed after receiving a message that is null...
-- but the transaction is commited because when a conversation is ended a null message is sent to the queue
-- and it has to be removed from the queue

----> message is "translated" from its xml format to variables and sent to the action handler
----> in this place you can put more instructions for diferent actions handlers.... depending on the type of message
		if @rc = 0 and @MESSAGETYPE = 'AkkrAnbieterGeaendert'
			begin

				exec sp_xml_preparedocument @IMessage output, @Message;
				select @EVENT_NAME = EVENT_NAME, @ABIE_ID = ABIE_ID, @ABIE_#PTS = ABIE_PTS
				from openxml (@IMessage, '/message', 2)
				with (EVENT_NAME UDT_CODE, ABIE_ID UDT_ID, ABIE_PTS UDT_#PTS);

				exec akkradm.pac_ABIE_Geaendert @EVENT_NAME, @ABIE_ID, @ABIE_#PTS;

			end

		if @rc = 0 and @MESSAGETYPE = 'AkkrAnbieterZulangeAusgesetzt'
			begin

				exec sp_xml_preparedocument @IMessage output, @Message;
				select @EVENT_NAME = EVENT_NAME, @ABIE_ID = ABIE_ID
				from openxml (@IMessage, '/message', 2)
				with (EVENT_NAME UDT_CODE, ABIE_ID UDT_ID);

				exec akkradm.pac_ABIE_ZulangeAusgesetzt @EVENT_NAME, @ABIE_ID;

			end


		if @rc = 0 and @MESSAGETYPE = 'AkkrAnbieterReakkreditierung'
			begin

				exec sp_xml_preparedocument @IMessage output, @Message;
				select @EVENT_NAME = EVENT_NAME, @ABIE_ID = ABIE_ID
				from openxml (@IMessage, '/message', 2)
				with (EVENT_NAME UDT_CODE, ABIE_ID UDT_ID);

				exec akkradm.pac_ABIE_Reakkreditierung @EVENT_NAME, @ABIE_ID;

			end

		if @rc = 0 and @MESSAGETYPE = 'AkkrAnbieterAkkreditierungAusgelaufen'
			begin

				exec sp_xml_preparedocument @IMessage output, @Message;
				select @EVENT_NAME = EVENT_NAME, @ABIE_ID = ABIE_ID
				from openxml (@IMessage, '/message', 2)
				with (EVENT_NAME UDT_CODE, ABIE_ID UDT_ID);

				exec akkradm.pac_ABIE_AkkreditierungAusgelaufen @EVENT_NAME, @ABIE_ID;

			end

----<

----> Logging
	if (@rc = 0)
	begin
		exec akkradm.pss_WriteLoginfo @ConversationHandle, @Message, @procName;
	end
----< End logging

--> Standardblock, DO NOT CHANGE
	if ( @rc != -1)
	begin
		commit transaction
	end
	else
	begin
		rollback transaction
	end

	end try
	begin catch
		select @rc = -1, @sql_error = ERROR_NUMBER(), @rc_text = ERROR_MESSAGE();
		rollback transaction
	end catch;

	if ( @rc = -1 )
	begin
		if ( isNull( @rc_text, N'' ) = N'' )
			set @rc_text = N'Es ist ein Fehler aufgetreten.';

		set @rc_text = N'(' + @step + '): ' + @rc_text;

		select	@rc_text = services.pfn_getErrorMessageEx( 
					@sql_error,	-- @ERRORNUMBER
					null,		-- @ERRORSEVERITY
					null,		-- @ERRORSTATE
					null,		-- @ERRORLINE
					@procName,	-- @ERRORPROCEDURE
					null,		-- @ERRORMESSAGE
					@rc_text	-- @MSG
				);

		raiserror( @rc_text, 16, 1 );
	end
--< Ende Standardblock


end

