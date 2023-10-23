-- Add loan amount to saving account balance after a loan approved
DROP TRIGGER IF EXISTS loan_details_after_insert;

DELIMITER $$

CREATE TRIGGER loan_details_after_insert
	AFTER INSERT ON loan_details
    FOR EACH ROW

BEGIN
	UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal + NEW.Amount
	WHERE Acc_No = (SELECT Acc_No FROM bank_accounts WHERE Customer_ID = NEW.Customer_ID);
END $$

DELIMITER ;