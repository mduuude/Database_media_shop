CREATE DEFINER=`root`@`localhost` TRIGGER `media_shop`.`rating_AFTER_DELETE` AFTER DELETE ON `rating` FOR EACH ROW
BEGIN
	UPDATE item
	SET rating = (SELECT AVG(rate) FROM rating WHERE item_id = OLD.item_id)
	WHERE id = OLD.item_id;
END