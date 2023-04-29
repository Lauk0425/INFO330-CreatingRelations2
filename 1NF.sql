
--creating a new table so I can split abilites
CREATE TABLE IF NOT EXISTS split_abilities (
  ability_id VARCHAR,
  pokedex_number INTEGER,
  split_ability VARCHAR
);
--splitting the ability_id into seperate column
INSERT INTO split_abilities (ability_id, pokedex_number, split_ability)
SELECT
  imported_pokemon.abilities, 
  imported_pokemon.pokedex_number,
  trim(value) as split_ability
FROM imported_pokemon, 
json_each('["' || replace(abilities, ',', '","') || '"]')
WHERE trim(value) <> '';

--fixing splitting statment to remove front bracket and end bracket
UPDATE split_abilities SET split_ability = replace(split_ability, '[','');
UPDATE split_abilities SET split_ability = replace(split_ability, ']','');


-- new table with updating split_abilites and information from CSV
CREATE TABLE IF NOT EXISTS first_NF_pokemon as
SELECT * 
FROM imported_pokemon
LEFT JOIN split_abilities on imported_pokemon.pokedex_number = split_abilities.pokedex_number;

-- fixing spelling on one of the columns
ALTER TABLE first_NF_pokemon 
RENAME COLUMN classfication TO classification;

--removing the original abilites and ability_id
ALTER TABLE first_NF_pokemon DROP COLUMN abilities;
ALTER TABLE first_NF_pokemon DROP COLUMN ability_id;

--Removing former tables
DROP TABLE imported_pokemon;
DROP TABLE split_abilities;






