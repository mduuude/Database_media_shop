-- find revenue of every customer from kyiv and odesa, revenue of clients from each city and total revenue

SELECT `customer`.`city`,
	`customer`.`name`,
	(SUM(`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`order_item`.`id`))) AS `revenue`
FROM `order_item`
JOIN `customer` ON `order_item`.`customer_id` = `customer`.`id`
JOIN `product_price` ON `order_item`.`product_price_id` = `product_price`.`id`
JOIN `product` ON `product_price`.`product_id` = `product`.`id`
LEFT JOIN `product_sale` ON `product`.`id` = `product_sale`.`product_id`
LEFT JOIN `loyalty_program` ON `product_sale`.`loyalty_program_id` = `loyalty_program`.`id`
WHERE `order_item`.`customer_id` IN (
	SELECT `customer`.`id` 
    FROM `customer`
	WHERE `city` IN ('kyiv', 'odesa'))
GROUP BY `customer`.`city`, `customer`.`name`
WITH ROLLUP;