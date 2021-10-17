create database pweb2 CHARACTER SET utf8 COLLATE utf8_general_ci;
use pweb2;
create table `CATEGORIES` (ID int NOT NULL AUTO_INCREMENT COMMENT "Category Code",
                             Name varchar(20) NOT NULL COMMENT "Category name",
                             Status tinyint(1) COMMENT "High Demand/Low Demand" DEFAULT 1,
                             Abbreviation varchar (5) COMMENT "Category abbreviation",
                             Description varchar(100) COMMENT "Category description",
                             PRIMARY KEY (ID)) COMMENT="This is the categories table";

create table `PROVIDERS` (ID int NOT NULL AUTO_INCREMENT COMMENT "Provider's Code",
                             Name varchar(20) NOT NULL COMMENT "Provider's name",
                             Status tinyint(1) COMMENT "Active/Inactive " DEFAULT 1,
                             Phone varchar(15) COMMENT "Provider's phone",
                             PRIMARY KEY (ID)) COMMENT="Provider's information table";

create table `ORDERS` (ID int NOT NULL AUTO_INCREMENT COMMENT "Order Code",
                             CLIENT_ID int COMMENT "This order's client ID",
                             EMPLOYEE_ID int COMMENT "This order's employee ID",
                             Date date NOT NULL COMMENT "Order date",
                             Amount smallint COMMENT "Order amount" ,
                             Description varchar(100) COMMENT "Order description",
                             PRIMARY KEY (ID)) COMMENT="Information of ordered orders";

create table `CLIENTS` (ID int NOT NULL AUTO_INCREMENT COMMENT "Client's Code",
                             Name varchar(20) NOT NULL COMMENT "Client's name",
                             Father_surname varchar(20) COMMENT "Client's paternal last name",
                             Mother_surname varchar(20) COMMENT "Client's maternal surname",
                             Address varchar(20) COMMENT "Client's address",
                             Phone varchar(15) NOT NULL COMMENT "Client's phone",
                             `E-mail` varchar(25) COMMENT "Client's E-mail",
                             PRIMARY KEY (ID)) COMMENT="Clients information";

create table `EMPLOYEES` (ID int NOT NULL AUTO_INCREMENT COMMENT "Employee's Code",
                             LOCAL_ID int COMMENT "This product's local ID",
                             Name varchar(20) NOT NULL COMMENT "Employee's name",
                             Father_surname varchar(20) COMMENT "Employee's paternal last name",
                             Mother_surname varchar(20) COMMENT "Employee's maternal last name",
                             Position tinyint(1) NOT NULL COMMENT "Store manager/Assistant Store manager/Operations Manager/Cash Supervisor/Customer Service" DEFAULT 1,
                             Status tinyint(1) COMMENT "Active/Inactive" DEFAULT 1,
                             Address varchar(40) COMMENT "Employee's address",
                             RUC int NOT NULL COMMENT "Employee's RUC",
                             DNI int NOT NULL COMMENT "Employee's DNI",
                             `E-mail` varchar(25) COMMENT "Employee's E-mail",
                             PRIMARY KEY (ID)) COMMENT="Employees working in our branches";

create table `PRODUCTS` (ID int NOT NULL AUTO_INCREMENT COMMENT "Product Code",
                             CATEGORY_ID int COMMENT "This product's category ID",
                             PROVIDER_ID int COMMENT "This product's provider ID",
                             Name varchar(20) NOT NULL COMMENT "Product name",
                             Abbreviaton varchar(5) COMMENT "Product abbreviation",
                             Price decimal(8,2) NOT NULL COMMENT "Price of the product",
                             Status tinyint(1) COMMENT "In stock/Out of Stock" DEFAULT 1,
                             Description varchar(100) COMMENT "Product description",
                             Trademark varchar(40) NOT NULL COMMENT "Brand of the product",
                             PRIMARY KEY (ID)) COMMENT="Products in our catalog";

create table `LOCALS` (ID int NOT NULL AUTO_INCREMENT COMMENT "Local Code",
                             Name varchar(20) NOT NULL COMMENT "Local name",
                             Description varchar(100) COMMENT "Local description",
                             PRIMARY KEY (ID)) COMMENT="Physical name and location of the branch";

create table `PRODUCT_ORDER` (ID int AUTO_INCREMENT,
                             PRODUCT_ID int NOT NULL,
                             ORDER_ID int NOT NULL,
                             PRIMARY KEY (ID),
                             FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (ID),
                             FOREIGN KEY (ORDER_ID) REFERENCES ORDERS (ID));

CREATE INDEX CATEGORY_ID ON `PRODUCTS` (CATEGORY_ID);
CREATE INDEX PROVIDER_ID ON `PRODUCTS` (PROVIDER_ID);
CREATE INDEX CLIENT_ID ON `ORDERS` (CLIENT_ID);
CREATE INDEX EMPLOYEE_ID ON `ORDERS` (EMPLOYEE_ID);
CREATE INDEX LOCAL_ID ON `EMPLOYEES` (LOCAL_ID);

ALTER TABLE `PRODUCTS` ADD FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES (ID);
ALTER TABLE `PRODUCTS` ADD FOREIGN KEY (PROVIDER_ID) REFERENCES PROVIDERS (ID);
ALTER TABLE `EMPLOYEES` ADD FOREIGN KEY (LOCAL_ID) REFERENCES LOCALS (ID);
ALTER TABLE `ORDERS` ADD FOREIGN KEY (CLIENT_ID) REFERENCES CLIENTS (ID);
ALTER TABLE `ORDERS` ADD FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES (ID);

