CREATE DEFINER=`root`@`localhost` PROCEDURE `most_loyal_customers`()
BEGIN
SELECT `customer`.`name` AS `customer_name`,
		COUNT(DISTINCT `order_item`.`id`) AS `num_of_orders`,
		AVG (`rating`.`rate`) AS `avg_cust_rate_of_products`
FROM `customer` 
JOIN `order_item` ON `customer`.`id` = `order_item`.`customer_id`
LEFT JOIN `rating` ON `customer`.`id` = `rating`.`customer_id`
JOIN `product_price` ON `order_item`.`product_price_id` = `product_price`.`id`
JOIN `product` ON `product_price`.`product_id` = `product`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
GROUP BY `customer_name`
ORDER BY `num_of_orders` DESC, `avg_cust_rate_of_products` DESC;
END