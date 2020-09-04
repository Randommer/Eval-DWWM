INSERT INTO employees (emp_id, emp_superior_id, emp_pos_id, emp_lastname, emp_firstname, emp_address, emp_zipcode, emp_city, emp_mail, emp_phone, emp_salary, emp_enter_date, emp_gender, emp_children)
VALUES
(3, NULL, 1, 'LEBOSSE', 'Hugo', '28 mail Ludovic Cruchot', '75001', 'Paris', 'leboss@jarditou.com', '0102030405', '350000.78', '2000-01-01', 'M', 2),
(2, 3, 2, 'NAGER', 'Emma', '14 rue Tabaga', '80300', 'Albert', 'emmanager@laposte.net', '0102030405', '39576.00', '2015-03-27', 'F', 0),
(5, 3, 35, 'DRESSAMERE', 'Yvan', '224 avenue Caumartin', '75009', 'Paris', 'yvan75009@outlook.com', '0102030405', '39576.00', '2007-11-04', 'M', 0),
(7, 2, 3, 'AMAR', 'Yann', '4 rue du papillon de lumière', '62000', 'Arras', 'amar@azerty.com', '0102030405', '30000.00', '2008-05-28', 'M', 3),
(86, 2, 2, 'MICHAEL', 'Quinn', '777-2337 Pretium Chemin', '6350', 'Bilaspur', 'tellus@Uttinciduntvehicula.edu', '0102030405', '39576.00', '2002-09-26', 'M', 5),
(6, 5, 3, 'MERCE', 'Coco', '56 cours Loana', '02000', 'Laon', 'merce@wazaa.net', '0102030405', '30000.00', '2010-07-31', 'F', 2),
(22, 5, 17, 'FERRIS', 'Anne', 'Appartement 172-7219 Ante Chemin', '5155 ', 'North Waziristan', 'Duis.risus.odio@at.com', '0102030405', '51802.00', '2015-05-21', 'F', 0),
(89, 6, 3, 'KEANE', 'Ashton', '772-9554 Ipsum Av.', '4095 ', 'Khanpur', 'metus@eratvel.edu', '0102030405', '30000.00', '2005-09-07', 'M', 4),
(16, 7, 17, 'TRON', 'Paul', '2323 Metus. Rue', '20403', 'Jumet', 'eu@gravidamauris.org', '0102030405', '51802.00', '2013-04-08', 'M', 1),
(37, 7, 2, 'BECK', 'Carl', '9194 Nulla Ave', '87-14', 'Paris', 'tellus@et.ca', '0102030405', '39576.00', '2004-02-09', 'M', 1),
(73, 7, 2, 'LIRMA', 'Hugues', '91 bis rue Jarno', '62000', 'Arras', 'hugues.lirma@jarditou.com', '0102030405', '39576.00', '2019-07-10', 'M', 5)
;

INSERT INTO suppliers (sup_id, sup_name, sup_city, sup_countries_id, sup_address, sup_zipcode, sup_contact, sup_phone, sup_mail)
VALUES
(1, 'Plantage', 'Paris', 'FR', '1 avenue Cyril Hanouna', '75017', 'Nicolas Dujardin', '0102030405', 'contact@plantage.fr'),
(2, 'Jardi+', 'Amiens', 'FR', '200 boulevard Eve Angeli', '80090', 'Mike Anic', '0708091011', 'jardiplus@gmail.com'),
(3, 'Attila', 'Marseille', 'FR', '31 rue Nabilla Benattia', '13000', 'Elle Ephant', '0213141516', 'attila.tondeuses@laposte.net'),
(4, 'Barbeuc', 'Narbonne', 'FR', '56 avenue Donald Trump', '11000', 'Gérard Menfaim', '0512345678', 'sales@barbeuc.com'),
(5, 'FOURNIRIEN', 'Shangaï', 'CN', '112 rue de Pékin', '340', 'Chang Li', '0102030405', 'chang.li@fournirien.cn')
;

INSERT INTO customers (cus_id, cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city, cus_countries_id, cus_mail, cus_phone, cus_password, cus_add_date)
VALUES
(1, 'Dupont', 'Toto', '33 rue Perez', '52042', 'Central City', 'US', 'toto@gmail.com', '0630105080', 'IamGr3at', CURRENT_TIMESTAMP())
;