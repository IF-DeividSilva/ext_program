-- Seed tbl_collections
INSERT INTO tbl_collections (collectionsSetName, releaseDate, totalCardsInCollection) VALUES
('Base Set', '1999-01-09', 102),
('Jungle', '1999-06-16', 64),
('Fossil', '1999-10-10', 62);

-- Seed tbl_types
INSERT INTO tbl_types (typeName) VALUES
('Grass'),
('Fire'),
('Water'),
('Lightning'),
('Psychic'),
('Fighting'),
('Darkness'),
('Metal'),
('Fairy'),
('Dragon'),
('Colorless');

-- Seed tbl_stages
INSERT INTO tbl_stages (stageName) VALUES
('Basic'),
('Stage 1'),
('Stage 2'),
('Mega');

-- Seed tbl_cards
-- Example: Bulbasaur (Grass, Basic, Base Set)
INSERT INTO tbl_cards (
    hp, name, type_id, stage_id, info, attack, damage, weak, ressis, retreat, cardNumberInCollection, collection_id
) VALUES
(40, 'Bulbasaur', 1, 1, 'Seed Pokémon', 'Leech Seed', '20', 'Fire', NULL, '1', '44/102', 1),

-- Example: Charizard (Fire, Stage 2, Base Set)
(120, 'Charizard', 2, 3, 'Flame Pokémon', 'Fire Spin', '100', 'Water', NULL, '3', '4/102', 1),

-- Example: Pikachu (Lightning, Basic, Jungle)
(40, 'Pikachu', 4, 1, 'Mouse Pokémon', 'Thunder Jolt', '30', 'Fighting', 'Metal', '1', '60/64', 2),

-- Example: Gyarados (Water, Stage 1, Fossil)
(100, 'Gyarados', 3, 2, 'Atrocious Pokémon', 'Dragon Rage', '50', 'Lightning', NULL, '3', '6/62', 3);
