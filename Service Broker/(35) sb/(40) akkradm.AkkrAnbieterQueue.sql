/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrAnbieterQueue.sql $
 *
 */

---> create  message
create MESSAGE TYPE AkkrAnbieterGeaendert AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create  message
create MESSAGE TYPE AkkrAnbieterZulangeAusgesetzt  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create  message
create MESSAGE TYPE AkkrAnbieterReakkreditierung  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create message
create MESSAGE TYPE AkkrAnbieterAkkreditierungAusgelaufen  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create  contract
create CONTRACT AkkrAnbieterContract
(AkkrAnbieterGeaendert SENT BY INITIATOR,
 AkkrAnbieterZulangeAusgesetzt SENT BY INITIATOR,
 AkkrAnbieterReakkreditierung SENT BY INITIATOR,
 AkkrAnbieterAkkreditierungAusgelaufen SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrAnbieterQueue 
GO

---> add activation to the queue
ALTER QUEUE akkradm.AkkrAnbieterQueue
WITH ACTIVATION(STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_AnbieterService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrAnbieterService 
ON Queue akkradm.AkkrAnbieterQueue
(AkkrAnbieterContract)
GO
