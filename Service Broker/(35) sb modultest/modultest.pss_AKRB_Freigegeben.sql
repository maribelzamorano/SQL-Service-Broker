
/*	
 * topdev GmbH, erstellt am 23.10.2009 10:10
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-28 12:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: modultest.pss_AKRB_Freigegeben.sql $
 *
 */


---- Run the procedure one time

exec akkradm.pss_AKRB_Freigegeben 'akrb.abie.akk', 14

-- check the content of the queues

select * from akkradm.AkkrAkkreditierungsbescheidQueue
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
