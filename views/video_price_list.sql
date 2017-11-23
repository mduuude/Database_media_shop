CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `media_shop`.`video_price_list` AS
    SELECT 
        `media_shop`.`video`.`title` AS `video_title`,
        `media_shop`.`video`.`director` AS `video_director`,
        GROUP_CONCAT(`media_shop`.`genre`.`name`
            SEPARATOR ',') AS `genre`,
        `media_shop`.`video`.`year` AS `year_of_production`,
        `media_shop`.`production_company`.`name` AS `production_company`,
        `media_shop`.`storage_format`.`name` AS `storage_format`,
        `media_shop`.`product_price`.`price` AS `base_price`,
        IFNULL((`media_shop`.`product_price`.`price` * `media_shop`.`loyalty_program`.`coeff`),
                `media_shop`.`product_price`.`price`) AS `sale_price`
    FROM
        (((((((((`media_shop`.`product_price`
        JOIN `media_shop`.`product` ON ((`media_shop`.`product_price`.`product_id` = `media_shop`.`product`.`id`)))
        LEFT JOIN `media_shop`.`product_sale` ON ((`media_shop`.`product`.`id` = `media_shop`.`product_sale`.`product_id`)))
        LEFT JOIN `media_shop`.`loyalty_program` ON ((`media_shop`.`product_sale`.`loyalty_program_id` = `media_shop`.`loyalty_program`.`id`)))
        JOIN `media_shop`.`storage_format` ON ((`media_shop`.`product`.`storage_format_id` = `media_shop`.`storage_format`.`id`)))
        JOIN `media_shop`.`item` ON ((`media_shop`.`product`.`item_id` = `media_shop`.`item`.`id`)))
        JOIN `media_shop`.`video` ON ((`media_shop`.`item`.`id` = `media_shop`.`video`.`item_id`)))
        JOIN `media_shop`.`production_company` ON ((`media_shop`.`video`.`production_company_id` = `media_shop`.`production_company`.`id`)))
        JOIN `media_shop`.`video_genre` ON ((`media_shop`.`video`.`id` = `media_shop`.`video_genre`.`video_id`)))
        JOIN `media_shop`.`genre` ON ((`media_shop`.`video_genre`.`genre_id` = `media_shop`.`genre`.`id`)))
    WHERE
        ISNULL(`media_shop`.`product_price`.`date_to`)
    GROUP BY `media_shop`.`product`.`id`
    ORDER BY `video_title` , `year_of_production` , `storage_format`