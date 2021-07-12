/*	
 * topdev GmbH, erstellt am 02.11.2009 10:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-02 10:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (30) akkradm.pac_TEIL_Abgesagt.sql $
 *
 */

if not exists ( select * from sysobjects where id = object_id('akkradm.pac_TEIL_Abgesagt') and OBJECTPROPERTY(id, 'IsProcedure') = 1)
begin
	exec( N'create procedure akkradm.pac_TEIL_Abgesagt
	as begin
		print ''Procedure created.'';
	end' );
end
GO

alter procedure akkradm.pac_TEIL_Abgesagt
	@EVENT_NAME	UDT_CODE,
	@TEIL_ID	UDT_ID

as
begin

	print 'Correctly received the message parameters.'
	print 'EVENT_NAME = '+@EVENT_NAME+', TEIL_ID = '+convert(nvarchar(25),@TEIL_ID)

end