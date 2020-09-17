/*
Créer une table commander_articles constituées de colonnes :
    codart : id du produit
    qte : quantité à commander
    date : date du jour
*/

CREATE TABLE commander_articles (
        codart  int(10) UNSIGNED NOT NULL,
        qte int(5) UNSIGNED,
        date    date NOT NULL,
    CONSTRAINT commander_articles_codart_FK FOREIGN KEY (codart) REFERENCES products(pro_id),
    CONSTRAINT commander_article_PK PRIMARY KEY (codart)
);

/*
Créer un déclencheur after_products_update sur la table products : lorsque le stock physique devient inférieur au stock d'alerte, une nouvelle ligne est insérée dans la table commander_articles.
*/

DELIMITER |

DROP TRIGGER IF EXISTS after_products_update|
CREATE TRIGGER after_products_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    DECLARE stock_p int;
    DECLARE alert_p int;
    DECLARE id_p    int;
    DECLARE new_qte int;
    DECLARE verif   varchar(50);
    SET stock_p = NEW.pro_stock;
    SET alert_p = NEW.pro_stock_alert;
    SET id_p = NEW.pro_id;
    IF (stock_p < alert_p)
    THEN
        SET new_qte = alert_p - stock_p;
        SET verif = (
            SELECT codart
            FROM commander_articles
            WHERE codart = id_p
        );
        IF ISNULL(verif)
        THEN
            INSERT INTO commander_articles
            (codart, qte, date)
            VALUES
            (id_p, new_qte, CURRENT_DATE());
        ELSE
            UPDATE commander_articles
            SET qte = new_qte,
            date = CURRENT_DATE()
            WHERE codart = id_p;
        END IF;
    ELSE
        DELETE
        FROM commander_articles
        WHERE codart = id_p;
    END IF;
END|

DELIMITER ;

/*
Pour le jeu de test de votre déclencheur, on prendra le produit 8 (barbecue 'Athos') auquel on mettra les valeurs de stock :
6, 4, 3 puis 6.
*/

SELECT *
FROM commander_articles;

UPDATE products
SET pro_stock = 6
WHERE pro_id = 8;

SELECT *
FROM commander_articles;

UPDATE products
SET pro_stock = 4
WHERE pro_id = 8;

SELECT *
FROM commander_articles;

UPDATE products
SET pro_stock = 3
WHERE pro_id = 8;

SELECT *
FROM commander_articles;

UPDATE products
SET pro_stock = 6
WHERE pro_id = 8;

SELECT *
FROM commander_articles;