/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrGeschaeftspartnerQueue.sql $
 *
 */

---> create message
create MESSAGE TYPE AkkrGeschaeftspartnerKennwort  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create message
create MESSAGE TYPE AkkrGeschaeftspartnerLoginId  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create  contract
create CONTRACT AkkrGeschaeftspartnerContract
(AkkrGeschaeftspartnerKennwort SENT BY INITIATOR, 
 AkkrGeschaeftspartnerLoginId SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrGeschaeftspartnerQueue
GO

---> add activation to the queue
ALTER QUEUE akkradm.AkkrGeschaeftspartnerQueue
WITH ACTIVATION (STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_GeschaeftspartnerService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrGeschaeftspartnerService
ON Queue akkradm.AkkrGeschaeftspartnerQueue
(AkkrGeschaeftspartnerContract)
GO
