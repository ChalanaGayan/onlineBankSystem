DELIMITER $$

CREATE FUNCTION `get_interest`(amount DECIMAL(12,2), plan_Id tinyint) RETURNS decimal(12,2)
    READS SQL DATA
BEGIN
	DECLARE interest DECIMAL(12,2) DEFAULT 0.0;
    DECLARE rate DECIMAL(4,2) DEFAULT 0.0;
    
    -- calculate interest rate
	SELECT Interest_Rate_Annum FROM fd_plans fp WHERE fp.Plan_ID = plan_Id INTO rate;
    SELECT (amount * rate) / 1200 INTO interest;
	RETURN interest ;
END$$

DELIMITER ;