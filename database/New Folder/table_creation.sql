-- use bank_System;

CREATE TABLE Branches (
  Branch_ID INT,
  Branch_name VARCHAR(30),
  Branch_Address VARCHAR(100),
  PRIMARY KEY (Branch_ID)
);

CREATE TABLE User_Details (
  User_ID INT,
  Branch_ID INT,
  User_Name VARCHAR(20),
  Password VARCHAR(50),
  Gender ENUM('Male','Female','Other'),
  NIC VARCHAR(12),
  Email VARCHAR(30),
  Contact_No VARCHAR(10),
  PRIMARY KEY (User_ID),
  FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);


CREATE TABLE Employees (
  User_ID INT,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Position ENUM('Manager','Employee'),
  PRIMARY KEY (User_ID),
  FOREIGN KEY (User_ID) REFERENCES User_Details(User_ID)
);

CREATE TABLE Customers (
  Customer_ID INT,
  First_Name VARCHAR(50),
  Last_Name VARCHAR(50),
  Date_Of_Birth DATE,
  NIC VARCHAR(12),
  Address VARCHAR(75),
  Is_Reg_For_Online_Banking BOOLEAN,
  PRIMARY KEY (Customer_ID)
);


CREATE TABLE Customer_Online_Banking_Details (
  Online_banking_ID INT,
  Customer_ID INT,
  User_Name VARCHAR(15),
  Password VARCHAR(20),
  PRIMARY KEY (Online_banking_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Bank_Accounts (
  Acc_No VARCHAR(15),
  Customer_ID INT,
  Branch_ID INT,
  Account_Type ENUM('saving', 'current'),
  Opening_Date DATE,
  Is_Active BOOLEAN,
  PRIMARY KEY (Acc_No),
  FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID),
  FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

CREATE TABLE Current_Accounts (
  Acc_No VARCHAR(15),
  Account_Bal DECIMAL(12,2),
  PRIMARY KEY(Acc_No),
  FOREIGN KEY (Acc_No) REFERENCES Bank_Accounts(Acc_No)
);

CREATE TABLE Saving_Account_Types (
  Type_No TINYINT,
  Person_Type VARCHAR(15),
  Interest_Rate_Annum DECIMAL(4,2),
  Required_Min_Bal DECIMAL(6,2),
  PRIMARY KEY (Type_No)
);

CREATE TABLE Saving_Accounts (
  Acc_No VARCHAR(15),
  Saving_Acc_Type_No TINYINT,
  Acc_Bal DECIMAL(12,2),
  No_Of_Withdrawals INT,
  PRIMARY KEY(Acc_No),
  FOREIGN KEY (Saving_Acc_Type_No) REFERENCES Saving_Account_Types(Type_No),
  FOREIGN KEY (Acc_No) REFERENCES Bank_Accounts(Acc_No)
);

CREATE TABLE FD_Plans (
  Plan_ID TINYINT,
  Interest_Rate_Annum DECIMAL(4,2),
  Duration_By_Months TINYINT,
  PRIMARY KEY (Plan_ID)
);

CREATE TABLE Fixed_deposits (
  Fd_ID INT,
  Saving_acc_No VARCHAR(15),
  FD_Plan_ID TINYINT,
  FD_Opening_date DATE,
  FD_Closing_date DATE ,
  FD_Amount DECIMAL(12,2),
  PRIMARY KEY (Fd_ID),
  FOREIGN KEY (Saving_acc_No) REFERENCES Saving_Accounts(Acc_No),
  FOREIGN KEY (FD_Plan_ID) REFERENCES FD_Plans(Plan_ID)
);

CREATE TABLE Withdrawals (
  Withdraw_ID INT,
  Acc_No VARCHAR(15),
  Withdraw_Time TIMESTAMP,
  Withdraw_Amount DECIMAL(12,2),
  Withdraw_Date DATE,
  PRIMARY KEY (Withdraw_ID),
  FOREIGN KEY (Acc_No) REFERENCES Bank_Accounts(Acc_No)
);

CREATE TABLE Transfers (
  Transfer_ID INT,
  Transfer_Time TIMESTAMP,
  Trans_Amount DECIMAL(12,2),
  From_Acc VARCHAR(15),
  To_Acc VARCHAR(15),
  Transfer_Fee DECIMAL(4,2),
  Remarks VARCHAR(100),
  PRIMARY KEY (Transfer_ID),
  FOREIGN KEY (From_Acc) REFERENCES Bank_Accounts(Acc_No),
  FOREIGN KEY (To_Acc) REFERENCES Bank_Accounts(Acc_No)
);

CREATE TABLE Loan_Details (
  Loan_Detail_ID INT,
  Customer_ID INT,
  Amount DECIMAL(12,2),
  Is_Approved BOOLEAN,
  Starting_Date DATE,
  Closing_Date DATE,
  Interest_Rate DECIMAL(4,2),
  Loan_Type VARCHAR(10),
  PRIMARY KEY (Loan_Detail_ID)
);


CREATE TABLE Online_Portal_Loans (
  Loan_detail_ID INT,
  Fixed_Deposit_ID INT,
  PRIMARY KEY (Loan_detail_ID),
  FOREIGN KEY (Loan_Detail_ID) REFERENCES Loan_Details(Loan_Detail_ID),
  FOREIGN KEY (Fixed_Deposit_ID) REFERENCES Fixed_deposits(Fd_ID)
);


CREATE TABLE Loan_Installments (
  Installment_ID INT,
  Loan_Detail_ID INT,
  Amount DECIMAL(12,2),
  Due_Date DATE,
  Installed_Date DATE,
  Late_Fee DECIMAL(10,2),
  Comments VARCHAR(50),
  PRIMARY KEY (Installment_ID),
  FOREIGN KEY (Loan_Detail_ID) REFERENCES Loan_Details(Loan_Detail_ID)
);


CREATE TABLE Normal_Loans (
  Loan_detail_ID INT,
  Employee_ID INT,
  PRIMARY KEY (Loan_detail_ID),
  FOREIGN KEY (Loan_Detail_ID) REFERENCES Loan_Details(Loan_Detail_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employees(User_ID)
);

