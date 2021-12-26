# CyberClub

## Tech

To build this project you need:

- [Alamofire](https://github.com/Alamofire/Alamofire) - HTTP networking library written in Swift!
- [XAMPP](https://www.apachefriends.org/ru/index.html) - cross-platform web server build containing Apache, MySQL, PHP script interpreter
- SQL DB - should create relation database (below)
- PHP - php files inside project folder(folders: v1, includes). You must import them into htdocs in XAMPP directory

## Database CyberClub:
```sh
CREATE TABLE users(
    id INT(11)  AUTO_INCREMENT NOT NULL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    role ENUM NOT NULL,
    CONSTRAINT fk_role FOREIGN KEY (role) REFERENCES roles (id_role)
);
CREATE TABLE pc(
    id_pc INT(11)  AUTO_INCREMENT NOT NULL PRIMARY KEY,
    type ENUM(‘Standart’,’Pro’,’VIP’) NOT NULL ,
    Status ENUM('Free','Ordered','Available in 15 min','Not available','Busy')
    ava VARCHAR(255),
    CONSTRAINT fk_role FOREIGN KEY (role) REFERENCES roles (id_role)
);
CREATE TABLE orders(
    id_order INT(11)  AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_user INT(11) NOT NULL ,
    CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users (id)
);
CREATE TABLE order_pc(
    id_order_pc INT(11)  AUTO_INCREMENT NOT NULL PRIMARY KEY
    id_pc INT(11) NOT NULL ,
    id_order INT(11) NOT NULL,
    date_start TIMESTAMP,
    date_end TIMESTAMP ,
    CONSTRAINT fk_pc FOREIGN KEY (id_pc) REFERENCES pc (id_pc),
    CONSTRAINT fk_order FOREIGN KEY (rid_order) REFERENCES roles (id_order)
);
CREATE TABLE roles(
    id_role INT(11)  AUTO_INCREMENT NOT NULL PRIMARY KEY,
    roles ENUM(‘common’,‘admin’) NOT NULL DEFAULT ‘common’ ,
    CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES users (id)
);
```
