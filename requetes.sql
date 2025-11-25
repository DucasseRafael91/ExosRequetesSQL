-- Insérer un article dans la table g_article
INSERT INTO `g_article` (`a_reference`, `a_designation`, `a_marque`, `a_quantite`) 
VALUES ('4567123', 'Pneux neiges', 'Michelin', '40');

-- Insérer une voiture dans la table g_voiture liée à un article 
INSERT INTO `g_voiture` (`v_marque`, `v_type`, `v_energie`, `v_fk_article`) 
VALUES ('Renault', 'Clio', 'Hybride', '3');

-- Sélectionner des informations sur les articles et leur voiture associée avec INNER JOIN
SELECT a_designation, a_quantite, a_marque, v_type
FROM g_article
INNER JOIN g_voiture
ON a_id = v_fk_article;

-- Sélectionner des champs entre g_article et g_voiture avec INNER JOIN
SELECT a_designation, a_quantite, a_marque, v_type
FROM g_article
INNER JOIN g_voiture
ON a_id = v_fk_article;

-- Sélectionner articles et voitures avec LEFT JOIN
SELECT `a_reference`, `a_marque`, a_designation, v_marque, v_fk_article_id, v_energie
FROM g_voiture
LEFT JOIN g_article
ON a_id = v_id
GROUP BY a_marque, a_designation
ORDER BY a_marque DESC;

-- Mettre à jour la quantité d'un article
UPDATE `g_article`
SET `a_quantite` = 100
WHERE `g_article`.`a_id` = 1;

-- Supprimer un article
 DELETE FROM g_article 
 WHERE `g_article`.`a_id` = 2 
 
 -- Supprimer une contrainte
 ALTER TABLE g_voiture  DROP FOREIGN KEY article_fk
 
  -- Ajouter une contrainte
   ALTER TABLE `g_voiture` 
   ADD CONSTRAINT `article_fk` 
   FOREIGN KEY (`v_fk_article`) 
   REFERENCES `g_article` (`a_id`) 
   ON UPDATE CASCADE 
   ON DELETE CASCADE