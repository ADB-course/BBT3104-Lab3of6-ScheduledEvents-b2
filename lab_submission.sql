-- CREATE EVN_average_customer_waiting_time_every_1_hour
DELIMITER $$

CREATE EVENT EVN_average_customer_waiting_time_every_1_hour
ON SCHEDULE EVERY 1 HOUR
STARTS CURRENT_TIMESTAMP
DO
BEGIN
    INSERT INTO customer_service_kpi (customer_service_KPI_average_waiting_time_minutes)
    SELECT AVG(customer_service_total_wait_time_minutes)
    FROM customer_service_ticket
    WHERE customer_service_ticket_raise_time >= NOW() - INTERVAL 1 HOUR;
END $$

DELIMITER ;