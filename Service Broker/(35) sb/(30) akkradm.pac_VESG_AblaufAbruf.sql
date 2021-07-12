/*	
 * topdev GmbH, erstellt am 02.11.2009 09:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-02 09:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (30) akkradm.pac_VESG_AblaufAbruf.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pac_VESG_AblaufAbruf') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pac_VESG_AblaufAbruf
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pac_VESG_AblaufAbruf
	@EVENT_NAME	UDT_CODE,
	@VESG_ID	UDT_ID

as
begin

	print 'Correctly received the message parameters.'
	print 'EVENT_NAME = '+@EVENT_NAME+', VESG_ID = '+convert(nvarchar(25),@VESG_ID)

end