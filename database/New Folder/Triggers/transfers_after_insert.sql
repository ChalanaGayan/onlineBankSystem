-- Update account balances after a transfer
DROP TRIGGER IF EXISTS transfers_after_insert;

DELIMITER $$
CREATE TRIGGER transfers_after_insert
	AFTER INSERT ON transfers
	FOR EACH ROW
    
BEGIN
	-- If from acoount is a saving account
	UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal - NEW.Trans_Amount
    WHERE Acc_No = NEW.From_Acc;
    
    -- If to acoount is a saving account
	UPDATE saving_accounts
    SET Acc_Bal = Acc_Bal + NEW.Trans_Amount
    WHERE Acc_No = NEW.To_Acc;
    
    -- If from acoount is a current account
	UPDATE current_accounts
    SET Account_Bal = Account_Bal - NEW.Trans_Amount
    WHERE Acc_No = NEW.From_Acc;
    
    -- If to acoount is a current account
	UPDATE current_accounts
    SET Account_Bal = Account_Bal + NEW.Trans_Amount
    WHERE Acc_No = NEW.To_Acc;
END $$
DELIMITER ;