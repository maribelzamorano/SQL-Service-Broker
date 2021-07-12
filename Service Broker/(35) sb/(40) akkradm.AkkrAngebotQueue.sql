/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrAngebotQueue.sql $
 *
 */


---> create message
create MESSAGE TYPE AkkrAngebotOhneAntrag  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create message
create MESSAGE TYPE AkkrAngebotZulangeAusgesetzt  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO
---> create contract
create CONTRACT AkkrAngebotContract
(AkkrAngebotOhneAntrag SENT BY INITIATOR,
 AkkrAngebotZulangeAusgesetzt SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrAngebotQueue
GO

---> add activation to the queue
ALTER QUEUE akkradm.AkkrAngebotQueue
WITH ACTIVATION (STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_AngebotService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrAngebotService
ON Queue akkradm.AkkrAngebotQueue
(AkkrAngebotContract)
GO