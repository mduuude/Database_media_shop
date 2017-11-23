CREATE DEFINER=`root`@`localhost` TRIGGER `media_shop`.`product_price_AFTER_UPDATE` AFTER UPDATE ON `product_price` FOR EACH ROW
BEGIN
	IF (NEW.`date_from` > NEW.`date_to`) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "Date error! Date to cannot be less than date from";
	END IF;
END