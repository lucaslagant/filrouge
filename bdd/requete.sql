-- Procédure voire les produits
-- on change le ; par $
DELIMITER $ 
-- Création de la procedure
CREATE PROCEDURE showProduct()
BEGIN
    SELECT * FROM produit;
END$
-- On repasse le $ en ;
DELIMITER ;

-- vérification du status de la procédure 
SHOW PROCEDURE STATUS LIKE 'showProduct';
-- Appelle de la procédure 
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

-- Début de la Transaction
START TRANSACTION;
-- 1er requete pour voir la table avant les changements 
SELECT * FROM produit;
-- Requete pour les changements sur la table 
INSERT INTO `produit` (id_produit, nom_prod, desc_prod, prix_ht_prod, Id_sous_rubrique) values
    ('4','produit4','desc4','10.00','2'),
    ('5','produit5','desc5','10.00','1');
-- 2eme requete pour voir la table après les changements     
SELECT * FROM produit;
