CREATE DATABASE `db_iobroker` DEFAULT CHARACTER SET = `utf8`;

CREATE USER 'iobroker_user'@'%' IDENTIFIED BY 'Test1234';

REVOKE CREATE ROUTINE, CREATE VIEW, CREATE USER, ALTER, SHOW VIEW, CREATE, ALTER ROUTINE, EVENT, SUPER, INSERT, RELOAD, SELECT, DELETE, FILE, SHOW DATABASES, TRIGGER, SHUTDOWN, REPLICATION CLIENT, GRANT OPTION, PROCESS, REFERENCES, UPDATE, DROP, REPLICATION SLAVE, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES, INDEX ON *.* FROM 'fhemuser'@'%';

UPDATE mysql.user SET max_questions = 0, max_updates = 0, max_connections = 0 WHERE User = 'iobroker_user' AND Host = '%';

GRANT CREATE ROUTINE, CREATE VIEW, ALTER, SHOW VIEW, CREATE, ALTER ROUTINE, EVENT, INSERT, SELECT, DELETE, TRIGGER, GRANT OPTION, REFERENCES, UPDATE, DROP, EXECUTE, LOCK TABLES, CREATE TEMPORARY TABLES, INDEX ON `db_iobroker` TO 'iobroker_user'@'%';


FLUSH PRIVILEGES;