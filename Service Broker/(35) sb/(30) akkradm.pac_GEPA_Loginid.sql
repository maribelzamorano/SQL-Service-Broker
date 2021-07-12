/*	
 * topdev GmbH, erstellt am 11.11.2009 08:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-11 08:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (30) akkradm.pac_GEPA_Loginid.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pac_GEPA_Loginid') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pac_GEPA_Loginid
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pac_GEPA_Loginid
	@EVENT_NAME	UDT_CODE,
	@GEPA_ID	UDT_ID

as
begin

	print 'Correctly received the message parameters.'
	print 'EVENT_NAME = '+@EVENT_NAME+', GEPA_ID = '+convert(nvarchar(25),@GEPA_ID)

end