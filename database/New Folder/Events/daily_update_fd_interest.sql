DELIMITER $$

CREATE EVENT daily_update_fd_interest
ON SCHEDULE
	EVERY 1 DAY STARTS NOW()
DO BEGIN
	CALL update_fd_interest();
END $$

DELIMITER ;