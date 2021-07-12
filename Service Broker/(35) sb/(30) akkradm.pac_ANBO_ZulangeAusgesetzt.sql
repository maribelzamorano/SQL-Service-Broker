/*	
 * topdev GmbH, erstellt am 02.11.2009 08:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-02 08:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (30) akkradm.pac_ANBO_ZulangeAusgesetzt.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pac_ANBO_ZulangeAusgesetzt') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pac_ANBO_ZulangeAusgesetzt
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pac_ANBO_ZulangeAusgesetzt
	@EVENT_NAME	UDT_CODE,
	@ANBO_ID	UDT_ID

as
begin

	print 'Correctly received the message parameters.'
	print 'EVENT_NAME = '+@EVENT_NAME+', ANBO_ID = '+convert(nvarchar(25),@ANBO_ID)

end