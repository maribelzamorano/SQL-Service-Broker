
/*	
 * topdev GmbH, erstellt am 23.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-28 12:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: modultest.pss_ANBO_OhneAntrag.sql $
 *
 */

---- Run the procedure one time

exec akkradm.pss_ANBO_OhneAntrag 'anbo.antrfeh.l1', 11

-- check the content of the queues

select * from akkradm.AkkrAngebotQueue
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