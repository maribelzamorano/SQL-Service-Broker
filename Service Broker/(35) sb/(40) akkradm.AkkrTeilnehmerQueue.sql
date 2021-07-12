/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrTeilnehmerQueue.sql $
 *
 */

---> create message
create MESSAGE TYPE AkkrTeilnehmerAngemeldet  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create message
create MESSAGE TYPE AkkrTeilnehmerAbgesagt  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create contract
create CONTRACT AkkrTeilnehmerContract
(AkkrTeilnehmerAngemeldet SENT BY INITIATOR, 
 AkkrTeilnehmerAbgesagt SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrTeilnehmerQueue
GO

--> add activation to the queue
ALTER QUEUE akkradm.AkkrTeilnehmerQueue
WITH ACTIVATION (STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_TeilnehmerService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrTeilnehmerService
ON Queue akkradm.AkkrTeilnehmerQueue
(AkkrTeilnehmerContract)
GO