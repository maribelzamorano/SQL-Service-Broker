/*	
 * topdev GmbH, erstellt am 11.11.2009 08:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-11 08:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: modultest.pss_GEPA_Loginid.sql $
 *
 */

-- Run the procedure one time

exec akkradm.pss_GEPA_Loginid 'gepa.login.verg', 35

-- check the content of the queues

select * from akkradm.AkkrGeschaeftspartnerQueue
select * from akkradm.akkrloggingqueue


-- receive messages from the logging queue

declare @message xml;

receive top(1) @message = message_body from akkradm.akkrloggingqueue
select @message;

receive top(1) @message = message_body from akkradm.akkrloggingqueue
select @message;

receive top(1) @message = message_body from akkradm.akkrloggingqueue
select @message;

receive top(1) @message = message_body from akkradm.akkrloggingqueue
select @message;