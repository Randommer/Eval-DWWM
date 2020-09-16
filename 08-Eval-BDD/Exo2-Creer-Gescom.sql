DROP DATABASE IF EXISTS gescomeval;

CREATE DATABASE gescomeval;

USE gescomeval;

CREATE TABLE categories (
        cat_id  int(10) NOT NULL AUTO_INCREMENT,
        cat_parent_id   int(10) DEFAULT NULL,
        cat_name  varchar(50) NOT NULL,
    CONSTRAINT categorie_parente_FK FOREIGN KEY (cat_parent_id) REFERENCES categories(cat_id),
    CONSTRAINT categorie_PK PRIMARY KEY (cat_id)
);

CREATE TABLE stores (
        store_id  int(10) NOT NULL AUTO_INCREMENT,
        store_name varchar(50) NOT NULL,
    CONSTRAINT store_PK PRIMARY KEY (store_id)
);

CREATE TABLE departments (
        dep_id  int(10) NOT NULL AUTO_INCREMENT,
        dep_name varchar(50) NOT NULL,
    CONSTRAINT department_PK PRIMARY KEY (dep_id)
);

CREATE TABLE posts (
        post_id  int(10) NOT NULL AUTO_INCREMENT,
        post_name varchar(50) NOT NULL,
    CONSTRAINT post_PK PRIMARY KEY (post_id)
);

CREATE TABLE employees (
        emp_id  int(10) NOT NULL AUTO_INCREMENT,
        emp_superior_id int(10) DEFAULT NULL,
        emp_store_id  int(10) NOT NULL,
        emp_dep_id  int(10) NOT NULL,
        emp_post_id  int(10) NOT NULL,
        emp_name    varchar(50) NOT NULL,
        emp_salary  decimal(8,2) DEFAULT NULL,
        emp_join  date NOT NULL,
        emp_gender  char(1) NOT NULL,
        emp_kids    tinyint(2) NOT NULL,
    CONSTRAINT employee_superior_FK FOREIGN KEY (emp_superior_id) REFERENCES employees(emp_id),
    CONSTRAINT employee_store_FK FOREIGN KEY (emp_store_id) REFERENCES stores(store_id),
    CONSTRAINT employee_department_FK FOREIGN KEY (emp_dep_id) REFERENCES departments(dep_id),
    CONSTRAINT employee_post_FK FOREIGN KEY (emp_post_id) REFERENCES posts(post_id),
    CONSTRAINT employee_PK PRIMARY KEY (emp_id)
);

CREATE TABLE suppliers (
        sup_id  int(10) NOT NULL AUTO_INCREMENT,
        sup_name    varchar(50) NOT NULL,
        sup_contact varchar(100) NOT NULL,
    CONSTRAINT supplier_PK PRIMARY KEY (sup_id)
);

CREATE TABLE clients (
        cli_id  int(10) NOT NULL AUTO_INCREMENT,
        cli_name    varchar(50) NOT NULL,
        cli_address varchar(150) NOT NULL,
        cli_phone   varchar(10) NOT NULL,
        cli_mail    varchar(255) NOT NULL,
        cli_pwd    varchar(60) NOT NULL,
        cli_add_date    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        cli_update_date datetime DEFAULT NULL,
    CONSTRAINT client_PK PRIMARY KEY (cli_id)
);

CREATE TABLE products (
        prod_id  int(10) NOT NULL AUTO_INCREMENT,
        prod_cat_id  int(10) NOT NULL,
        prod_sup_id  int(10) NOT NULL,
        prod_price   decimal(7,2) NOT NULL,
        prod_reference varchar(8) NOT NULL,
        prod_EAN_code varchar(13) DEFAULT NULL,
        prod_stock   int(5) NOT NULL,
        prod_stock_alert int(5) NOT NULL,
        prod_color   varchar(30) NOT NULL,
        prod_title    varchar(50) NOT NULL,
        prod_description    text NOT NULL,
        prod_add_date    datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        prod_update_date datetime DEFAULT NULL,
        prod_picture varchar(50) DEFAULT NULL,
        prod_sell    tinyint(1) NOT NULL,
    CONSTRAINT product_categorie_FK FOREIGN KEY (prod_cat_id) REFERENCES categories(cat_id),
    CONSTRAINT product_supplier_FK FOREIGN KEY (prod_sup_id) REFERENCES suppliers(sup_id),
    CONSTRAINT product_PK PRIMARY KEY (prod_id)
);

CREATE TABLE commands (
        com_id  int(10) NOT NULL AUTO_INCREMENT,
        com_cli_id  int(10) NOT NULL,
        com_add_date  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
        com_update_date    datetime DEFAULT NULL,
        com_payment_date    datetime DEFAULT NULL,
        com_shipped_date   datetime DEFAULT NULL,
    CONSTRAINT command_client_FK FOREIGN KEY (com_cli_id) REFERENCES clients(cli_id),
    CONSTRAINT command_PK PRIMARY KEY (com_id)
);

CREATE TABLE command_lines (
        cline_id  int(10) NOT NULL AUTO_INCREMENT,
        cline_com_id  int(10) NOT NULL,
        cline_prod_id  int(10) NOT NULL,
        cline_quantity    int(5) NOT NULL,
        cline_price  decimal(7,2) NOT NULL,
        cline_discount    decimal(4,2) DEFAULT 0,
    CONSTRAINT command_line_command_FK FOREIGN KEY (cline_com_id) REFERENCES commands(com_id),
    CONSTRAINT command_line_product_FK FOREIGN KEY (cline_prod_id) REFERENCES products(prod_id),
    CONSTRAINT command_line_PK PRIMARY KEY (cline_id)
);