-- Trigger for update account balance after withdrawals
DROP TRIGGER IF EXISTS withdrawals_after_insert_1;

DELIMITER $$
CREATE TRIGGER withdrawals_after_insert_1
	AFTER INSERT ON withdrawals
	FOR EACH ROW
BEGIN
    -- update current accounts
    UPDATE current_accounts
    SET Account_Bal = Account_Bal - NEW.Withdraw_Amount
    WHERE Acc_No = NEW.Acc_No;
    
	-- update current accounts
    UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal - NEW.Withdraw_Amount
    WHERE Acc_No = NEW.Acc_No;
END $$
DELIMITER ;