CREATE ROLE 'marketing';

GRANT SELECT, INSERT, UPDATE, DELETE
ON gescom.products
TO marketing;

GRANT SELECT, INSERT, UPDATE, DELETE
ON gescom.categories
TO marketing;

GRANT SELECT
ON gescom.orders
TO marketing;

GRANT SELECT
ON gescom.orders_details
TO marketing;

GRANT SELECT
ON gescom.customers
TO marketing;

SHOW GRANTS FOR marketing;

CREATE USER 'Bertrand'@'localhost'
IDENTIFIED BY 'mdp1';

GRANT marketing
TO 'Bertrand'@'localhost';

SHOW GRANTS FOR 'Bertrand'@'localhost';

SET DEFAULT ROLE marketing
TO 'Bertrand'@localhost;

SHOW GRANTS FOR 'Bertrand'@'localhost';