--Extra credit

--inserting name, type and attack into p_table (huskichu)
INSERT INTO p_table (type_id, name, classification, experience_growth, height_m, weight_kg, base_egg_steps, base_total, is_legendary, generation, capture_rate, hp, sp_attack, sp_defense, defense, attack)
VALUES (1000, 'Huskichu', 'Mascot', 1000000, 1.8, 13, 5000, 318, 0, 0, 100, 80, 195, 120, 71, 107);

--Inserting ability into abilities table (huskichu)
INSERT INTO abilities_table (ability_id, ability)
VALUES (329677, 'SQL-Attack');

--Inserting weakness infomration for 'Huskichu'
INSERT INTO weakness_table (against_psychic, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_normal, against_poison, against_bug, against_rock, against_water, against_ice, against_steel)
VALUES (0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25);

--inserting name, type and attack into p_table (cougarite)
INSERT INTO p_table (type_id, name, classification, experience_growth, height_m, weight_kg, base_egg_steps, base_total, is_legendary, generation, capture_rate, hp, sp_attack, sp_defense, defense, attack)
VALUES (1001, 'Cougarite', 'Mascot', 1000001, 1.8, 13, 5000, 318, 0, 0, 1000, 1, 0, 0, 0, 0);

--Inserting ability into abilities table
INSERT INTO abilities_table (ability_id, ability)
VALUES (329680, 'Slow-Attack');

--Inserting weakness infomration for 'Huskichu'
--INSERT INTO weakness_table (against_psychic, against_dark, against_dragon, against_electric, against_fairy, against_fight, against_fire, against_flying, against_ghost, against_grass, against_ground, against_normal, against_poison, against_bug, against_rock, against_water, against_ice, against_steel)
--VALUES (0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25);

