
DELIMITER $$

CREATE PROCEDURE `update_fd_interest`()
BEGIN
	-- declare variables
	DECLARE count INT DEFAULT 0;
    DECLARE i INT DEFAULT 0;
	DECLARE interest DECIMAL(12,2) DEFAULT 0.0;
    DECLARE acc_no VARCHAR(15) DEFAULT NULL;
    
    SELECT COUNT(*) FROM fixed_deposits INTO count;
    
    SET i = 0;
    WHILE (i < count) DO
    
		-- find Account number and calculate interest
        SELECT get_interest(fd.FD_Amount, fd.FD_Plan_ID) ,fd.Saving_acc_No
		FROM fixed_deposits fd
		WHERE DATEDIFF(CURRENT_DATE(), fd.FD_Opening_date) % 30 = 0
		LIMIT i,1
        INTO interest, acc_no;
        
        -- update saving accounts
		UPDATE saving_accounts sa
		SET Acc_Bal = Acc_Bal + interest
		WHERE (sa.Acc_No = acc_no);
        
        SET i = i + 1;
        
	END WHILE;
END$$

DELIMITER ;