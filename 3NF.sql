--3NF 


--Creating main table (p_table) previous pokemon_table had weakness inside this table doesnt
DROP TABLE p_table;
CREATE TABLE IF NOT EXISTS p_table (
  pokedex_number INTEGER PRIMARY KEY,
  type_id INTEGER,
  name VARCHAR(80) NOT NULL,
  classification VARCHAR(80) NOT NULL,
  experience_growth NUMERIC, 
  height_m NUMERIC, 
  weight_kg NUMERIC, 
  base_egg_steps NUMERIC,
  base_total NUMERIC,
  base_happiness NUMERIC, 
  is_legendary NUMERIC,
  generation NUMERIC,
  percentage_male NUMERIC,
  capture_rate NUMERIC,
  hp NUMERIC,
  sp_attack NUMERIC,
  sp_defense NUMERIC,
  defense NUMERIC,
  attack NUMERIC,
  FOREIGN KEY (type_id) REFERENCES type_table(type_id)
  );

--Inserting info into p_table
INSERT INTO p_table (type_id, name, classification, experience_growth, height_m, weight_kg, base_egg_steps, base_total, base_happiness, is_legendary, generation, percentage_male, capture_rate, hp, sp_attack, sp_defense, defense, attack)
SELECT
  type_table.type_id,
  first_NF_pokemon.name, 
  first_NF_pokemon.classification,
  first_NF_pokemon.experience_growth,
  first_NF_pokemon.height_m,
  first_NF_pokemon.weight_kg,
  first_NF_pokemon.base_egg_steps,
  first_NF_pokemon.base_total,
  first_NF_pokemon.base_happiness,
  first_NF_pokemon.is_legendary,
  first_NF_pokemon.generation,
  first_NF_pokemon.percentage_male,
  first_NF_pokemon.capture_rate,
  first_NF_pokemon.hp,
  first_NF_pokemon.sp_attack,
  first_NF_pokemon.sp_defense,
  first_NF_pokemon.defense,
  first_NF_pokemon.attack
FROM first_NF_pokemon, type_table;

--Creating linking table between abilities_table and pokemon_table
CREATE TABLE IF NOT EXISTS pokemon_ability_linking (
  ability_id INTEGER,
  pokedex_number INTEGER,
  FOREIGN KEY (pokedex_number) REFERENCES pokemon_table(pokedex_number),
  FOREIGN KEY (ability_id) REFERENCES abilities_table(ability_id)
 );

  --Inserting info into linking table (ability_id)
  INSERT INTO pokemon_ability_linking (ability_id)
  SELECT 
    abilities_table.ability_id
  FROM abilities_table;

  --Inserting info into linking table (type )
  INSERT INTO pokemon_ability_linking (pokedex_number)
  SELECT 
    pokemon_table.pokedex_number
  FROM pokemon_table;


--Create linking table between pokemon and type table 
-- CREATE TABLE IF NOT EXISTS pokemon_type_table (
--   type_id INTEGER,
--   pokedex_number INTEGER,
--   FOREIGN KEY (pokedex_number) REFERENCES pokemon_table(pokedex_number),
--   FOREIGN KEY (type_id) REFERENCES type_table(type_id)
-- )

-- --Inserting info into linking table (ability_id)
-- INSERT INTO pokemon_type_table (type_id)
-- SELECT 
--   type_table.type_id,
-- FROM type_table;

-- --Inserting info into linking table (pokedex_number)
-- INSERT INTO pokemon_type_table (pokedex_number)
-- SELECT
--   pokemon_table.pokedex_number
-- FROM pokemon_table;



--create  a new weakness table with a composite key 
CREATE TABLE IF NOT EXISTS weakness_table (
  type_id INTEGER PRIMARY KEY,
  against_psychic NUMERIC,
  against_dark NUMERIC,
  against_dragon NUMERIC,
  against_electric NUMERIC,
  against_fairy NUMERIC,
  against_fight NUMERIC,
  against_fire NUMERIC,
  against_flying NUMERIC,
  against_ghost NUMERIC,
  against_grass NUMERIC,
  against_ground NUMERIC,
  against_normal NUMERIC,
  against_poison NUMERIC, 
  against_bug NUMERIC,
  against_rock NUMERIC,
  against_water NUMERIC,
  against_ice NUMERIC,
  against_steel NUMERIC
);

INSERT INTO weakness_table (against_psychic, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_normal, against_poison, against_bug, against_rock, against_water, against_ice, against_steel)
SELECT 
  first_NF_pokemon.against_psychic,
  first_NF_pokemon.against_dark,
  first_NF_pokemon.against_dragon,
  first_NF_pokemon.against_electric,
  first_NF_pokemon.against_fairy,
  first_NF_pokemon.against_fight,
  first_NF_pokemon.against_fire,
  first_NF_pokemon.against_flying,
  first_NF_pokemon.against_ghost,
  first_NF_pokemon.against_grass,
  first_NF_pokemon.against_ground,
  first_NF_pokemon.against_normal,
  first_NF_pokemon.against_poison,
  first_NF_pokemon.against_bug, 
  first_NF_pokemon.against_rock,
  first_NF_pokemon.against_water,
  first_NF_pokemon.against_ice,
  first_NF_pokemon.against_steel
FROM first_NF_pokemon;





DROP TABLE imported_pokemon.data;
DROP TABLE first_NF_pokemon;
DROP TABLE pokemon_table; 




