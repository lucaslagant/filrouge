DROP DATABASE IF EXISTS filrouge;

CREATE DATABASE filrouge;

USE filrouge;

CREATE TABLE client(
   Id_client INT AUTO_INCREMENT,
   client_name VARCHAR(50),
   client_firstname VARCHAR(50),
   client_email VARCHAR(50),
   client_password VARCHAR(50),
   client_rôle BOOLEAN,
   PRIMARY KEY(Id_client)
);

CREATE TABLE sous_rubrique(
   Id_sous_rubrique INT AUTO_INCREMENT,
   nom_sous_rubrique VARCHAR(50),
   desc_sous_rubrique VARCHAR(50),
   img_sous_rubrique VARCHAR(50),
   PRIMARY KEY(Id_sous_rubrique)
);

CREATE TABLE adresse_client(
   Id_adresse_client INT AUTO_INCREMENT,
   num_adresse INT,
   rue VARCHAR(50),
   code_postal VARCHAR(50),
   ville VARCHAR(50),
   num_dep INT,
   pays VARCHAR(50),
   Id_client INT NOT NULL,
   PRIMARY KEY(Id_adresse_client),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client)
);

CREATE TABLE fournisseur(
   Id_fournnisseur INT AUTO_INCREMENT,
   nom_fournis VARCHAR(50),
   email_fournis VARCHAR(50),
   PRIMARY KEY(Id_fournnisseur)
);

CREATE TABLE rubrique(
   Id_rubrique INT AUTO_INCREMENT,
   img_rub VARCHAR(50),
   nom_rubrique VARCHAR(50),
   desc_rubrique VARCHAR(50),
   Id_sous_rubrique INT NOT NULL,
   PRIMARY KEY(Id_rubrique),
   FOREIGN KEY(Id_sous_rubrique) REFERENCES sous_rubrique(Id_sous_rubrique)
);

CREATE TABLE réduction(
   Id_réduction INT AUTO_INCREMENT,
   pourcentage_reduc DECIMAL(2,2),
   actif_réduc BOOLEAN,
   PRIMARY KEY(Id_réduction)
);

CREATE TABLE commerciales(
   Id_commerciales INT AUTO_INCREMENT,
   nom_commer VARCHAR(50),
   prenom_commer VARCHAR(50),
   email_commer VARCHAR(50),
   PRIMARY KEY(Id_commerciales)
);

CREATE TABLE photo(
   Id_photo INT AUTO_INCREMENT,
   nom VARCHAR(50),
   PRIMARY KEY(Id_photo)
);

CREATE TABLE produit(
   Id_produit INT AUTO_INCREMENT,
   nom_prod VARCHAR(50),
   desc_prod VARCHAR(50),
   prix_ht_prod DECIMAL(6,2),
   Id_sous_rubrique INT NOT NULL,
   PRIMARY KEY(Id_produit),
   FOREIGN KEY(Id_sous_rubrique) REFERENCES sous_rubrique(Id_sous_rubrique)
);

CREATE TABLE livraison(
   Id_livraison INT AUTO_INCREMENT,
   date_liv DATE,
   Id_produit INT NOT NULL,
   PRIMARY KEY(Id_livraison),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit)
);

CREATE TABLE caractéristique(
   Id_caractéristique INT AUTO_INCREMENT,
   taille VARCHAR(50),
   couleur VARCHAR(50),
   Id_produit INT NOT NULL,
   PRIMARY KEY(Id_caractéristique),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit)
);

CREATE TABLE commande(
   Id_commande INT AUTO_INCREMENT,
   comm_date DATE,
   comm_prix_ht DECIMAL(6,2),
   comm_prix_ttc DECIMAL(6,2),
   nom_payement VARCHAR(50),
   date_payement DATE,
   Id_produit INT NOT NULL,
   Id_client INT NOT NULL,
   PRIMARY KEY(Id_commande),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client)
);

CREATE TABLE fournis(
   Id_produit INT,
   Id_fournnisseur INT,
   ref_fournis VARCHAR(50),
   PRIMARY KEY(Id_produit, Id_fournnisseur),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_fournnisseur) REFERENCES fournisseur(Id_fournnisseur)
);

CREATE TABLE engendre(
   Id_livraison INT,
   ref_comm VARCHAR(50),
   Id_commande INT NOT NULL,
   PRIMARY KEY(Id_livraison),
   FOREIGN KEY(Id_livraison) REFERENCES livraison(Id_livraison),
   FOREIGN KEY(Id_commande) REFERENCES commande(Id_commande)
);

CREATE TABLE reçoit1(
   Id_client INT,
   Id_livraison INT,
   adresse_livraison VARCHAR(50),
   PRIMARY KEY(Id_client, Id_livraison),
   FOREIGN KEY(Id_client) REFERENCES client(Id_client),
   FOREIGN KEY(Id_livraison) REFERENCES livraison(Id_livraison)
);

CREATE TABLE déduit(
   Id_produit INT,
   Id_réduction INT,
   PRIMARY KEY(Id_produit, Id_réduction),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_réduction) REFERENCES réduction(Id_réduction)
);

CREATE TABLE gère(
   Id_réduction INT,
   Id_commerciales INT,
   PRIMARY KEY(Id_réduction, Id_commerciales),
   FOREIGN KEY(Id_réduction) REFERENCES réduction(Id_réduction),
   FOREIGN KEY(Id_commerciales) REFERENCES commerciales(Id_commerciales)
);

CREATE TABLE publie_supprime(
   Id_produit INT,
   Id_commerciales INT,
   PRIMARY KEY(Id_produit, Id_commerciales),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_commerciales) REFERENCES commerciales(Id_commerciales)
);

CREATE TABLE contient(
   Id_produit INT,
   Id_photo INT,
   PRIMARY KEY(Id_produit, Id_photo),
   FOREIGN KEY(Id_produit) REFERENCES produit(Id_produit),
   FOREIGN KEY(Id_photo) REFERENCES photo(Id_photo)
);
