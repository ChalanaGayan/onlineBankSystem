-- branches table
INSERT INTO branches (Branch_ID, Branch_Name, Branch_Address)
VALUES
    (101, 'Colombo Central Branch', '123, Galle Road, Colombo 03, Sri Lanka'),
    (102, 'Kandy Main Branch', '456, Peradeniya Road, Kandy, Sri Lanka'),
    (103, 'Galle Coastal Branch', '789, Matara Road, Galle, Sri Lanka');
    
    
-- user details
INSERT INTO user_details (User_ID, Branch_ID, User_Name, Password, Gender, NIC, Email, Contact_No)
VALUES
    (1, 101, 'User1', MD5('password1'), 'Male', '200123456789', 'user1@bank.com', '0712345678'),
    (2, 101, 'User2', MD5('password2'), 'Female', '191234567890', 'user2@bank.com', '0723456789'),
    (3, 101, 'User3', MD5('password3'), 'Male', '200987654321', 'user3@bank.com', '0712345670'),
    (4, 102, 'User4', MD5('password4'), 'Female', '190987654322', 'user4@bank.com', '0723456781'),
    (5, 101, 'User5', MD5('password5'), 'Other', '200112233445', 'user5@bank.com', '0712345672'),
    (6, 101, 'User6', MD5('password6'), 'Male', '191122334455', 'user6@bank.com', '0723456783'),
    (7, 102, 'User7', MD5('password7'), 'Female', '200998877665', 'user7@bank.com', '0712345674'),
    (8, 101, 'User8', MD5('password8'), 'Male', '200776655443', 'user8@bank.com', '0723456785'),
    (9, 102, 'User9', MD5('password9'), 'Female', '190011223344', 'user9@bank.com', '0712345676'),
    (10, 102, 'User10', MD5('password10'), 'Male', '200099887766', 'user10@bank.com', '0723456787');
    


-- employees table
INSERT INTO employees (User_ID, First_Name, Last_Name, Position)
VALUES
    (1, 'Saman', 'Perera', 'Manager'),
    (2, 'Kumari', 'Silva', 'Employee'),
    (3, 'Nimal', 'Fernando', 'Employee'),
    (4, 'Malini', 'Fonseka',  'Manager'),
    (5, 'Rohan', 'Bandara', 'Employee'),
    (6, 'Chathura', 'Ratnayake', 'Employee'),
    (7, 'Lakshika', 'Gunawardhana', 'Employee'),
    (8, 'Hasitha', 'Rajapaksa', 'Employee'),
    (9, 'Ishara', 'Fernando', 'Employee'),
    (10, 'Indika', 'Jayawardena', 'Employee');
    

