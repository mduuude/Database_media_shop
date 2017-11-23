CREATE DEFINER=`root`@`localhost` TRIGGER `media_shop`.`rating_AFTER_UPDATE` AFTER UPDATE ON `rating` FOR EACH ROW
BEGIN
	IF (NEW.rate > 5 || NEW.rate < 1) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "The rate should be from 1 to 5!";
    ELSE
    	UPDATE item
		SET rating = (SELECT AVG(rate) FROM rating WHERE item_id = NEW.item_id)
		WHERE id = NEW.item_id;
	END IF;
END