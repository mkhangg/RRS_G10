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
* Only two categories of tickets are available : Premium and General Ticket
* The total number of tickets can be booked in each category (Premium and General) is 10
* Number of tickets in waiting is 2
* Total Number of trains are 5
* Any stops made by a train before its final destination and their bookings are not considered.

## Installation
Download packages from [sqlite.org](https://www.sqlite.org/download.html)

## Part 1: ER Diagram
  1. Construct a clean and concise ER diagram for the RRS database. List your assumptions and clearly indicate the cardinality mappings

![Screenshot 2022-02-22 203815](https://user-images.githubusercontent.com/46115541/155575750-4dfa7e91-e53e-4d52-a4f7-7842ff99e859.png)

## Part 2: SQL Queries
  Write SQL queries to get the results of the following queries: 

  2. Enter a train name and retrieve all the passengers with confirmed status travelling in that train.
  ```python
  SELECT Fname, Lname
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Train_name = 'Flying Scotsman' AND TRAIN.Train_num = TICKET.train_num AND TICKET.SSN = PASSENGER.SSN AND TICKET.Status = 'Booked';
  ```
  3. List all the trains where the waiting list is full along with passengers on the waiting list in descending order.
  ```python
  SELECT TRAIN.Train_name, PASSENGER.Fname, PASSENGER.Lname
  FROM TRAIN, PASSENGER, TICKET
  WHERE TRAIN.Waitlist > 2 AND TRAIN.Train_num = Ticket.Train_num AND TICKET.Status = 'WaitL' AND TICKET.Ssn = PASSENGER.Ssn
  order by Fname desc;
  ```
  4. Cancel a ticket (delete a record) and confirm that a passenger on the waiting list gets a ticket status confirmation.
   ```python
  DELETE FROM TICKET
  WHERE Ssn = '264816896';

  UPDATE TICKET
  SET Status = 'Booked'
  WHERE Ssn = '256558303';

  UPDATE TRAIN 
  SET Waitlist = Waitlist - 1;
  ```
  5. List the passengers travelling on Sunday with confirmed tickets.
  ```python
  SELECT distinct PASSENGER.Fname, PASSENGER.Lname
  FROM TRAIN, PASSENGER, TICKET
  WHERE TICKET.Status = 'Booked' AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Train_num = TRAIN.Train_num AND TRAIN.Weekday LIKE '%Sunday%';
  ```
  6. For each train, list the train’s name and the number of occupied and available seats.
  ```python
  SELECT Train_name, Pre_available, Gen_available, Pre_occupied, Gen_occupied
  FROM TRAIN;
  ```
  7. Enter the passenger’s last name and first name and retrieve all trains they are booked on.
  ```python
  SELECT TRAIN.Train_name
  FROM TRAIN, PASSENGER, TICKET
  WHERE PASSENGER.Fname = 'Art' AND PASSENGER.Lname = 'Venere' AND PASSENGER.Ssn = TICKET.Ssn AND TICKET.Train_num = TRAIN.Train_num;
  ```
  8. Get the train information (Train Number, Train Name, Source and Destination) and passenger information (Name, Address, Category, ticket status) of passengers who are between the ages of 50 to 60.
  ```python
  SELECT TRAIN.Train_num, TRAIN.Train_name, TRAIN.Source, TRAIN.Destination, PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Street, TICKET.Ticket_category, TICKET.Status
  FROM TRAIN, PASSENGER, TICKET
  WHERE PASSENGER.Age <= 60 AND PASSENGER.Age >= 50 AND PASSENGER.Ssn = TICKET.Ssn AND TICKET.Train_num = TRAIN.Train_num;
  ```
  9. List all the train name along with count of passengers it is carrying.
  ```python
  SELECT TRAIN.Train_name, TRAIN.Pre_occupied + TRAIN.Gen_occupied
  FROM TRAIN;
  ```
  10. List all passengers who are travelling on Saturday and Sunday and are using premium service.
  ```python
  SELECT PASSENGER.Fname, PASSENGER.Lname
  FROM TRAIN, PASSENGER, TICKET
  WHERE TICKET.Ticket_category = 'Premium' AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Train_num = TRAIN.Train_num AND TRAIN.Weekday LIKE '%Sunday%' AND TRAIN.Weekday LIKE     '%Saturday%';
  ```


