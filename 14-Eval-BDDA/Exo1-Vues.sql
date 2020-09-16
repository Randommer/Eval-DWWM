/*
Créez une vue qui affiche le catalogue produits. L'id, la référence et le nom des produits, ainsi que l'id et le nom de la catégorie doivent apparaître.
*/

DROP VIEW IF EXISTS v_catalogue_produits;
CREATE VIEW v_catalogue_produits
AS
SELECT pro_id AS 'ID Produit', pro_ref AS 'Référence', pro_name AS 'Nom', cat_id AS 'ID Catégorie', cat_name AS 'Catégorie'
FROM products
INNER JOIN categories ON pro_cat_id = cat_id;
