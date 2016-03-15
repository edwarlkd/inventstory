--
-- File generated with SQLiteStudio v3.0.6 on Tue Mar 15 12:55:46 2016
--
-- Text encoding used: windows-1252
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: community
CREATE TABLE community (communityID VARCHAR PRIMARY KEY);

-- Table: newsfeed
CREATE TABLE newsfeed (newsfeedID VARCHAR PRIMARY KEY, communityID VARCHAR, eventID VARCHAR, reminderID VARCHAR, deadlineID VARCHAR);

-- Table: chat
CREATE TABLE chat (chatID VARCHAR PRIMARY KEY, userID VARCHAR, userName STRING);

-- Table: management
CREATE TABLE management (managementID VARCHAR PRIMARY KEY);

-- Table: item
CREATE TABLE item (itemID VARCHAR PRIMARY KEY, itemName STRING, itemDescription STRING, itemQuantity INTEGER, orderID VARCHAR, organizationID VARCHAR);

-- Table: organization
CREATE TABLE organization (organizationID VARCHAR PRIMARY KEY);

-- Table: reminder
CREATE TABLE reminder (reminderID VARCHAR PRIMARY KEY, reminderName STRING, reminderTime TIME, reminderDate DATE, reminderStatus BOOLEAN, eventID VARCHAR, managementID VARCHAR, userID);

-- Table: events
CREATE TABLE events (eventID VARCHAR PRIMARY KEY, managementID VARCHAR, eventName STRING, eventDate DATE, eventStatus BOOLEAN, eventTime TIME);

-- Table: orders
CREATE TABLE orders (orderID VARCHAR PRIMARY KEY, organizationID VARCHAR, orderName STRING, orderDate DATE, orderPrice INTEGER, shippingDate DATE, itemID);

-- Table: user
CREATE TABLE user (userID VARCHAR PRIMARY KEY, userName STRING, userPassword VARCHAR, userPhoneNumber BIGINT, userEmail VARCHAR);

-- Table: deadline
CREATE TABLE deadline (deadlineID PRIMARY KEY, userID, deadlineName STRING, deadlineTime TIME, deadlineDate DATE, deadlineStatus BOOLEAN);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
