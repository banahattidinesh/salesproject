DROP TABLE IF EXISTS arcade_scores;

CREATE TABLE arcade_scores (
    player_name VARCHAR(50),
    dimension VARCHAR(50),
    score INT
);

INSERT INTO arcade_scores (player_name, dimension, score) VALUES
('Chris', 'Neon City', 9500),
('Aisha', 'Neon City', 8200),
('Raj', 'Void Realm', 12000),
('Chris', 'Void Realm', 10500),
('Priya', 'Neon City', 9800),
('Amit', 'Void Realm', 11000);

select player_name, dimension, score,
 ROW_NUMBER() OVER(PARTITION BY dimension ORDER BY score DESC) AS overall_rank
 from arcade_scores;

 SELECT 
    player_name, 
    score,
    LAG(score) OVER(PARTITION BY player_name ORDER BY score ASC) AS previous_score
FROM arcade_scores;

SELECT 
    player_name, 
    score,
    LAG(score) OVER(PARTITION BY player_name ORDER BY score) AS previous_score,
    LEAD(score) OVER(PARTITION BY player_name ORDER BY score) AS next_score
FROM arcade_scores
WHERE player_name = 'Chris';


EXPLAIN ANALYZE SELECT * FROM arcade_scores WHERE player_name = 'Chris';

CREATE INDEX idx_player_name ON arcade_scores(player_name);


EXPLAIN ANALYZE SELECT * FROM arcade_scores WHERE player_name = 'Chris';
