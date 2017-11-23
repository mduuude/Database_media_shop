CREATE DEFINER=`root`@`localhost` FUNCTION `act_price`(`par` INTEGER(11)) RETURNS int(11)
BEGIN
	DECLARE `var_is_reg` VARCHAR(5);
    DECLARE `var_coeff` DECIMAL(3,2);
    DECLARE `var_sale_date` VARCHAR(45);
    DECLARE `var_qtt` INTEGER;
    DECLARE `var_price` INTEGER;

	SET `var_is_reg` = (SELECT `customer`.`is_regular` 
		FROM `customer`
        JOIN `order_item` ON `customer`.`id` = `order_item`.`customer_id`
        WHERE `order_item`.`id` = `par`);
	SET `var_coeff` = (SELECT `loyalty_program`.`coeff` 
		FROM `loyalty_program`
        JOIN `product_sale` ON `loyalty_program`.`id` = `product_sale`.`loyalty_program_id`
        JOIN `product` ON `product_sale`.`product_id` = `product`.`id`
        JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
        JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
        WHERE `order_item`.`id` = `par`);
	SET `var_sale_date` = (SELECT `product_sale`.`date_to` 
        FROM `product_sale`
        JOIN `product` ON `product_sale`.`product_id` = `product`.`id`
        JOIN `product_price` ON `product`.`id` = `product_price`.`product_id`
        JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
        WHERE `order_item`.`id` = `par`);
	SET `var_qtt` = (SELECT `order_item`.`quantity` 
        FROM `order_item`
        WHERE `order_item`.`id` = `par`);
	SET `var_price` = (SELECT `product_price`.`price` 
        FROM `product_price`
        JOIN `order_item` ON `product_price`.`id` = `order_item`.`product_price_id`
        WHERE `order_item`.`id` = `par`);
	
    IF (`var_is_reg` = 'true') THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 6);
	END IF;
    
    IF (`var_coeff` IS NOT NULL AND `var_sale_date` IS NULL) THEN
		SET `var_price` = `var_price` * `var_coeff`;    
	END IF;
    
	IF (`var_qtt` BETWEEN 2 AND 4) THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 1);
	ELSEIF (`var_qtt` BETWEEN 5 AND 9) THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 2);
	ELSEIF (`var_qtt` > 10) THEN
		SET `var_price` = `var_price` * (SELECT `loyalty_program`.`coeff` FROM `loyalty_program` WHERE `loyalty_program`.`id` = 3);
	END IF;
    
RETURN `var_price`;
END