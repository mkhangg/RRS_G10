SELECT TRAIN.Train_name, PASSENGER.Fname, PASSENGER.Lname, PASSENGER.Ssn, TICKET.Status
FROM TRAIN, PASSENGER, TICKET
WHERE TRAIN.Waitlist > 2 AND TRAIN.Train_num = Ticket.Train_num AND TICKET.Status = 'WaitL' AND TICKET.Ssn = PASSENGER.Ssn
order by Fname desc;
