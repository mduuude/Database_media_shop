CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_archive_orders_over_91d`()
BEGIN
	INSERT INTO `order_item_arcive`
	SELECT * FROM `order_item`
    WHERE `order_item`.`date` < (NOW() - INTERVAL 91 DAY);
    
    DELETE FROM `order_item`
    WHERE `order_item`.`date` < (NOW() - INTERVAL 91 DAY);
END