DROP DATABASE IF EXISTS eval;
CREATE DATABASE eval;
USE eval;

CREATE TABLE client(
  cli_num INT AUTO_INCREMENT NOT NULL,
  cli_nom VARCHAR (50),
  cli_adresse VARCHAR (155),
  cli_tel VARCHAR (30),
  PRIMARY KEY (cli_num)
);

CREATE TABLE produit(
  pro_num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  pro_libelle VARCHAR (50),
  pro_description VARCHAR (50)
);

CREATE TABLE commande(
  com_num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  com_date DATETIME,
  com_obs VARCHAR (50),
  cli_num INT,
  FOREIGN KEY (cli_num) REFERENCES client(cli_num)
);

CREATE TABLE est_compose(
  com_num INT AUTO_INCREMENT NOT NULL,
  pro_num INT AUTO_INCREMENT NOT NULL,
  est_qte INT,
  PRIMARY KEY (com_num,pro_num),
  FOREIGN KEY (com_num) REFERENCES commande(com_num),
  FOREIGN KEY (pro_num) REFERENCES produit(pro_num)
);

CREATE INDEX `nom` ON `client`;
