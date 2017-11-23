CREATE DEFINER=`root`@`localhost` PROCEDURE `managers_efficience`()
BEGIN
DROP TABLE IF EXISTS `temp`;
    
CREATE TEMPORARY TABLE `temp`   
SELECT DISTINCT `manager`.`id`,
	`manager`.`name`, 
	COUNT(DISTINCT `order_item`.`date`) AS `worked_days`
FROM `manager`
JOIN `order_item` ON `order_item`.`manager_id` = `manager`.`id`
GROUP BY `manager`.`id`;

SELECT `manager`.`name`,
	SUM(`order_item`.`quantity`) AS `num_of_orders`,
    `temp`.`worked_days`,
	(SUM(`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`order_item`.`id`))) AS `revenue`
FROM `manager`
JOIN `temp` ON `manager`.`id` = `temp`.`id`
JOIN `order_item` ON `order_item`.`manager_id` = `manager`.`id`
JOIN `product_price` ON `order_item`.`product_price_id` = `product_price`.`id`
JOIN `product` ON `product_price`.`product_id` = `product`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
GROUP BY `manager`.`name`
ORDER BY `num_of_orders` DESC;
END