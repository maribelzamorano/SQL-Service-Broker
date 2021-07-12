/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrBenachrichtigungsprofilQueue.sql $
 *
 */

---> create message
create MESSAGE TYPE AkkrMeldungNeu  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create contract
create CONTRACT AkkrBenachrichtigungsprofilContract
(AkkrMeldungNeu SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrBenachrichtigungsprofilQueue
GO

---> add activation to the queue
ALTER QUEUE akkradm.AkkrBenachrichtigungsprofilQueue
WITH ACTIVATION (STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_BenachrichtigungsprofilService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrBenachrichtigungsprofilService
ON Queue akkradm.AkkrBenachrichtigungsprofilQueue
(AkkrBenachrichtigungsprofilContract)
GO