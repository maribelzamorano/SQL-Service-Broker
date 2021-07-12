/*	
 * topdev GmbH, erstellt am 23.10.2009 10:10		--topdev GmbH, created at ...
 *
 * $Author: Maribel Zamorano $
 * $Date: 2009-10-28 10:10:26 $
 * $Rev: _ $
 * -------------------------------------------
 * $Workfile: (00) akkradm.CreateServiceBroker.sql $
 *
 */

---> ENABLE SERVICE BROKER ON DATABASE

ALTER DATABASE ServiceBrokerTest SET ENABLE_BROKER
GO

---> Logging

---> create Logging message
create MESSAGE TYPE AkkrLogging  AUTHORIZATION akkradm
VALIDATION = WELL_FORMED_XML
GO


---> create Logging contract
create CONTRACT AkkrLoggingContract
(AkkrLogging SENT BY INITIATOR)
GO

---> create Logging Queue
create QUEUE akkradm.AkkrLoggingQueue
GO

---> create logging service
create SERVICE AkkrLoggingService ON
Queue akkradm.AkkrLoggingQueue
(AkkrLoggingContract)
GO

