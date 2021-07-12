/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrAkkreditierungsbescheidQueue.sql $
 *
 */

---> create message
create MESSAGE TYPE AkkrAkkreditierungsbescheidFreigegeben  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO
---> create contract
create CONTRACT AkkrAkkreditierungsbescheidContract
(AkkrAkkreditierungsbescheidFreigegeben SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrAkkreditierungsbescheidQueue
GO

---> add activation to the queue
ALTER QUEUE akkradm.AkkrAkkreditierungsbescheidQueue
WITH ACTIVATION (STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_AkkreditierungsbescheidService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrAkkreditierungsbescheidService
ON Queue akkradm.AkkrAkkreditierungsbescheidQueue
(AkkrAkkreditierungsbescheidContract)
GO