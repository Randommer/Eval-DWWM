/*
Q1. Afficher dans l'ordre alphabétique et sur une seule colonne les noms et prénoms des employés qui ont des enfants, présenter d'abord ceux qui en ont le plus.
*/

SELECT CONCAT(emp_lastname, ' ', emp_firstname) AS 'Employé', emp_children AS "Nombre d'enfants"
FROM  employees
WHERE emp_children != 0
ORDER BY emp_children DESC, Employé ASC;


/*
Q2. Y-a-t-il des clients étrangers ? Afficher leur nom, prénom et pays de résidence.
*/

SELECT CONCAT(cus_lastname, ' ', cus_firstname) AS 'Client', cou_name AS 'Pays de résidence'
FROM customers
INNER JOIN countries ON cus_countries_id = cou_id
WHERE cou_name != 'France'
ORDER BY cou_name, Client;


/*
Q3. Afficher par ordre alphabétique les villes de résidence des clients ainsi que le code (ou le nom) du pays.
*/

SELECT DISTINCT cus_city AS 'Ville de résidence du client', cou_name AS 'Pays'
FROM customers
INNER JOIN countries ON cus_countries_id = cou_id
ORDER BY cus_city ASC;


/*
Q4. Afficher le nom des clients dont les fiches ont été modifiées.
*/

SELECT cus_lastname AS 'Clients', CONCAT(DAY(cus_update_date), ' ', MONTHNAME(cus_update_date), ' ', YEAR(cus_update_date), ' à ', TIME_FORMAT(cus_update_date, "%Hh%i et %ss")) AS 'Fiche modifiée le'
FROM customers
WHERE cus_update_date IS NOT NULL;


/*
Q5. La commerciale Coco Merce veut consulter la fiche d'un client, mais la seule chose dont elle se souvienne est qu'il habite une ville genre 'divos'. Pouvez-vous l'aider ?
*/

SELECT cus_id AS 'Client n°', CONCAT(cus_lastname, ' ', cus_firstname) AS 'Nom', CONCAT(cus_address, ' ', cus_zipcode, ' ', cus_city, ' ', cou_name) AS 'Adresse complète', cus_mail AS 'Email', cus_password AS 'Mot de passe', cus_phone AS 'Téléphone', cus_add_date AS "Date d'ajout", cus_update_date AS 'Date de modification'
FROM customers
INNER JOIN countries ON cus_countries_id = cou_id
WHERE cus_city LIKE '%divos%';


/*
Q6. Quel est le produit vendu le moins cher ? Afficher le prix, l'id et le nom du produit.
*/

SELECT pro_id AS 'Produit n°', pro_name AS 'Nom', CONCAT(pro_price, '€') AS 'Prix'
FROM products
WHERE pro_price IN (
    SELECT MIN(pro_price)
    FROM products
);

/* Solution sans sous-requête, on ordonne et on prend le premier résultat */
SELECT pro_id AS 'Produit n°', pro_name AS 'Nom', CONCAT(pro_price, '€') AS 'Prix'
FROM products
ORDER BY pro_price
LIMIT 1;


/*
Q7. Lister les produits qui n'ont jamais été vendus.
*/

/* On fait une jointure des produits et des lignes de commande et on garde les produits sans lignes de commande */
SELECT pro_id AS 'Produit n°', pro_ref AS 'Référence', pro_name AS 'Nom'
FROM products
LEFT JOIN orders_details ON pro_id = ode_pro_id
WHERE ode_pro_id IS NULL;

/* On cherche tout les ID des produits dans les lignes de commande et on garde les autres */
SELECT pro_id AS 'Produit n°', pro_ref AS 'Référence', pro_name AS 'Nom'
FROM products
WHERE pro_id NOT IN (
    SELECT DISTINCT ode_pro_id
    FROM orders_details
);

/* On demande tout les produits qui n'existent pas dans les lignes de commande */
SELECT pro_id AS 'Produit n°', pro_ref AS 'Référence', pro_name AS 'Nom'
FROM products
WHERE NOT EXISTS (
    SELECT DISTINCT ode_pro_id
    FROM orders_details
    WHERE pro_id = ode_pro_id
);


/*
Q8. Afficher les produits commandés par Madame Pikatchien.
*/

SELECT pro_id AS 'Produit n°', pro_name AS 'Nom', pro_ref AS 'Référence', CONCAT(DAYNAME(ord_order_date), ' ', DAY(ord_order_date), ' ', MONTHNAME(ord_order_date), ' ', YEAR(ord_order_date)) AS 'Commandé le', CONCAT('Madame ', cus_lastname, ' ', cus_firstname, ', cliente n°', cus_id) AS 'Par', CONCAT('n°', ord_id, ', ligne détail n°', ode_id) AS 'Commande'
FROM products
INNER JOIN orders_details ON pro_id = ode_pro_id
INNER JOIN orders ON ode_ord_id = ord_id
INNER JOIN customers ON ord_cus_id = cus_id
WHERE cus_lastname = 'Pikatchien';


/*
Q9. Afficher le catalogue des produits par catégorie, le nom des produits et de la catégorie doivent être affichés.
*/

SELECT cat_name AS 'Catégorie', pro_name AS 'Produit'
FROM products
INNER JOIN categories ON pro_cat_id = cat_id
ORDER BY cat_name ASC, pro_name ASC;


/*
Q10. Afficher l'organigramme hiérarchique (nom et prénom et poste des employés) du magasin de Compiègne, classer par ordre alphabétique. Afficher le nom et prénom des employés, éventuellement le poste (si vous y parvenez).
*/

