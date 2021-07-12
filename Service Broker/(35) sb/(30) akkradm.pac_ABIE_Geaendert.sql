/*	
 * topdev GmbH, erstellt am 23.10.2009 11:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-10-23 11:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (30) akkradm.pac_ABIE_Geaendert.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pac_ABIE_Geaendert') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pac_ABIE_Geaendert
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pac_ABIE_Geaendert
	@EVENT_NAME	UDT_CODE,
	@ABIE_ID	UDT_ID,
	@ABIE_#PTS	UDT_#PTS
as
begin

	print 'Correctly received the message parameters.'
	print 'EVENT_NAME = '+@EVENT_NAME+', ABIE_ID = '+convert(nvarchar(25),@ABIE_ID)+', ABIE_#PTS = '+@ABIE_#PTS

end