/*	
 * topdev GmbH, erstellt am 02.11.2009 10:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-02 10:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (30) akkradm.pac_GEPA_Kennwort.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pac_GEPA_Kennwort') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pac_GEPA_Kennwort
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pac_GEPA_Kennwort
	@EVENT_NAME	UDT_CODE,
	@GEPA_ID	UDT_ID,
	@KENNWORT	nvarchar(20)

as
begin

	print 'Correctly received the message parameters.'
	print 'EVENT_NAME = '+@EVENT_NAME+', GEPA_ID = '+convert(nvarchar(25),@GEPA_ID)+' KENNWORT = '+@KENNWORT

end