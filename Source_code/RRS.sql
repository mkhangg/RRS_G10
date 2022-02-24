DROP TABLE IF EXISTS [Train];
DROP TABLE IF EXISTS [Ticket];
DROP TABLE IF EXISTS [Passenger];



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



CREATE INDEX [IFK_Train] ON [Train] ([Train_num]);
CREATE INDEX [IFK_Ticket] ON [Ticket] ([Ticket_num]);
CREATE INDEX [IFK_Passenger] ON [Passenger] ([Ssn]);



INSERT INTO [Train] ([Date], [Ticket_num], [Train_num], [Train_name], [Pre_fair], [Gen_fair], [Pre_available], [Pre_occupied], [Gen_available], [Gen_occupied], [Waitlist], [Source], [Destination], [Weekday]) 
            VALUES ('19/02/2022', 1, 1, 'Orient Express', 800, 600, 10, 0, 10, 0, 0, 'Paris', 'Istanbul', 'Monday, Tuesday, Wednesday, Thursday, Friday');
INSERT INTO [Train] ([Date], [Ticket_num], [Train_num], [Train_name], [Pre_fair], [Gen_fair], [Pre_available], [Pre_occupied], [Gen_available], [Gen_occupied], [Waitlist], [Source], [Destination], [Weekday]) 
            VALUES ('20/02/2022', 2, 2, 'Flying Scotsman', 4000, 3500, 8, 2, 5, 5, 1, 'Edinburgh', 'London', 'Friday, Saturday, Sunday');
INSERT INTO [Train] ([Date], [Ticket_num], [Train_num], [Train_name], [Pre_fair], [Gen_fair], [Pre_available], [Pre_occupied], [Gen_available], [Gen_occupied], [Waitlist], [Source], [Destination], [Weekday]) 
            VALUES ('01/01/2022', 3, 3, 'Golden Arrow', 980, 860, 0, 10, 0, 10, 6, 'Victoria', 'Dover', 'Mon, Tuesday, Wednesday');
INSERT INTO [Train] ([Date], [Ticket_num], [Train_num], [Train_name], [Pre_fair], [Gen_fair], [Pre_available], [Pre_occupied], [Gen_available], [Gen_occupied], [Waitlist], [Source], [Destination], [Weekday])  
            VALUES ('21/02/2022', 4, 4, 'Golden Chariot', 4300, 3800, 6, 4, 3, 7, 0, 'Bangalore', 'Goa', 'Saturday, Sunday');
INSERT INTO [Train] ([Date], [Ticket_num], [Train_num], [Train_name], [Pre_fair], [Gen_fair], [Pre_available], [Pre_occupied], [Gen_available], [Gen_occupied], [Waitlist], [Source], [Destination], [Weekday]) 
            VALUES ('21/02/2022', 5, 5, 'Maharaja Express', 5980, 4510, 7, 3, 6, 4, 0, 'Delhi', 'Munbai', 'Wednesday, Thursday, Friday');



INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (1, 264816896, 3, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (2, 240471168, 2, 'General', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (3, 285200976, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (4, 285200976, 2, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (5, 317434088, 2, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (6, 310908858, 2, 'General', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (7, 322273872, 2, 'General', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (8, 256558303, 3, 'Premium', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (9, 302548590, 2, 'General', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (10, 284965676, 3, 'Premium', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (11, 277292710, 3, 'General', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (12, 331160133, 3, 'General', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (13, 331293204, 3, 'General', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (14, 290123298, 3, 'General', 'WaitL');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (15, 286411536, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (16, 294860856, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (17, 317434088, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (18, 310908858, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (19, 322273872, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (20, 256558303, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (21, 302548590, 4, 'Premium', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (22, 284965676, 4, 'General', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (23, 277292710, 4, 'General', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (24, 331160133, 4, 'General', 'Booked');
INSERT INTO [Ticket] ([Ticket_num], [Ssn], [Train_num], [Ticket_category], [Status]) 
            VALUES (25, 331293204, 4, 'General', 'Booked');



INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('James', 'Butt',54 , '6649 N Blue Gum St', 'New Orleans', 'Orleans', '504-845-1427', 264816896);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Josephine', 'Darakjy',47 , '4 B Blue Ridge Blvd', 'Brighton', 'Livingston', '810-374-9840', 240471168);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Art', 'Venere',40 , '8 W Cerritos Ave #54', 'Bridgeport', 'Gloucester', '856-264-4130', 285200976);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Lenna', 'Paprocki',44 , '639 Main St', 'Anchorage', 'Anchorage', '907-921-2010', 309323096);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Donette', 'Foller',32 , '34 Center St', 'Hamilton', 'Butler', '513-549-4561', 272610795);  
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Simona', 'Morasca',58 , '3 Mcauley Dr', 'Ashland', 'Ashland', '419-800-6759', 250951162);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Mitsue', 'Tollner',38 , '7 Eads St', 'Chicago', 'Cook', '773-924-8565', 272913578);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Leota', 'Dilliard',31 , '7 W Jackson Blvd', 'San Jose', 'Santa Clara', '408-813-1105', 268682534);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Sage', 'Wieser',40 , '5 Boston Ave #88', 'Sioux Falls', 'Minnehaha', '605-794-4895', 310908858);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Kris', 'Marrier',66 , '228 Runamuck Pl #2808', 'Baltimore', 'Baltimore City', '410-804-4694', 322273872);   
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Minna', 'Amigon',27 , '2371 Jerrold Ave', 'Kulpsville', 'Montgomery', '215-422-8694', 256558303);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Abel', 'Maclead',62 , '37275 St  Rt 17m M', 'Middle Island', 'Suffolk', '631-677-3675', 302548590);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Kiley', 'Caldarera',41 , '25 E 75th St #69', 'Los Angeles', 'Los Angeles', '310-254-3084', 284965676);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Graciela', 'Ruta',40 , '98 Connecticut Ave Nw', 'Chagrin Falls', 'Geauga', '440-579-7763', 277292710);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Cammy', 'Albares',66 , '56 E Morehead St', 'Laredo', 'Webb', '956-841-7216', 331160133);  
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Mattie', 'Poquette',27 , '73 State Road 434 E', 'Phoenix', 'Maricopa', '602-953-6360', 331293204);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Meaghan', 'Garufi',62 , '69734 E Carrillo St', 'Mc Minnville', 'Warren', '931-235-7959', 290123298);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Gladys', 'Rim',31 , '322 New Horizon Blvd', 'Milwaukee', 'Milwaukee', '414-377-2880', 286411536);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Yuki', 'Whobrey',37 , '1 State Route 27', 'Taylor', 'Wayne', '313-341-4470', 294860856);
INSERT INTO [Passenger] ([Fname], [Lname],[age], [Street], [City], [County], [Phone_num], [Ssn]) 
            VALUES ('Fetcher', 'Flosi',61 , '394 Manchester Blvd', 'Rockford', 'Winnebago', '815-426-5657', 317434088);                                                                                                                             
