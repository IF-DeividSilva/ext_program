CREATE VIEW vw_cards_detalhes AS
SELECT 
    c.id,
    c.hp,
    c.name,
    t.typeName AS type,
    s.stageName AS stage,
    c.info,
    c.attack,
    c.damage,
    c.weak,
    c.ressis,
    c.retreat,
    c.cardNumberInCollection,
    col.collectionsSetName AS collectionName,
    col.releaseDate,
    col.totalCardsInCollection
FROM tbl_cards c
INNER JOIN tbl_types t 
    ON c.type_id = t.id
INNER JOIN tbl_stages s 
    ON c.stage_id = s.id
INNER JOIN tbl_collections col 
    ON c.collection_id = col.id;
