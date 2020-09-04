/*
Q22. La version 2020 du produit barb004 s'appelle désormais Camper et, bonne nouvelle, son prix subit une baisse de 10%.
*/

SELECT pro_ref AS 'Produit', pro_name AS 'Nom', CONCAT(pro_price, '€') AS 'Prix', pro_update_date AS 'Date de dernière modif'
FROM products
WHERE pro_ref = 'barb004';

UPDATE products
SET
pro_name = 'Camper',
pro_price = pro_price*0.9,
pro_update_date = CURRENT_TIME()
WHERE pro_ref = 'barb004';

SELECT pro_ref AS 'Produit', pro_name AS 'Nom', CONCAT(pro_price, '€') AS 'Prix', pro_update_date AS 'Date de dernière modif'
FROM products
WHERE pro_ref = 'barb004';

/* Retour vers le passé
UPDATE products
SET
pro_name = 'Camping',
pro_price = 100,
pro_update_date = NULL
WHERE pro_ref = 'barb004';
*/


/*
Q23. L'inflation en France en 2019 a été de 1,1%, appliquer cette augmentation à la gamme de parasols.
*/

SELECT cat_name AS 'Catégorie', pro_ref AS 'Produit', CONCAT(pro_price, '€') AS 'Prix', pro_update_date AS 'Date de dernière modif'
FROM products
INNER JOIN categories ON pro_cat_id = cat_id
WHERE cat_name = 'Parasols';

UPDATE products
INNER JOIN categories ON pro_cat_id = cat_id
SET
pro_price = pro_price*1.011,
pro_update_date = CURRENT_TIME()
WHERE cat_name = 'Parasols';

SELECT cat_name AS 'Catégorie', pro_ref AS 'Produit', CONCAT(pro_price, '€') AS 'Prix', pro_update_date AS 'Date de dernière modif'
FROM products
INNER JOIN categories ON pro_cat_id = cat_id
WHERE cat_name = 'Parasols';

/* Retour vers le passé
UPDATE products
SET
pro_price = 100,
pro_update_date = NULL
WHERE pro_id = 25;

UPDATE products
SET
pro_price = 605.4,
pro_update_date = NULL
WHERE pro_id = 26;

UPDATE products
SET
pro_price = 179.97,
pro_update_date = DATE("2018-08-21")
WHERE pro_id = 27;
*/


/*
Q24. Supprimer les produits non vendus de la catégorie "Tondeuses électriques". Ces produits sont : 36, 37 et 41 de la catégorie 9.
*/

SELECT cat_name AS 'Catégorie', pro_ref AS 'Produit'
FROM products
INNER JOIN categories ON pro_cat_id = cat_id
LEFT JOIN orders_details ON pro_id = ode_pro_id
WHERE cat_name = 'Tondeuses électriques'
AND ode_pro_id IS NULL;

DELETE supp
FROM products supp
INNER JOIN categories ON supp.pro_cat_id = cat_id
LEFT JOIN orders_details ON supp.pro_id = ode_pro_id
WHERE cat_name = 'Tondeuses électriques'
AND ode_pro_id IS NULL;

/* la même mais avec un SELECT de l'ID des produits pour le WHERE, mais DELETE aime pas les sous-requètes qui utilisent la table qu'il va supprimer, mais les sous-sous-requètes le dérangent pas.
DELETE supp
FROM products supp
WHERE supp.pro_id IN (
    SELECT pro_id FROM (
        SELECT pro_id
        FROM products
        INNER JOIN categories ON pro_cat_id = cat_id
        LEFT JOIN orders_details ON pro_id = ode_pro_id
        WHERE cat_name = 'Tondeuses électriques'
        AND ode_pro_id IS NULL
    ) as Dummy_table
);
*/

SELECT cat_name AS 'Catégorie', pro_ref AS 'Produit'
FROM products
INNER JOIN categories ON pro_cat_id = cat_id
LEFT JOIN orders_details ON pro_id = ode_pro_id
WHERE cat_name = 'Tondeuses électriques'
AND ode_pro_id IS NULL;

/* Retour vers le passé
INSERT INTO products (pro_id, pro_cat_id, pro_price, pro_ref, pro_stock, pro_stock_alert, pro_color, pro_name, pro_desc, pro_publish, pro_sup_id, pro_add_date, pro_update_date, pro_picture)
VALUES
(36, 9, 75, 'HERO', 7, 5, 'Vert', 'Hero', "", 0, 4, DATE("2018-08-13"), NULL, 'jpg'),
(37, 9, 120.5, 'SL1280', 5, 5, 'Vert', 'SL 1280', "Quisque nec nisi risus. Fusce eu est non velit mollis tristique a et magna. Proin sodales.", 0, 4, DATE("2018-08-05"), DATE("2018-08-22"), 'jpg'),
(41, 9, 49.8, 'ZOOM', 223, 5, 'Gris', 'Zoom', "Nunc magna erat, ultrices et facilisis non, viverra in turpis. Nulla orci mi, maximus eu facilisis a, pretium sit amet ex.", 0, 4, DATE("2018-08-13"), NULL, 'jpg')
;
*/