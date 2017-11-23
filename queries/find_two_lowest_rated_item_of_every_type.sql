-- find two lowest rated items of every type

SELECT `item`.`item_type_id`, `item`.`title`, `item`.`rating`
FROM `item`
WHERE (
	SELECT COUNT(*) FROM `item` AS `t`
	WHERE `t`.`item_type_id` = `item`.`item_type_id` AND `t`.`rating` <= `item`.`rating`) <= 2
ORDER BY `item`.`item_type_id`, `item`.`rating` DESC;
