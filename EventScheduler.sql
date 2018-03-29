--The minimum requirements for a valid CREATE EVENT statement are as follows:
--
--The keywords CREATE EVENT plus an event name, which uniquely identifies the event in a database schema.
--
--An ON SCHEDULE clause, which determines when and how often the event executes.
--
--A DO clause, which contains the SQL statement to be executed by an event.


--Events are executed by a special event scheduler thread; when we refer to the Event Scheduler, we actually refer to this thread.


	
CREATE EVENT updateTimestamp
	ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR
	DO 
	BEGIN
		INSERT INTO currentTimestamp values (NOW())
	END 
	
	
	
CREATE EVENT updateTimestampEverySec
	ON SCHEDULE EVERY 5 SECOND
	COMMENT 'Insert into table currentTimestamp with Current timestamp'
	DO
	BEGIN
		INSERT INTO currentTimestamp values (NOW())
	END 
	
	
	
mysql> SHOW PROCESSLIST\G;
*************************** 1. row ***************************
     Id: 7
   User: root
   Host: localhost
     db: sqlPractise
Command: Query
   Time: 0
  State: starting
   Info: SHOW PROCESSLIST
1 row in set (0.00 sec)



--Event Scheduler Configuration

SET GLOBAL event_scheduler = ON;

mysql> SHOW PROCESSLIST \G;
*************************** 1. row ***************************
     Id: 7
   User: root
   Host: localhost
     db: sqlPractise
Command: Query
   Time: 0
  State: starting
   Info: SHOW PROCESSLIST
*************************** 2. row ***************************
     Id: 8
   User: event_scheduler
   Host: localhost
     db: NULL
Command: Daemon
   Time: 1
  State: Waiting for next activation
   Info: NULL
2 rows in set (0.00 sec)


DROP EVENT updateTimestampEverySec
