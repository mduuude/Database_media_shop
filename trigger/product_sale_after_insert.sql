CREATE DEFINER = CURRENT_USER TRIGGER `media_shop`.`product_sale_AFTER_INSERT` AFTER INSERT ON `product_sale` FOR EACH ROW
BEGIN
	IF (NEW.`date_from` > NEW.`date_to`) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "Date error! Date to cannot be less than date from";
	END IF;
END