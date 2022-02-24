# Railway Reservation System Database

## Description 

You are hired by a Railway Company, you are asked to design a system which provides
information to passengers about the trains available on the bases of source and destination, other
information like status of the train, status of passenger ticket, how many seats are available etc.
Suppose you are given the following requirements for a simple database for the Railway
Reservation System:

This system helps to maintain the records of different trains, the train’s status, and passengers.
* Each Train has Train number, train name, source, destination, fair of Premium Ticket,
fair for general ticket and weekdays on which train is available.
* Train status includes date information for which the ticket was booked, total number of
seats available and number of seats already occupied.
* Passenger has name, age, address of the passenger, status of reservation (if confirmed or
waitlist), category of the ticket booked.


**Note: As the system is very large and is not feasible to develop therefore there are some
assumptions that need to be considered, for example:**
* Only two categories of tickets are available : Premium and General Ticket.
* The total number of tickets can be booked in each category (Premium and General) is 10.
* Number of tickets in waiting is 2.
* Total Number of trains are 5.
* Any stops made by a train before its final destination and their bookings are not considered.

## Prerequisite Tools
  1. SQLite, for executing the program.
  2. Visual Studio 2019, for writing SQL code and queries.
  3. [FlowChart Maker](https://app.diagrams.net/), for drawing ER diagram.

## Install SQLite
Download packages from [sqlite.org](https://www.sqlite.org/download.html).

## ER Diagram
  1. Construct a clean and concise ER diagram for the RRS database. List your assumptions and clearly indicate the cardinality mappings

![Screenshot 2022-02-22 203815](https://user-images.githubusercontent.com/46115541/155575750-4dfa7e91-e53e-4d52-a4f7-7842ff99e859.png)

## Create Tables 
Using **CREATE** statements to create tables corresponding to the entities in ER diagram in **[RRS.sql](https://github.com/mkhangg/RRS_G10/blob/main/Source_code/RRS.sql) file**:
```python
CREATE TABLE [Train]
(
   [Date] CHAR(10),
   [Train_num] INT  NOT NULL,
   [Train_name] NVARCHAR(200),
   [Source] NVARCHAR(150) NOT NULL,
   [Destination] NVARCHAR(150) NOT NULL,
   [Weekday] NVARCHAR(200),
   [Pre_available] INT,
   [Gen_available] INT,
   [Pre_occupied] INT,
   [Gen_occupied] INT,
   [Waitlist] INT,
   [Pre_fair] REAL,
   [Gen_fair] REAL,
   [Ticket_num] INT NOT NULL,
   CONSTRAINT [PK_Train] PRIMARY KEY ([Train_num]),
   FOREIGN KEY ([Ticket_num]) REFERENCES [Ticket] ([Ticket_num])
);

CREATE TABLE [Ticket]
(
   [Ticket_num] INT NOT NULL,
   [Ticket_category] CHAR(7),
   [Status] NVARCHAR(8) NOT NULL,
   [Train_num] INT NOT NULL,
   [Train_name] NVARCHAR(200),
   [Ssn] INT NOT NULL,
   CONSTRAINT [PK_Ticket] PRIMARY KEY ([Ticket_num]),
   FOREIGN KEY ([Train_num]) REFERENCES [Ticket] ([Train_num]),
   FOREIGN KEY ([Train_name]) REFERENCES [Train] ([Train_name]),
   FOREIGN KEY ([Ssn]) REFERENCES [Passenger] ([Ssn])
);

CREATE TABLE [Passenger]
(
   [Fname] NVARCHAR(100) NOT NULL,
   [Lname] NVARCHAR(100) NOT NULL,
   [Age] INT,
   [Street] NVARCHAR(150),
   [City] NVARCHAR(50),
   [County] NVARCHAR(50),
   [Phone_num] CHAR(12),
   [Ssn] INT NOT NULL,
   CONSTRAINT [PK_Ssn] PRIMARY KEY ([Ssn])
);
```
Using **CREATE INDEX** to create foreign keys between tables:
```python
CREATE INDEX [IFK_Train] ON [Train] ([Train_num]);
CREATE INDEX [IFK_Ticket] ON [Ticket] ([Ticket_num]);
CREATE INDEX [IFK_Passenger] ON [Passenger] ([Ssn]);
```

## Load Data into Database
Using **INSERT INTO** to load data into the Database; for example, inserting an element into TRAIN, inserting an element into TICKET, inserting an element into PASSENGER, respectively: 
```python
INSERT INTO [Train] ([Date], [Ticket_num], [Train_num], [Train_name], [Pre_fair], [Gen_fair], [Pre_available], [Pre_occupied], [Gen_available], [Gen_occupied], [Waitlist], [Source], [Destination], [Weekday]) 
            VALUES ('19/02/2022', 1, 1, 'Orient Express', 800, 600, 10, 0, 10, 0, 0, 'Paris', 'Istanbul', 'Monday, Tuesday, Wednesday, Thursday, Friday');
            
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (1, 264816896, 3, 'Premium', 'Booked');
           
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('James', 'Butt',54 , '6649 N Blue Gum St', 'New Orleans', 'Orleans', '504-845-1427', 264816896);
```

## SQL Queries
  Write SQL queries to get the results of the following queries: 

  2. Enter a train name and retrieve all the passengers with confirmed status travelling in that train.
  ```python
  SELECT PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Status
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Train_name = 'Flying Scotsman' AND TRAIN.Train_num = TICKET.train_num AND TICKET.SSN = PASSENGER.SSN AND TICKET.Status = 'Booked';
  ```
  The output is [query1.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query1.txt) file.
  
  3. List all the trains where the waiting list is full along with passengers on the waiting list in descending order.
  ```python
  SELECT TRAIN.Train_name, PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Status
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Waitlist > 2 AND TRAIN.Train_num = Ticket.Train_num AND TICKET.Status = 'WaitL' AND TICKET.Ssn = PASSENGER.Ssn
  order by Fname desc;
  ```
  The output is [query2.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query2.txt) file.
  
  4. Cancel a ticket (delete a record) and confirm that a passenger on the waiting list gets a ticket status confirmation.
   ```python
  SELECT Ssn, Train_num, Ticket_category, Status FROM TICKET;
  SELECT Train_name, Train_num, Waitlist FROM TRAIN WHERE Train_num = 3;

  DELETE FROM TICKET
  WHERE Ssn = '264816896' AND Train_num = 3 AND Status = 'Premium';

  UPDATE TICKET
  SET Status = 'Booked'
  WHERE Ssn = '256558303' AND Train_num = 3 AND Status = 'Premium';

  UPDATE TRAIN 
  SET Waitlist = Waitlist - 1
  WHERE Train_num = 3;

  SELECT Ssn, Train_num, Ticket_category, Status FROM TICKET;
  SELECT Train_name, Train_num, Waitlist FROM TRAIN WHERE Train_num = 3;
  ```
  The output is [query3.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query3.txt) file.
  
  5. List the passengers travelling on Sunday with confirmed tickets.
  ```python
  SELECT distinct PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Status
  FROM TRAIN, PASSENGER, TICKET
  WHERE TICKET.Status = 'Booked' AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Train_num = TRAIN.Train_num AND TRAIN.Weekday LIKE '%Sunday%';
  ```
  The output is [query4.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query4.txt) file.
  
  6. For each train, list the train’s name and the number of occupied and available seats.
  ```python
  SELECT Train_name, Pre_available, Gen_available, Pre_occupied, Gen_occupied
  FROM TRAIN;
  ```
  The output is [query5.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query5.txt) file.
  
  7. Enter the passenger’s last name and first name and retrieve all trains they are booked on.
  ```python
  SELECT PASSENGER.Fname, PASSENGER.Lname, TRAIN.Train_name, TICKET.Status
  FROM TRAIN, PASSENGER, TICKET
  WHERE PASSENGER.Fname = 'Art' AND PASSENGER.Lname = 'Venere' AND PASSENGER.Ssn = TICKET.Ssn AND TICKET.Train_num = TRAIN.Train_num;
  ```
  The output is [query6.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query6.txt) file.
  
  8. Get the train information (Train Number, Train Name, Source and Destination) and passenger information (Name, Address, Category, ticket status) of passengers who are between the ages of 50 to 60.
  ```python
  SELECT TRAIN.Train_num, TRAIN.Train_name, TRAIN.Source, TRAIN.Destination, PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Age, PASSENGER.Street, PASSENGER.City, PASSENGER.County, TICKET.Ticket_category, TICKET.Status
  FROM TRAIN, PASSENGER, TICKET
  WHERE PASSENGER.Age <= 60 AND PASSENGER.Age >= 50 AND PASSENGER.Ssn = TICKET.Ssn AND TICKET.Train_num = TRAIN.Train_num;
  ```
  The output is [query7.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query7.txt) file.
  
  9. List all the train name along with count of passengers it is carrying.
  ```python
  SELECT TRAIN.Train_name, TRAIN.Pre_occupied + TRAIN.Gen_occupied
  FROM TRAIN;
  ```
  The output is [query8.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query8.txt) file.
  
  10. List all passengers who are travelling on Saturday and Sunday and are using premium service.
  
  10.a Not using INTERSECT statement:
  ```python
  SELECT distinct PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Ticket_category
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Weekday LIKE '%Saturday, Sunday%' AND TRAIN.Train_num = TICKET.Train_num AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Ticket_category = 'Premium';
  ```
  The output is [query9a.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query9a.txt) file.
  
  10.b Using INTERSECT statement:
  ```python
  SELECT distinct PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Ticket_category
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Weekday LIKE '%Saturday%' AND TRAIN.Train_num = TICKET.Train_num AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Ticket_category = 'Premium'

  INTERSECT

  SELECT distinct PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Ticket_category
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Weekday LIKE '%Sunday%' AND TRAIN.Train_num = TICKET.Train_num AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Ticket_category = 'Premium';
  ```
  The output is [query9b.txt](https://github.com/mkhangg/RRS_G10/blob/main/Queries_Outputs/query9b.txt) file.
  
  Either of them is used, the output queries are the same.
  
 ## Running
 After creating the [RRS.sql](https://github.com/mkhangg/RRS_G10/blob/main/Source_code/RRS.sql) file and the SQL queries, we can test the queries using the following command:
 ```python
 .read RRS.sql
  ```
  and then jot down any queries that are needed to test (like above). The results are in [Queries_Outputs](https://github.com/mkhangg/RRS_G10/tree/main/Queries_Outputs) folder.

## Contributors
  1. Khang Nguyen
  2. Sao Nguyen
  3. Ashlei Burrola

### Contribution List:
  1. Draw ER Diagram [Sao - 80%, Khang - 10%, Ashlei - 10%]
  2. Establish Tables [Sao - 40%, Khang - 40%, Ashlei - 20%]
  3. Load Data [Sao - 40%, Khang - 40%, Ashlei - 20%]
  4. Write Queries [Khang - 65%, Sao - 25%, Ashlei - 10%]
  5. Testing Ouputs [Ashlei - 90%, Sao - 10%]
  6. Write README.md [Khang - 70%, Sao - 30%]

