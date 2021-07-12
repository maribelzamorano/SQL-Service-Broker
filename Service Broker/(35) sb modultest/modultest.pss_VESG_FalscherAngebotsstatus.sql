/*	
 * topdev GmbH, erstellt am 02.11.2009 11:00
 *
 * $Author: Renato Fontes Tapia $
 * $Date: 2009-11-02 11:00:00 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: modultest.pss_VESG_FalscherAngebotsstatus.sql $
 *
 */

-- Run the procedure one time

exec akkradm.pss_VESG_FalscherAngebotsstatus 'vesg.antr.fehlt', 46

-- check the content of the queues

select * from akkradm.AkkrVeranstaltungQueue
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
