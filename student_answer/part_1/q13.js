const q13 = `SELECT
pokemon."name" AS 'Nom du pokemon',
COUNT(pokemon_move.move_id)
FROM
pokemon
JOIN pokemon_type ON pokemon_type.pokemon_id = pokemon.pokemon_id
JOIN pokemon_move ON pokemon_move.pokemon_id = pokemon.pokemon_id
JOIN "move" ON pokemon_move.move_id = "move".move_id
WHERE pokemon_type.type_id IN (
SELECT "type".type_id
FROM "type"
WHERE pokemon_type.type_id = "type".type_id
)
GROUP BY
pokemon_type.pokemon_id
ORDER BY
COUNT(pokemon_move.move_id) DESC
LIMIT 10`;

module.exports = q13;
