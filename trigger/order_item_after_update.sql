CREATE DEFINER=`root`@`localhost` TRIGGER `media_shop`.`order_item_AFTER_UPDATE` AFTER UPDATE ON `order_item` FOR EACH ROW
BEGIN
	IF (NEW.`quantity` > 
		(SELECT `product`.`quantity` FROM `product_price`
		JOIN `product` ON `product_price`.`product_id` = `product`.`id`
		WHERE `product_price`.`id` = NEW.`product_price_id`)) THEN
		SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = "It is not enough products!";
    ELSE
    	UPDATE `product`
        JOIN `product_price` ON `product`.`id`=`product_price`.`product_id`
		SET `product`.`quantity` = `product`.`quantity` + OLD.`quantity` - NEW.`quantity`
		WHERE `product_price`.`id` = NEW.`product_price_id`;
	END IF;
END