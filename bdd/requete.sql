-- Procédure voire les produits
DELIMITER $

CREATE PROCEDURE showProduct()
BEGIN
    SELECT * FROM produit;
END$

DELIMITER ;

SHOW PROCEDURE STATUS LIKE 'showProduct';
CALL showProduct();

-- Procédure ajouté les produits
DELIMITER $

CREATE PROCEDURE addProduct()
BEGIN
    INSERT INTO `produit` (id_produit, nom_prod, desc_prod, prix_ht_prod, Id_sous_rubrique) values
    ('4','produit4','desc4','10.00','2'),
    ('5','produit5','desc5','10.00','1');
END$

DELIMITER ;

SHOW PROCEDURE STATUS LIKE 'addProduct';
CALL addProduct();

-- Procédure supprimé les produits
DELIMITER $

CREATE PROCEDURE delProduct()
BEGIN
    DELETE FROM `produit` WHERE Id_produit = 5;
END$

DELIMITER ;

SHOW PROCEDURE STATUS LIKE 'delProduct';
CALL delProduct();

-- Procédure modifié les produits
DELIMITER $

CREATE PROCEDURE updateProduct()
BEGIN
    UPDATE `produit` SET prix_ht_prod = '40.00' WHERE Id_produit = 3;
END$

DELIMITER ;

SHOW PROCEDURE STATUS LIKE 'updateProduct';
CALL updateProduct();

-- Transaction ajouté les produits
START TRANSACTION;
SELECT * FROM produit;
INSERT INTO `produit` (id_produit, nom_prod, desc_prod, prix_ht_prod, Id_sous_rubrique) values
    ('4','produit4','desc4','10.00','2'),
    ('5','produit5','desc5','10.00','1');
SELECT * FROM produit;
