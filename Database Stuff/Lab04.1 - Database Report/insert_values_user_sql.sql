--
-- File generated with SQLiteStudio v3.0.6 on Wed Mar 16 10:54:40 2016
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: user
CREATE TABLE user (userID VARCHAR PRIMARY KEY, userName STRING, userPassword VARCHAR, userPhoneNumber BIGINT, userEmail VARCHAR);
INSERT INTO user (userID, userName, userPassword, userPhoneNumber, userEmail) VALUES ('1110', 'apineda2', 'abcd', 1234567890, 'apineda2@ucmerced.edu');
INSERT INTO user (userID, userName, userPassword, userPhoneNumber, userEmail) VALUES ('1111', 'edwarlkd', 'efgh', 1987654321, 'edwarlkd@gmail.com');
INSERT INTO user (userID, userName, userPassword, userPhoneNumber, userEmail) VALUES ('1112', 'msingh8', 'ijkl', 1111111111, 'manmeet21singh@yahoo.com');
INSERT INTO user (userID, userName, userPassword, userPhoneNumber, userEmail) VALUES ('1113', 'wchen', 'mnop', 0, 'wyatt6388@gmail.com');

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
