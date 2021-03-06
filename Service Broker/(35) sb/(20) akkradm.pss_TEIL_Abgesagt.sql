/*	
 * topdev GmbH, erstellt am 23.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-28 12:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (20) akkradm.pss_TEIL_Abgesagt.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pss_TEIL_Abgesagt') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pss_TEIL_Abgesagt
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pss_TEIL_Abgesagt

--> business fields
	@EVENT_NAME                UDT_CODE,
	@TEIL_ID					UDT_ID,
-->
	@KZ_USE_TRANSACTION			bit = 0,	
	@DEBUG						bit = 0		

as begin

--> 
	set nocount on;
	declare
			@rc			integer,
			@rc_text	nvarchar(1000),
			@sql_error	integer,
			@procName	nvarchar(250),
			@step		nvarchar(100),
			@message					xml,
			@conversationhandle			UNIQUEIDENTIFIER,
			@loggingmessage				xml,
			@loggingconversationhandle  UNIQUEIDENTIFIER,
			@SYST_VALUE					UDT_DECODE;

	set @rc = 0;
	set @rc_text = N'';
	set @sql_error = 0;
	set @procName = isNull( Object_Name( @@PROCID ), N'<<unbekannt>>' )


	set @step = N'The processing will now begin.';
	if ( @DEBUG = 1 )	print @step;

	

	if ( @KZ_USE_TRANSACTION = 1 )
	begin
		begin transaction;
	end
			
		begin try						
		
		if ( @rc = 0 )
		begin
			set @step = N'Checking the event activation.';	
			if ( @DEBUG = 1 )	print @step;

			exec  dbo.psp_GetSystemValue2 @SESSION_ID=NULL, @RC=@rc output, @SQL_ERROR=@sql_error output, @RC_TEXT=@rc_text output, @SYST_CODE=@EVENT_NAME,
			@SYST_VALUE=@SYST_VALUE output

            if (@rc = -1 and @sql_error = 0)
                set @rc_text = N'Systemeinstellung ' + @EVENT_NAME + N' wurde nicht gefunden oder ist nicht gesetzt.'                

            if (@rc = 0 and @SYST_VALUE = '1')
            begin
                set @step = N'Sending the message.';  
                if ( @DEBUG = 1 )      print @step;


				set @message ='<message>
									<EVENT_NAME>'+@EVENT_NAME+'</EVENT_NAME>
									<TEIL_ID>'+convert( nvarchar(25),@TEIL_ID)+'</TEIL_ID>
							   </message>';

		
				BEGIN DIALOG CONVERSATION @conversationHandle
				FROM SERVICE AkkrTeilnehmerService
				TO SERVICE 'AkkrTeilnehmerService'
				ON CONTRACT AkkrTeilnehmerContract
				WITH ENCRYPTION = OFF;

				SEND ON CONVERSATION @conversationHandle
				MESSAGE TYPE AkkrTeilnehmerAbgesagt
				(@message);
				END CONVERSATION @conversationHandle;
				
		

	-------------- Logging
				set @step = N'Sending the logging message.';	
				if ( @DEBUG = 1 )	print @step;

						exec akkradm.pss_WriteLoginfo @ConversationHandle, @Message, @procName
					
			end
	----------- end logging

		end



			if ( @KZ_USE_TRANSACTION = 1 )
			begin
				if ( @rc = 0 )
				begin
					commit transaction;
				end
				else
				begin
					rollback transaction;
				end
			end
		end try
		begin catch

				if ( @KZ_USE_TRANSACTION = 1 )
				begin
					rollback transaction;

				end

				set @rc = -1;
				set @sql_error = ERROR_NUMBER();
				set @rc_text = ERROR_MESSAGE();

		end catch;


	if ( @rc <> 0 )
	begin
		if ( isNull( @rc_text, N'' ) = N'' )
			set @rc_text = N'Es ist ein Fehler aufgetreten.';	-- An error has occured

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

end

GO


