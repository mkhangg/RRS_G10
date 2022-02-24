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
