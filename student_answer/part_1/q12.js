const q12 = `SELECT pokemon.pokedex_number AS N°, pokemon."name" AS 'Nom du pokemon', ability."name" AS 'Nom du talent'
FROM pokemon
JOIN ability ON pokemon_ability.ability_id = ability.ability_id
JOIN pokemon_type ON pokemon_type.pokemon_id = pokemon.pokemon_id
JOIN pokemon_ability ON pokemon_ability.pokemon_id = pokemon.pokemon_id
WHERE pokemon_type.type_id IN (
SELECT type_id 
FROM "type"
WHERE "type".name = 'Acier' AND is_hidden = 1
)
ORDER BY pokemon.pokedex_number;`;

module.exports = q12;
