/*	
 * topdev GmbH, erstellt am 04.11.2009 12:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-04 11:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (50) data.T_SYSTEMEINSTELLUNGEN(ServiceBroker).sql $
 *
 */

declare	@syst_id	UDT_ID,
	@syst_code	UDT_CODE,
	@syst_decode	UDT_DECODE,
	@SYSV_CODE	nvarchar(10)

select	@syst_id = max( syst_id ) from dbo.IO_SYSTEMEINSTELLUNGEN
select	@syst_id = isnull( @syst_id, 0 )

select	@SYSV_CODE = 'SYST'



----------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'abie.upd',
	@SYST_DECODE = 'Änderung an Anbieterprofil'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE,1 )
end

----------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'gepa.upd',
	@SYST_DECODE = 'Änderung an Geschäftspartnerdaten'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'anbo.antrfeh.l1',
	@SYST_DECODE = 'Akkreditierung Angebot nicht beantragt Stufe 1'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'anbo.antrfeh.l2',
	@SYST_DECODE = 'Akkreditierung Angebot nicht beantragt Stufe 2'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'anbo.antrfeh.l3',
	@SYST_DECODE = 'Akkreditierung Angebot nicht beantragt Stufe 3'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'anbo.ausges',
	@SYST_DECODE = 'Akkreditierung Angebot zu lange ausgesetzt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'abie.ausges',
	@SYST_DECODE = 'Akkreditierung Anbieter zu lange ausgesetzt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'abie.reakk.l1',
	@SYST_DECODE = 'Re-Akkreditierung durchführen Stufe 1'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'abie.reakk.l2',
	@SYST_DECODE = 'Re-Akkreditierung durchführen Stufe 2'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'abie.akkaus',
	@SYST_DECODE = 'Akkreditierung ausgelaufen'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.anbo.akk',
	@SYST_DECODE = 'Akkreditierungsbescheid Angebot "Akkreditierung erteilt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.anbo.aus',
	@SYST_DECODE = 'Akkreditierungsbescheid Angebot "Akkreditierung ausgesetzt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.anbo.abg',
	@SYST_DECODE = 'Akkreditierungsbescheid Angebot "Akkreditierung abgelehnt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.akk',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Akkreditierung erteilt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.aus',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Akkreditierung ausgesetzt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.abg',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Akkreditierung abgelehnt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.ent',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Akkreditierung entzogen" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.reakk',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Re-Akkreditierung erteilt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.reaus',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Re-Akkreditierung ausgesetzt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'akrb.abie.reabg',
	@SYST_DECODE = 'Akkreditierungsbescheid Anbieter "Re-Akkreditierung abgelehnt" erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'vesg.ablauf.abr',
	@SYST_DECODE = 'Ablauf Abrufveranstaltung'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'vesg.antr.fehlt',
	@SYST_DECODE = 'Beauftragung Akkreditierung Angebot fehlt für Veranstaltung'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'vesg.akk.fehlt',
	@SYST_DECODE = 'Durchführung Akkreditierung Angebot fehlt für Veranstaltung'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'vesg.ausw.fehlt',
	@SYST_DECODE = 'Fehlende Auswertung zu Veranstaltung'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'gepa.kennw.neu',
	@SYST_DECODE = 'Neues Kennwort generiert'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'mlog.neu',
	@SYST_DECODE = 'Schnittstellen-Meldung erstellt'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'teil.neu',
	@SYST_DECODE = 'Anmeldung an Veranstaltung registriert'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

--------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'teil.absage',
	@SYST_DECODE = 'Absage eines Teilnehmers'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

----------------------------------------------------------------------------------------------------------------------
select	@SYST_CODE = 'gepa.login.verg',
	@SYST_DECODE = 'Benutzer hat Loginid vergessen'

if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
begin
	select	@syst_id = @syst_id + 1
	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
end

----------------------------------------------------------------------------------------------------------------------













--select	@SYST_CODE = 'a',
--	@SYST_DECODE = 'b'
--
--if NOT exists( select * from dbo.IO_SYSTEMEINSTELLUNGEN where sysv_code = @SYSV_CODE and syst_code = @SYST_CODE )
--begin
--	select	@syst_id = @syst_id + 1
--	insert into dbo.IO_SYSTEMEINSTELLUNGEN( SYST_ID, SYSV_CODE, SYST_TYPE, SYST_CODE, SYST_DECODE, SYST_VALUE )
--	values( @syst_id, @SYSV_CODE, 'TEXT', @SYST_CODE, @SYST_DECODE, 1 )
--end

--delete from dbo.IO_SYSTEMEINSTELLUNGEN where SYST_CODE= 'abie.upd'