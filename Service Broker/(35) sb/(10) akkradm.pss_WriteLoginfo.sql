/*	
 * topdev GmbH, erstellt am 28.10.2009 15:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-10-28 15:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (10) akkradm.pss_WriteLoginfo.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pss_WriteLoginfo') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pss_WriteLoginfo
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pss_WriteLoginfo
	@CONVERSATIONHANDLE UNIQUEIDENTIFIER,
	@MESSAGE			xml,
	@OBJECTNAME			nvarchar(250)
as
begin
	declare	@rc			integer,
			@rc_text	nvarchar(1000),
			@sql_error	integer,
			@procName	nvarchar(250),
			@LogConversationHandle UNIQUEIDENTIFIER,
			@LogMessage xml


	select @LogMessage =				--Log Message is created
'<Loginfo Objectname="'+@OBJECTNAME+'" Pts="'+convert( nvarchar(25),getdate())+'" dialog="'+convert( nvarchar(36),@CONVERSATIONHANDLE)+'">
'+convert(nvarchar(max),@MESSAGE)+'
</Loginfo>';



	begin dialog conversation @LogConversationHandle	--Log Message is sent
	from service AkkrLoggingService
	to service 'AkkrLoggingService'
	on contract AkkrLoggingContract
	with encryption = off;
	send on conversation @LogConversationHandle
	message type AkkrLogging
	(@LogMessage);

	end conversation @LogConversationHandle;



end
