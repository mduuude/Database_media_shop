CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `media_shop`.`product_demand_and_handling` AS
    SELECT 
        `t`.`type_of_product` AS `type_of_product`,
        `t`.`product_title` AS `product_title`,
        `t`.`year` AS `year`,
        `t`.`storage_format` AS `storage_format`,
        `t`.`num_of_orders` AS `num_of_orders`,
        `t`.`base_price` AS `base_price`,
        `t`.`sale_price` AS `sale_price`,
        `t`.`revenue` AS `revenue`,
        `t`.`rating` AS `rating`,
        `t`.`quantity` AS `quantity`
    FROM
        (SELECT 
            IF((`media_shop`.`item`.`item_type_id` = 1), 'audio', 'video') AS `type_of_product`,
                `media_shop`.`video`.`title` AS `product_title`,
                `media_shop`.`video`.`year` AS `year`,
                `media_shop`.`storage_format`.`name` AS `storage_format`,
                SUM(`media_shop`.`order_item`.`quantity`) AS `num_of_orders`,
                CAST(`media_shop`.`product_price`.`price` AS DECIMAL (11 , 2 )) AS `base_price`,
                IFNULL((`media_shop`.`product_price`.`price` * `media_shop`.`loyalty_program`.`coeff`), `media_shop`.`product_price`.`price`) AS `sale_price`,
                (SUM(`media_shop`.`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`media_shop`.`order_item`.`id`))) AS `revenue`,
                `media_shop`.`item`.`rating` AS `rating`,
                `media_shop`.`product`.`quantity` AS `quantity`
        FROM
            (((((((`media_shop`.`order_item`
        JOIN `media_shop`.`product_price` ON ((`media_shop`.`order_item`.`product_price_id` = `media_shop`.`product_price`.`id`)))
        JOIN `media_shop`.`product` ON ((`media_shop`.`product_price`.`product_id` = `media_shop`.`product`.`id`)))
        LEFT JOIN `media_shop`.`product_sale` ON ((`media_shop`.`product`.`id` = `media_shop`.`product_sale`.`product_id`)))
        LEFT JOIN `media_shop`.`loyalty_program` ON ((`media_shop`.`product_sale`.`loyalty_program_id` = `media_shop`.`loyalty_program`.`id`)))
        JOIN `media_shop`.`storage_format` ON ((`media_shop`.`product`.`storage_format_id` = `media_shop`.`storage_format`.`id`)))
        JOIN `media_shop`.`item` ON ((`media_shop`.`product`.`item_id` = `media_shop`.`item`.`id`)))
        JOIN `media_shop`.`video` ON ((`media_shop`.`item`.`id` = `media_shop`.`video`.`item_id`)))
        WHERE
            ISNULL(`media_shop`.`product_price`.`date_to`)
        GROUP BY `media_shop`.`order_item`.`product_price_id`
        ORDER BY `revenue` DESC , `media_shop`.`item`.`rating` DESC) `t` 
    UNION ALL SELECT 
        `t2`.`type_of_product` AS `type_of_product`,
        `t2`.`product_title` AS `product_title`,
        `t2`.`year` AS `year`,
        `t2`.`storage_format` AS `storage_format`,
        `t2`.`num_of_orders` AS `num_of_orders`,
        `t2`.`base_price` AS `base_price`,
        `t2`.`sale_price` AS `sale_price`,
        `t2`.`revenue` AS `revenue`,
        `t2`.`rating` AS `rating`,
        `t2`.`quantity` AS `quantity`
    FROM
        (SELECT 
            IF((`media_shop`.`item`.`item_type_id` = 1), 'audio', 'video') AS `type_of_product`,
                `media_shop`.`audio`.`title` AS `product_title`,
                `media_shop`.`audio`.`year` AS `year`,
                `media_shop`.`storage_format`.`name` AS `storage_format`,
                SUM(`media_shop`.`order_item`.`quantity`) AS `num_of_orders`,
                CAST(`media_shop`.`product_price`.`price` AS DECIMAL (11 , 2 )) AS `base_price`,
                IFNULL((`media_shop`.`product_price`.`price` * `media_shop`.`loyalty_program`.`coeff`), `media_shop`.`product_price`.`price`) AS `sale_price`,
                (SUM(`media_shop`.`order_item`.`quantity`) * (SELECT `media_shop`.`act_price`(`media_shop`.`order_item`.`id`))) AS `revenue`,
                `media_shop`.`item`.`rating` AS `rating`,
                `media_shop`.`product`.`quantity` AS `quantity`
        FROM
            (((((((`media_shop`.`order_item`
        JOIN `media_shop`.`product_price` ON ((`media_shop`.`order_item`.`product_price_id` = `media_shop`.`product_price`.`id`)))
        JOIN `media_shop`.`product` ON ((`media_shop`.`product_price`.`product_id` = `media_shop`.`product`.`id`)))
        LEFT JOIN `media_shop`.`product_sale` ON ((`media_shop`.`product`.`id` = `media_shop`.`product_sale`.`product_id`)))
        LEFT JOIN `media_shop`.`loyalty_program` ON ((`media_shop`.`product_sale`.`loyalty_program_id` = `media_shop`.`loyalty_program`.`id`)))
        JOIN `media_shop`.`storage_format` ON ((`media_shop`.`product`.`storage_format_id` = `media_shop`.`storage_format`.`id`)))
        JOIN `media_shop`.`item` ON ((`media_shop`.`product`.`item_id` = `media_shop`.`item`.`id`)))
        JOIN `media_shop`.`audio` ON ((`media_shop`.`item`.`id` = `media_shop`.`audio`.`item_id`)))
        WHERE
            ISNULL(`media_shop`.`product_price`.`date_to`)
        GROUP BY `media_shop`.`order_item`.`product_price_id`
        ORDER BY `revenue` DESC , `media_shop`.`item`.`rating` DESC) `t2`