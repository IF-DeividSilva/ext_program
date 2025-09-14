-- Criar o banco e selecionar
CREATE DATABASE pokemon_tcg1;
USE pokemon_tcg1;

-- Tabela de coleções
CREATE TABLE tbl_collections (
    id INT AUTO_INCREMENT PRIMARY KEY,
    collectionsSetName VARCHAR(255) NOT NULL,
    releaseDate DATE NOT NULL,
    totalCardsInCollection INT NOT NULL
);

-- Tabela de tipos
CREATE TABLE tbl_types (
    id INT AUTO_INCREMENT PRIMARY KEY,
    typeName VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de estágios
CREATE TABLE tbl_stages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    stageName VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela de cartas
CREATE TABLE tbl_cards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hp INT,
    name VARCHAR(255) NOT NULL,
    type_id INT NOT NULL,
    stage_id INT NOT NULL,
    info TEXT,
    attack TEXT,
    damage VARCHAR(50),
    weak VARCHAR(100),
    ressis VARCHAR(100),
    retreat VARCHAR(100),
    cardNumberInCollection VARCHAR(50),
    collection_id INT NOT NULL,
    CONSTRAINT fk_collection
        FOREIGN KEY (collection_id)
        REFERENCES tbl_collections (id)
        ON DELETE CASCADE,
    CONSTRAINT fk_type
        FOREIGN KEY (type_id)
        REFERENCES tbl_types (id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_stage
        FOREIGN KEY (stage_id)
        REFERENCES tbl_stages (id)
        ON DELETE RESTRICT
);