SELECT CONCAT(emp_comp.emp_lastname, ' ', emp_comp.emp_firstname) AS 'Employé', pos_comp.pos_libelle AS 'Poste', CONCAT(supp.emp_lastname, ' ', supp.emp_firstname) AS 'Supérieur', pos_supp.pos_libelle AS 'Poste'
FROM employees emp_comp
INNER JOIN shops ON emp_comp.emp_sho_id = sho_id
INNER JOIN posts pos_comp ON emp_comp.emp_pos_id = pos_comp.pos_id
JOIN employees supp ON emp_comp.emp_superior_id = supp.emp_id
INNER JOIN posts pos_supp on supp.emp_pos_id = pos_supp.pos_id
WHERE sho_city = 'Compiègne'
ORDER BY Employé ASC;


/*
Q11. Quel produit a été vendu avec la remise la plus élevée ? Afficher le montant de la remise, le numéro et le nom du produit, le numéro de commande et de ligne de commande.
*/

SELECT CONCAT(ode_discount, '%') AS 'Remise', pro_id AS 'Produit n°', pro_name AS 'Nom',  ord_id AS 'Commande n°', ode_id AS 'Ligne de commande n°'
FROM orders_details
INNER JOIN products ON ode_pro_id = pro_id
INNER JOIN orders ON ode_ord_id = ord_id
WHERE ode_discount IN (
    SELECT MAX(ode_discount)
    FROM orders_details
);

/* sans sous-requête */
SELECT CONCAT(ode_discount, '%') AS 'Remise', pro_id AS 'Produit n°', pro_name AS 'Nom',  ord_id AS 'Commande n°', ode_id AS 'Ligne de commande n°'
FROM orders_details
INNER JOIN products ON ode_pro_id = pro_id
INNER JOIN orders ON ode_ord_id = ord_id
ORDER BY ode_discount DESC
LIMIT 1;


/*
Q13. Combien y-a-t-il de clients canadiens ? Afficher dans une colonne intitulée 'Nb clients Canada'.
*/

SELECT CONCAT(COUNT(cus_id), ' client(s)') AS 'Nombre de clients du Canada'
FROM customers
INNER JOIN countries ON cus_countries_id = cou_id
WHERE cou_name = 'Canada';


/*
Q16. Afficher le détail des commandes de 2020.
*/

SELECT ord_id AS 'Commande n°', ode_id AS 'Ligne de commande n°', pro_ref AS 'Produit', ode_quantity AS 'Quantité', CONCAT(ode_unit_price, '€') AS "Prix", CONCAT(ode_discount, '%') AS "Remise", CONCAT(ROUND((ode_quantity*ode_unit_price)*((100-ode_discount)/100), 2), '€') AS 'Total ligne', CONCAT(DAY(ord_order_date), ' ', MONTHNAME(ord_order_date), ' ', YEAR(ord_order_date)) AS 'Commandé le'
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
INNER JOIN products ON ode_pro_id = pro_id
WHERE YEAR(ord_order_date) = 2020
ORDER BY ord_id, ode_id;


/*
Q17. Afficher les coordonnées des fournisseurs pour lesquels des commandes ont été passées.
*/

SELECT DISTINCT sup_name AS 'Fournisseur', CONCAT(sup_address, ' ', sup_zipcode, ' ', sup_city, ' ', cou_name) AS 'Adresse', sup_phone AS 'Téléphone', sup_mail AS 'Email'
FROM orders_details
INNER JOIN products ON ode_pro_id = pro_id
INNER JOIN suppliers ON pro_sup_id = sup_id
INNER JOIN countries ON sup_countries_id = cou_id;


/*
Q18. Quel est le chiffre d'affaires de 2020 ?
*/

SELECT CONCAT(ROUND(SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)), 2), '€') AS "Chiffre d'affaires 2020"
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
WHERE YEAR(ord_order_date) = 2020;


/*
Q19. Quel est le panier moyen ?
*/

/* on crée une table des totaux des paniers, on en fait la moyenne */
SELECT CONCAT(ROUND(AVG(`Total du panier`), 2), '€') AS 'Moyenne des paniers'
FROM ( 
    SELECT SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)) AS 'Total du panier'
    FROM orders
    INNER JOIN orders_details ON ord_id = ode_ord_id
    GROUP BY ord_id
) totaux;

/* sans sous-requête, on calcule le total des panniers et le nombre de commandes, on divise le premier par le second */
SELECT CONCAT(ROUND(SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100))/COUNT(DISTINCT ord_id), 2), '€') AS 'Moyenne des paniers'
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id;


/*
Q20. Lister le total de chaque commande par total décroissant (Afficher numéro de commande, date, total et nom du client).
*/

SELECT ord_id AS 'Commande n°', CONCAT(DAY(ord_order_date), ' ', MONTHNAME(ord_order_date), ' ', YEAR(ord_order_date)) AS 'Commandé le', CONCAT(ROUND(SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)), 2), '€') AS 'Total du panier', CONCAT(cus_firstname, ' ', cus_lastname) AS 'Par'
FROM orders
INNER JOIN orders_details ON ord_id = ode_ord_id
INNER JOIN customers ON ord_cus_id = cus_id
GROUP BY ord_id
ORDER BY SUM((ode_quantity*ode_unit_price)*((100-ode_discount)/100)) DESC, ord_order_date;


