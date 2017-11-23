-- find the most selled product of every genre in video and audio

SELECT `t`.`name`, `t`.`title`, `t`.`num_of_copies`
FROM
	(SELECT `genre`.`name`, 
		`item`.`title`, 
		SUM(`order_item`.`quantity`) AS `num_of_copies`
	FROM `item`
	JOIN `item_genre` ON `item`.`id` = `item_genre`.`item_id`
	JOIN `genre` ON `genre`.`id` = `item_genre`.`genre_id`
	JOIN `product` ON `item`.`id` = `product`.`item_id`
	JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
	JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
	GROUP BY `genre`.`name`, `item`.`title`
	ORDER BY `genre`.`name`, `num_of_copies` DESC) AS `t`
GROUP BY `t`.`name`
HAVING `t`.`num_of_copies` = MAX(`num_of_copies`)