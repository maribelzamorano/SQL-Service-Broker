/*	
 * topdev GmbH, erstellt am 28.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-29 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (40) akkradm.AkkrVeranstaltungQueue.sql $
 *
 */

---> create  message
create MESSAGE TYPE AkkrVeranstaltungAblaufAbruf AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create  message
create MESSAGE TYPE AkkrVeranstaltungFalscherAngebotsstatus  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO

---> create message
create MESSAGE TYPE AkkrVeranstaltungOhneAuswertung  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO
---> create  contract
create CONTRACT AkkrVeranstaltungContract
(AkkrVeranstaltungAblaufAbruf SENT BY INITIATOR, 
 AkkrVeranstaltungFalscherAngebotsstatus SENT BY INITIATOR, 
 AkkrVeranstaltungOhneAuswertung SENT BY INITIATOR)
GO

---> create queue
create QUEUE akkradm.AkkrVeranstaltungQueue
GO

---> add activation to the queue
ALTER QUEUE akkradm.AkkrVeranstaltungQueue
WITH ACTIVATION (STATUS = ON,
PROCEDURE_NAME = akkradm.ppr_VeranstaltungService, MAX_QUEUE_READERS = 5,
EXECUTE AS OWNER)
GO

---> create service
create SERVICE AkkrVeranstaltungService
ON Queue akkradm.AkkrVeranstaltungQueue
(AkkrVeranstaltungContract)
GO