-- customer table
INSERT INTO customers (Customer_ID, First_Name, Last_Name, Date_Of_Birth, NIC, Address, Is_Reg_For_Online_Banking)
VALUES
    (1001, 'Saman', 'Silva', '1990-05-15', '199005123456', '123, Main Street, Colombo, Sri Lanka', FALSE),
    (1002, 'Nimal', 'Fernando', '1995-08-21', '199508123456', '456, Park Road, Kandy, Sri Lanka', FALSE),
    (1003, 'Kumari', 'Perera', '2000-12-03', '200012123456', '789, Beach Avenue, Galle, Sri Lanka', FALSE),
    (1004, 'Rohan', 'Jayawardena', '2005-03-07', '200503123456', '101, River Lane, Negombo, Sri Lanka', FALSE),
    (1005, 'Malini', 'Gunawardhana', '2010-11-14', '201011123456', '222, Hillside Drive, Jaffna, Sri Lanka', FALSE),
    (1006, 'Chathura', 'Bandara', '2015-07-29', '201507123456', '333, Sea View, Trincomalee, Sri Lanka', FALSE),
    (1007, 'Indika', 'Fonseka', '1965-02-09', '196502123456', '444, Forest Road, Anuradhapura, Sri Lanka', FALSE),
    (1008, 'Lakshika', 'Rajapaksa', '1970-12-17', '197012123456', '555, Mountain View, Badulla, Sri Lanka', FALSE),
    (1009, 'Hasitha', 'Perera', '1980-06-25', '198006123456', '666, Lake Side, Ratnapura, Sri Lanka', FALSE),
    (1010, 'Ishara', 'Fernando', '1985-09-30', '198509123456', '777, Riverside, Matara, Sri Lanka', FALSE),
    (1011, 'Kasun', 'Samaraweera', '1992-04-11', '199204123456', '888, Valley Road, Kurunegala, Sri Lanka', FALSE),
    (1012, 'Sachini', 'Fernando', '1997-10-01', '199710123456', '999, Green Lane, Hambantota, Sri Lanka', FALSE),
    (1013, 'Sanjeewa', 'Perera', '2002-07-19', '200207123456', '111, Coconut Grove, Kalutara, Sri Lanka', FALSE),
    (1014, 'Tharanga', 'Jayasuriya', '2007-11-26', '200711123456', '222, Pine Street, Matale, Sri Lanka', FALSE),
    (1015, 'Chamara', 'Rathnayake', '2012-03-02', '201203123456', '333, Orchid Road, Nuwara Eliya, Sri Lanka', FALSE),
    (1016, 'Nirosha', 'Fernando', '2017-09-10', '201709123456', '444, Sunflower Avenue, Batticaloa, Sri Lanka', FALSE),
    (1017, 'Dilanka', 'Perera', '1960-12-31', '196012123456', '555, Rose Street, Polonnaruwa, Sri Lanka', FALSE),
    (1018, 'Sandun', 'Fonseka', '1967-05-08', '196705123456', '666, Jasmine Lane, Ampara, Sri Lanka', FALSE),
    (1019, 'Thushara', 'Bandara', '1975-08-14', '197508123456', '777, Tulip Road, Vavuniya, Sri Lanka', FALSE),
    (1020, 'Nimesha', 'Jayawardena', '1989-11-23', '198911123456', '888, Lily Drive, Kurunegala, Sri Lanka', FALSE);
    

-- customer_online_banking_details table 
INSERT INTO customer_online_banking_details (Online_banking_ID, Customer_ID, User_Name, Password)
VALUES
    (1, 1001, 'saman_silva', 'password_1'),
    (2, 1002, 'nimal_fernando', 'password_2'),
    (3, 1003, 'kumari_perera', 'password_3'),
    (4, 1004, 'rohan_jaya', 'password_4'),
    (5, 1007, 'indika_fonseka', 'password_5');
    

-- bank_accounts table
INSERT INTO bank_accounts (Acc_No, Customer_ID, Branch_ID, Account_Type, Opening_Date, Is_Active)
VALUES
    (100001, 1001, 101, 'Current', '2020-03-10', 1),
    (100002, 1002, 102, 'Current', '2021-07-25', 1),
    (100003, 1003, 101, 'Saving', '2021-11-02', 1),
    (100004, 1004, 102, 'Saving', '2022-09-18', 1),
    (100005, 1005, 101, 'Saving', '2021-06-07', 1),
    (100006, 1006, 102, 'Saving', '2020-12-29', 1),
    (100007, 1007, 101, 'Current', '2021-01-15', 1),
    (100008, 1008, 102, 'Current', '2022-04-30', 1),
    (100009, 1009, 101, 'Saving', '2020-08-21', 1),
    (100010, 1010, 102, 'Saving', '2020-05-03', 1),
    (100011, 1011, 101, 'Current', '2021-08-14', 1),
    (100012, 1012, 102, 'Saving', '2022-01-27', 1),
    (100013, 1013, 101, 'Saving', '2022-09-03', 1),
    (100014, 1014, 102, 'Saving', '2021-12-19', 1),
    (100015, 1015, 101, 'Saving', '2020-02-28', 1),
    (100016, 1016, 102, 'Saving', '2020-08-10', 1),
    (100017, 1017, 101, 'Current', '2021-03-04', 1),
    (100018, 1018, 102, 'Saving', '2020-06-22', 1),
    (100019, 1019, 101, 'Saving', '2022-02-07', 1),
    (100020, 1020, 102, 'Current', '2020-10-12', 1);


