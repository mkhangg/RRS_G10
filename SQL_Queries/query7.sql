SELECT TRAIN.Train_num, TRAIN.Train_name, TRAIN.Source, TRAIN.Destination, PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Age, PASSENGER.Street, TICKET.Ticket_category, TICKET.Status
FROM TRAIN, PASSENGER, TICKET
WHERE PASSENGER.Age <= 60 AND PASSENGER.Age >= 50 AND PASSENGER.Ssn = TICKET.Ssn AND TICKET.Train_num = TRAIN.Train_num;
