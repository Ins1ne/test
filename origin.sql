CREATE DATABASE origin_db DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;
CREATE USER 'replica'@'%' IDENTIFIED BY 'kRBo7ql6qFPVWV';
CREATE USER 'deploy'@'%' IDENTIFIED BY 'IXJ8MvXA4TnNdE';
GRANT ALL PRIVILEGES ON origin_db.* TO 'deploy'@'localhost';
GRANT ALL PRIVILEGES ON origin_db.* TO 'deploy'@'%';
GRANT RELOAD ON *.* TO 'deploy'@'localhost';
GRANT RELOAD ON *.* TO 'deploy'@'%';
GRANT REPLICATION SLAVE ON *.* TO 'replica'@'localhost';
GRANT REPLICATION SLAVE ON *.* TO 'replica'@'%';
FLUSH PRIVILEGES;