CREATE TABLE IF NOT EXISTS question (
    id SERIAL PRIMARY KEY,
    text TEXT NOT NULL,
    category VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS answer (
    id SERIAL PRIMARY KEY,
    text VARCHAR(255) NOT NULL,
    is_correct BOOLEAN NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question(id) ON DELETE CASCADE
);

-- Suppression des données existantes pour réinitialiser
DELETE FROM answer;
DELETE FROM question;

-- Insertion des questions avec bon encodage UTF-8
INSERT INTO question (text, category) VALUES
('Quelle est la capitale du Burkina Faso ?', 'Géographie'),
('Quel était l''ancien nom du Burkina Faso avant 1984 ?', 'Histoire'),
('En quelle année le Burkina Faso a-t-il obtenu son indépendance ?', 'Histoire'),
('Qui est considéré comme le père de la révolution burkinabè ?', 'Politique'),
('Quelle est la devise nationale du Burkina Faso ?', 'Culture'),
('Quelle ville accueille la Semaine nationale de la culture (SNC) ?', 'Culture'),
('Quel grand festival de cinéma se déroule à Ouagadougou ?', 'Culture'),
('Quelle est la langue officielle du Burkina Faso ?', 'Société'),
('Combien de pays frontaliers entourent le Burkina Faso ?', 'Géographie'),
('Quelle ville est surnommée la capitale économique du Burkina Faso ?', 'Économie'),
('Quel fleuve traverse l''Ouest du Burkina Faso ?', 'Géographie'),
('Quel instrument de musique traditionnel est emblématique ?', 'Culture'),
('Quel plat traditionnel est préparé à base de mil ou de maïs ?', 'Culture'),
('Quelle est la principale ressource minière du Burkina Faso ?', 'Économie'),
('Quelle culture agricole est surnommée l''or blanc ?', 'Économie'),
('Quelle est la monnaie utilisée au Burkina Faso ?', 'Économie'),
('Quelle organisation régionale regroupe le Burkina Faso ?', 'Politique'),
('Quel sport est le plus populaire au Burkina Faso ?', 'Sport'),
('Quelle religion est la plus pratiquée ?', 'Société'),
('Quelle ville est le siège du FESPACO ?', 'Culture');

-- Insertion des réponses pour Question 1
INSERT INTO answer (text, is_correct, question_id) VALUES
('Ouagadougou', true, 1),
('Bobo-Dioulasso', false, 1),
('Koudougou', false, 1),
('Banfora', false, 1);

-- Insertion des réponses pour Question 2
INSERT INTO answer (text, is_correct, question_id) VALUES
('Haute-Volta', true, 2),
('Côte d''Or', false, 2),
('Dahomey', false, 2),
('Niger', false, 2);

-- Insertion des réponses pour Question 3
INSERT INTO answer (text, is_correct, question_id) VALUES
('1960', true, 3),
('1958', false, 3),
('1965', false, 3),
('1972', false, 3);

-- Insertion des réponses pour Question 4
INSERT INTO answer (text, is_correct, question_id) VALUES
('Thomas Sankara', true, 4),
('Blaise Compaoré', false, 4),
('Maurice Yaméogo', false, 4),
('Norbert Zongo', false, 4);

-- Insertion des réponses pour Question 5
INSERT INTO answer (text, is_correct, question_id) VALUES
('Unité - Progrès - Justice', false, 5),
('Travail - Liberté - Patrie', false, 5),
('La Patrie ou la Mort, Nous Vaincrons', true, 5),
('Foi - Espoir - Courage', false, 5);

-- Insertion des réponses pour Question 6
INSERT INTO answer (text, is_correct, question_id) VALUES
('Bobo-Dioulasso', true, 6),
('Ouagadougou', false, 6),
('Kaya', false, 6),
('Tenkodogo', false, 6);

-- Insertion des réponses pour Question 7
INSERT INTO answer (text, is_correct, question_id) VALUES
('FESPACO', true, 7),
('Cannes', false, 7),
('Berlinale', false, 7),
('Carthage', false, 7);

-- Insertion des réponses pour Question 8
INSERT INTO answer (text, is_correct, question_id) VALUES
('Français', false, 8),
('Mooré', true, 8),
('Dioula', false, 8),
('Anglais', false, 8);

-- Insertion des réponses pour Question 9
INSERT INTO answer (text, is_correct, question_id) VALUES
('7', false, 9),
('6', true, 9),
('5', false, 9),
('8', false, 9);

-- Insertion des réponses pour Question 10
INSERT INTO answer (text, is_correct, question_id) VALUES
('Bobo-Dioulasso', true, 10),
('Ouagadougou', false, 10),
('Kaya', false, 10),
('Tenkodogo', false, 10);

-- Insertion des réponses pour Question 11
INSERT INTO answer (text, is_correct, question_id) VALUES
('Mouhoun', true, 11),
('Niger', false, 11),
('Volta Noire', false, 11),
('Comoé', false, 11);

-- Insertion des réponses pour Question 12
INSERT INTO answer (text, is_correct, question_id) VALUES
('Balafon', true, 12),
('Kora', false, 12),
('Ngoni', false, 12),
('Djembe', false, 12);

-- Insertion des réponses pour Question 13
INSERT INTO answer (text, is_correct, question_id) VALUES
('Tô', true, 13),
('Riz gras', false, 13),
('Couscous', false, 13),
('Attieke', false, 13);

-- Insertion des réponses pour Question 14
INSERT INTO answer (text, is_correct, question_id) VALUES
('Or', true, 14),
('Coton', false, 14),
('Manganèse', false, 14),
('Uranium', false, 14);

-- Insertion des réponses pour Question 15
INSERT INTO answer (text, is_correct, question_id) VALUES
('Coton', true, 15),
('Maïs', false, 15),
('Sorgho', false, 15),
('Riz', false, 15);

-- Insertion des réponses pour Question 16
INSERT INTO answer (text, is_correct, question_id) VALUES
('Franc CFA', true, 16),
('Naira', false, 16),
('Dollar', false, 16),
('Euro', false, 16);

-- Insertion des réponses pour Question 17
INSERT INTO answer (text, is_correct, question_id) VALUES
('CEDEAO', false, 17),
('Union Africaine', false, 17),
('AES', true, 17),
('CEMAC', false, 17);

-- Insertion des réponses pour Question 18
INSERT INTO answer (text, is_correct, question_id) VALUES
('Football', true, 18),
('Basketball', false, 18),
('Lutte traditionnelle', false, 18),
('Cyclisme', false, 18);

-- Insertion des réponses pour Question 19
INSERT INTO answer (text, is_correct, question_id) VALUES
('Islam', true, 19),
('Christianisme', false, 19),
('Animisme', false, 19),
('Judaïsme', false, 19);

-- Insertion des réponses pour Question 20
INSERT INTO answer (text, is_correct, question_id) VALUES
('Ouagadougou', true, 20),
('Bobo-Dioulasso', false, 20),
('Kaya', false, 20),
('Banfora', false, 20);
