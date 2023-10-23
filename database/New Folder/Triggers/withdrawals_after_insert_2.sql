-- trigger for update no of withdrawals in daving accounts after a withdrwal
DROP TRIGGER IF EXISTS withdrawals_after_insert_2;

DELIMITER $$

CREATE TRIGGER withdrawals_after_insert_2
	AFTER INSERT ON withdrawals
	FOR EACH ROW
BEGIN
	UPDATE saving_accounts
    SET No_Of_Withdrawals = No_Of_Withdrawals + 1
    WHERE Acc_No = NEW.Acc_No;
END $$
DELIMITER ;