-- current_accounts table
INSERT INTO current_accounts (Acc_No, Account_Bal)
VALUES
    (100001, 9874510.29),
    (100002, 68711200.47),
    (100007, 9844544.73),
    (100008, 845021.00),
    (100011, 2210.56),
    (100017, 11236.36),
    (100020, 457180.86);
    

-- Saving_Account_Types table
INSERT INTO Saving_Account_Types(Type_No, Person_Type, Interest_Rate_Annum, Required_Min_Bal)
VALUES 
	(1, 'Children',12.00, NULL),
    (2, 'Teen',11.00, 500),
    (3, 'Adult',10.00, 1000),
    (4, 'Senior',13.00, 1000);


-- Saving_Accounts table
INSERT INTO Saving_Accounts (Acc_No, Saving_Acc_Type_No, Acc_Bal, No_Of_Withdrawals)
VALUES
    (100003, 3, 1500.00, 0),
    (100004, 3, 2000.00, 0),
    (100005, 2, 3000.00, 0),
    (100006, 1, 4000.00, 0),
    (100009, 3, 2500.00, 0),
    (100010, 3, 3500.00, 0),
    (100012, 3, 4500.00, 0),
    (100013, 3, 5500.00, 0),
    (100014, 2, 6500.00, 0),
    (100015, 1, 7500.00, 0),
    (100016, 1, 8500.00, 0),
    (100018, 3, 9500.00, 0),
    (100019, 3, 10500.00, 0);


-- fd_plans table
INSERT INTO fd_plans(Plan_ID, Interest_Rate_Annum, Duration_By_Months)
VALUES 
	(1, 13.00, 6),
    (2, 14.00, 12),
    (3, 15.00, 36);
    

-- fixed deposits table
INSERT INTO fixed_deposits(Fd_ID, Saving_acc_No, FD_Plan_ID, FD_Opening_date, FD_Closing_date, FD_Amount)
VALUES
	(1 , 100012, 1, '2023-08-01', '2024-02-01', 100000),
    (2 , 100013, 2, '2023-01-01', '2024-01-01', 80000),
    (3 , 100018, 3, '2021-05-01', '2024-05-01', 150000),
    (4 , 100019, 1, '2023-08-07', '2024-02-07', 40000);
    

-- withdrawal table 
INSERT INTO withdrawals (Withdraw_ID, Acc_No, Withdraw_Time, Withdraw_Amount)
VALUES
	(1001, 100003, '2021-11-03 08:30:00', 500.00),
	(1002, 100005, '2021-09-03 12:45:00', 700.00),
	(1003, 100007, '2022-05-04 16:15:00', 300.00),
	(1004, 100008, '2022-08-05 09:20:00', 1000.00),
	(1005, 100010, '2022-05-06 14:55:00', 200.00),
	(1006, 100012, '2023-07-07 11:10:00', 900.00),
	(1007, 100014, '2022-01-08 17:30:00', 600.00),
	(1008, 100015, '2020-06-09 10:25:00', 800.00),
	(1009, 100020, '2020-12-22 13:40:00', 400.00);
    

-- Loan_details table
INSERT INTO Loan_details (Loan_Detail_ID, Customer_ID, Amount, Is_Approved, Starting_Date, Closing_Date, Interest_Rate, Loan_Type)
VALUES
    (10001, 1013, 120000.00, TRUE, '2023-01-01', '2025-01-01', 10.00, 'Online'),
    (10002, 1018, 90000.00, TRUE, '2023-01-01', '2025-01-01', 10.00, 'Online'),
    (10003, 1001, 300000.00, TRUE, '2023-01-01', '2025-01-01', 10.00, 'Normal'),
    (10004, 1011, 120000.00, TRUE, '2023-01-01', '2025-01-01', 10.00, 'Normal');
    

-- online_portal_loans table
INSERT INTO online_portal_loans(Loan_detail_ID, Fixed_Deposit_ID)
VALUES
	(10001, 2),
    (10002, 3);
    

-- normal_loans table
INSERT INTO normal_loans(Loan_detail_ID, Employee_ID)
VALUES
	(10003, 5),
    (10004, 8);
