-- Create Members table
CREATE TABLE Members (
    member_id INT PRIMARY KEY,
    name VARCHAR(255),
    birthdate DATE,
    email VARCHAR(255),
    phone_number VARCHAR(15)
);

-- Insert data into Members table
INSERT INTO Members (member_id, name, birthdate, email, phone_number)
VALUES
    (1, 'John Doe', '1980-05-15', 'johndoe@email.com', '555-123-4567'),
    (2, 'Jane Smith', '1992-08-22', 'janesmith@email.com', '555-987-6543'),
    -- Add more member records here...

-- Create Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    member_id INT,
    balance DECIMAL(10, 2),
    account_type VARCHAR(50)
);

-- Insert data into Accounts table
INSERT INTO Accounts (account_id, member_id, balance, account_type)
VALUES
    (101, 1, 5000.00, 'Savings'),
    (102, 2, 10000.00, 'Checking'),
    -- Add more account records here...

-- Create Loans table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    loan_amount DECIMAL(10, 2),
    loan_type VARCHAR(50)
);

-- Insert data into Loans table
INSERT INTO Loans (loan_id, member_id, loan_amount, loan_type)
VALUES
    (201, 1, 1000.00, 'Personal'),
    (202, 2, 5000.00, 'Mortgage'),
    -- Add more loan records here...

-- Alter the Members table to add a gender column
ALTER TABLE Members
ADD gender VARCHAR(10);

-- Update gender values based on a condition (this is just an example)
UPDATE Members
SET gender = 'Male'
WHERE name = 'John Doe';

-- Clean and transform data (example: removing special characters from email)
UPDATE Members
SET email = REPLACE(email, '@', '_at_');

-- Create a view with CTEs for data visualization
CREATE VIEW CreditUnionData AS
WITH MemberLoanSummary AS (
    SELECT
        M.name AS member_name,
        L.loan_type,
        SUM(L.loan_amount) AS total_loan_amount
    FROM Members M
    JOIN Loans L ON M.member_id = L.member_id
    GROUP BY M.name, L.loan_type
),
AccountBalanceSummary AS (
    SELECT
        M.name AS member_name,
        A.account_type,
        SUM(A.balance) AS total_balance
    FROM Members M
    JOIN Accounts A ON M.member_id = A.member_id
    GROUP BY M.name, A.account_type
)
SELECT
    M.member_id,
    M.name,
    M.birthdate,
    M.gender,
    M.email,
    M.phone_number,
    ALS.account_type,
    ALS.total_balance,
    MLS.loan_type,
    MLS.total_loan_amount
FROM Members M
LEFT JOIN MemberLoanSummary MLS ON M.name = MLS.member_name
LEFT JOIN AccountBalanceSummary ALS ON M.name = ALS.member_name;

-- Query the view for data visualization
SELECT * FROM CreditUnionData;
