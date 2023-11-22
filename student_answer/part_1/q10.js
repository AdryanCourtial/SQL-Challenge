const q10 = `SELECT t."name" AS 'Type', m."name" AS 'Meilleure capacité', MAX(m."power") AS 'Meilleure puissance',
m."name" AS 'Pire capacité', MIN(m."power") AS 'Pire puissance'
FROM move m
JOIN type t ON m.type_id = t.type_id
GROUP BY t.name`;

module.exports = q10;

//A REFAIRE
