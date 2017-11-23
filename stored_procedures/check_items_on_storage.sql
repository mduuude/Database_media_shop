CREATE DEFINER=`root`@`localhost` PROCEDURE `check_items_on_storage`(`par` INTEGER(2))
BEGIN
SELECT * FROM (
SELECT `product`.`id`,
	IF(`item`.`item_type_id` = 1, 'audio', 'video') AS `type_of_product`,
	`video`.`title` AS `product_title`, 
	`storage_format`.`name` AS `storage_format`, 
	`product`.`quantity`
FROM `product`
JOIN `storage_format` ON `product`.`storage_format_id` = `storage_format`.`id`
JOIN `item` ON `product`.`item_id` = `item`.`id`
JOIN `video` ON `item`.`id` = `video`.`item_id`
WHERE `product`.`quantity` < `par`
GROUP BY `product`.`id`
ORDER BY `product`.`quantity`) AS `t`

UNION ALL

SELECT * FROM (
SELECT `product`.`id`,
	IF(`item`.`item_type_id` = 1, 'audio', 'video') AS `type_of_product`,
	`audio`.`title` AS `product_title`, 
	`storage_format`.`name` AS `storage_format`, 
	`product`.`quantity`
FROM `product`
JOIN `storage_format` ON `product`.`storage_format_id` = `storage_format`.`id`
JOIN `item` ON `product`.`item_id` = `item`.`id`
JOIN `audio` ON `item`.`id` = `audio`.`item_id`
WHERE `product`.`quantity` < `par`
GROUP BY `product`.`id`
ORDER BY `product`.`quantity`
) AS `t2`;
END