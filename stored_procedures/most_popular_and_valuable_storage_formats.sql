CREATE DEFINER=`root`@`localhost` PROCEDURE `most_popular_and_valuable_storage_formats`()
BEGIN
SELECT `storage_format`.`name`, 
	SUM(`order_item`.`quantity`) AS `num_of_orders`,
	(SUM(`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`order_item`.`id`))) AS `revenue`
FROM `storage_format`
JOIN `product` ON `storage_format`.`id` = `product`.`storage_format_id`
JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
JOIN `order_item` ON `order_item`.`product_price_id` = `product_price`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
GROUP BY `storage_format`.`name`
ORDER BY `num_of_orders` DESC, `revenue` DESC;
END