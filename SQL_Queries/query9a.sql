SELECT distinct PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Ticket_category
FROM TRAIN, PASSENGER, TICKET
WHERE TRAIN.Weekday LIKE '%Saturday, Sunday%' AND TRAIN.Train_num = TICKET.Train_num AND TICKET.Ssn = PASSENGER.Ssn AND TICKET.Ticket_category = 'Premium';
