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