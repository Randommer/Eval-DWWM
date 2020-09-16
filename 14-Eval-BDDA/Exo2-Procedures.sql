/*
Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture en fonction d'un numéro de commande. Cette procédure doit sortir le montant total de la commande.
*/

DELIMITER |

DROP PROCEDURE IF EXISTS facture|
CREATE PROCEDURE facture(
    p_ord_id    int UNSIGNED
)
BEGIN
    DECLARE ord_verif   varchar(50);
    DECLARE total_ord   double;
    SET ord_verif = (
        SELECT ord_id
        FROM orders
        WHERE ord_id = p_ord_id
    );
    IF ISNULL(ord_verif)
    THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Ce numéro de commande n'existe pas";
    ELSE
        SET total_ord = (
            SELECT SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100))
            FROM orders_details
            WHERE ode_ord_id = p_ord_id
        );

        SELECT
        ord_id AS 'Numéro de commande',
        ord_order_date AS 'Datée du',
        CONCAT(cus_firstname, ' ', cus_lastname, ' à ', cus_city) AS 'Client',
        ode_id AS 'Ligne de commande',
        CONCAT(pro_ref, ' - ', pro_name, ' - ', pro_color) AS 'Produit',
        ode_quantity AS 'Quantité produit',
        CONCAT(ROUND(ode_unit_price, 2), '€') AS 'Prix unitaire',
        CONCAT(ode_discount, '%') AS 'Remise',
        CONCAT(ROUND((ode_quantity*ode_unit_price)*((100-ode_discount)/100), 2), '€') AS 'Total produit',
        CONCAT(ROUND(total_ord, 2), '€') AS 'Total commande'
        FROM orders_details
        INNER JOIN orders ON ode_ord_id = ord_id
        INNER JOIN customers ON ord_cus_id = cus_id
        INNER JOIN products ON ode_pro_id = pro_id
        WHERE ord_id = p_ord_id;
        
    END IF;
END |

DELIMITER ;

CALL facture(52);


/* ne marche pas (3 requêtes)
SELECT ord_id AS 'Numéro de commande', cus_firstname AS 'Prénom', cus_lastname AS 'Nom', ord_order_date AS 'Daté du'
FROM orders
INNER JOIN customers ON ord_cus_id = cus_id
WHERE ord_id = p_ord_id;
SELECT ode_id AS 'Ligne de commande', pro_ref AS 'Référence Produit', ode_quantity AS 'Quantité', ode_unit_price AS 'Prix unitaire', CONCAT(ode_discount, '%') AS 'Remise', CONCAT(ROUND((ode_quantity*ode_unit_price)*((100-ode_discount)/100), 2), '€') AS 'Sous-Total'
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
INNER JOIN products ON ode_pro_id = pro_id
WHERE ord_id = p_ord_id;
SELECT CONCAT(ROUND(SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)), 2), '€') AS 'Total'
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
WHERE ord_id = p_ord_id;
*/

/* marche mais moche (union des 3 requêtes)
SELECT ord_id AS 'Numéro de commande', CONCAT(cus_firstname, ' ', cus_lastname) AS 'Client', ord_order_date AS 'Daté du', NULL AS 'Ligne de commande', NULL AS 'Référence Produit', NULL AS 'Quantité', NULL AS 'Prix unitaire', NULL AS 'Remise', NULL AS 'Sous-Total', NULL AS 'Total'
FROM orders
INNER JOIN customers ON ord_cus_id = cus_id
WHERE ord_id = p_ord_id

UNION

SELECT NULL, NULL, NULL, ode_id, pro_ref, ode_quantity, ode_unit_price, CONCAT(ode_discount, '%'), CONCAT(ROUND((ode_quantity*ode_unit_price)*((100-ode_discount)/100), 2), '€'), NULL
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
INNER JOIN products ON ode_pro_id = pro_id
WHERE ord_id = p_ord_id

UNION

SELECT NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CONCAT(ROUND(SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)), 2), '€')
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
WHERE ord_id = p_ord_id;
*/

/* marche mais c'est pas beau, on utilise un GROUP_CONCAT sur les champs qui ont plusieurs résultats
SELECT
ord_id AS 'Numéro de commande',
ord_order_date AS 'Datée du',
CONCAT(cus_firstname, ' ', cus_lastname, ' à ', cus_city) AS 'Client',
GROUP_CONCAT(ode_id) AS 'Ligne de commande',
GROUP_CONCAT(pro_ref, ' - ', pro_name, ' - ', pro_color) AS 'Produit',
GROUP_CONCAT(ode_quantity) AS 'Quantité produit',
GROUP_CONCAT(ROUND(ode_unit_price, 2), '€') AS 'Prix unitaire',
GROUP_CONCAT(ode_discount, '%') AS 'Remise',
GROUP_CONCAT(ROUND((ode_quantity*ode_unit_price)*((100-ode_discount)/100), 2), '€') AS 'Total produit',
CONCAT(ROUND(SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)), 2), '€') AS 'Total commande'
FROM orders_details
INNER JOIN orders ON ode_ord_id = ord_id
INNER JOIN customers ON ord_cus_id = cus_id
INNER JOIN products ON ode_pro_id = pro_id
WHERE ord_id = p_ord_id;
*/