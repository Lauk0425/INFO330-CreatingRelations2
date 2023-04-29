--creating tables so there are no partial dependencies 
--start of 2NF

--Creating main table (pokemon_table)
DROP TABLE pokemon_table;
CREATE TABLE IF NOT EXISTS pokemon_table (
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
  against_steel NUMERIC,
  FOREIGN KEY (type_id) REFERENCES type_table(type_id)
  );

--Inserting info into pokemon table
INSERT INTO pokemon_table (type_id, name, classification, experience_growth, height_m, weight_kg, base_egg_steps, base_total, base_happiness, is_legendary, generation, percentage_male, capture_rate, hp, sp_attack, sp_defense, defense, attack, against_psychic, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_normal, against_poison, against_bug, against_rock, against_water, against_ice, against_steel)
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
  first_NF_pokemon.attack,
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
FROM first_NF_pokemon, type_table;

--creating abilites_table
DROP TABLE abilities_table;
CREATE TABLE IF NOT EXISTS abilities_table (
  ability_id INTEGER PRIMARY KEY,
  ability VARCHAR(80)
);

--Inserting into abilities table
INSERT INTO abilities_table (ability)
SELECT
  first_NF_pokemon.split_ability
FROM first_NF_pokemon;


--Creating type_table
DROP TABLE type_table;
CREATE TABLE IF NOT EXISTS type_table (
  type_id INTEGER PRIMARY KEY,
  type1 VARCHAR(80),
  type2 VARCHAR(80)
);

--Inserting into type_table
INSERT INTO type_table (type1, type2)
SELECT DISTINCT
  first_NF_pokemon.type1,
  first_NF_pokemon.type2
FROM first_NF_pokemon;

--Creating pokemon_weakness_table
--DROP TABLE pokemon_weakness_table;
--CREATE TABLE IF NOT EXISTS pokemon_weakness_table (
  --weakness_id INTEGER PRIMARY KEY,
  --against_psychic NUMERIC,
  --against_dark NUMERIC,
  --against_dragon NUMERIC,
  --against_electric NUMERIC,
  --against_fairy NUMERIC,
  --against_fight NUMERIC,
  --against_fire NUMERIC,
  --against_flying NUMERIC,
  --against_ghost NUMERIC,
  --against_grass NUMERIC,
  --against_ground NUMERIC,
  --against_normal NUMERIC,
  --against_poison NUMERIC, 
  --against_bug NUMERIC,
  --against_rock NUMERIC,
  --against_water NUMERIC,
  --against_ice NUMERIC, 
  --against_steel NUMERIC
--);

-- Forgot to include against_ice and against_steel
--ALTER TABLE pokemon_weakness_table
--ADD against_ice NUMERIC;

--ALTER TABLE pokemon_weakness_table
--ADD against_steel NUMERIC;



--Inserting info into pokemon weakness (information from first_NF_pokemon)
--INSERT INTO pokemon_weakness_table (against_psychic, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_normal, against_poison, against_bug, against_rock, against_water, against_ice, against_steel)
--SELECT DISTINCT
  --first_NF_pokemon.against_psychic,
  --first_NF_pokemon.against_dark,
  --first_NF_pokemon.against_dragon,
  --first_NF_pokemon.against_electric,
  --first_NF_pokemon.against_fairy,
  --first_NF_pokemon.against_fight,
  --first_NF_pokemon.against_fire,
  --first_NF_pokemon.against_flying,
  --first_NF_pokemon.against_ghost,
  --first_NF_pokemon.against_grass,
  --first_NF_pokemon.against_ground,
  --first_NF_pokemon.against_normal,
  --first_NF_pokemon.against_poison,
  --first_NF_pokemon.against_bug, 
  --first_NF_pokemon.against_rock,
  --first_NF_pokemon.against_water,
  --first_NF_pokemon.against_ice,
  --first_NF_pokemon.against_steel
--FROM first_NF_pokemon;


-- Forgot to include against_ice and against_steel
--ALTER TABLE pokemon_weakness_table
--ADD against_ice NUMERIC;

--ALTER TABLE pokemon_weakness_table
--ADD against_steel NUMERIC;












