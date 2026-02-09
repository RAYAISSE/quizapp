QUIZAPP - RESUME DU PROJET

1. Code Source

Backend (Spring Boot)
- Structure Maven (pom.xml)
- Classe principale : QuizAppApplication.java
- Entités JPA : Question.java, Answer.java
- Repositories : QuestionRepository.java, AnswerRepository.java
- Service métier : QuizService.java (logique de calcul du score)
- Controller REST : QuizController.java avec endpoints
- DTOs : QuestionDTO, AnswerDTO, SubmitAnswersDTO, ScoreResponseDTO
- Configuration : application.properties
- CORS activé pour communication frontend ↔ backend

Frontend (ReactJS)
- App principal : App.js (gestion d'état global)
- Pages :
  - Home.js : Ecran d'accueil avec bouton démarrage
  - Quiz.js : Gestion du quiz avec navigation précédent/suivant
  - Results.js : Affichage des résultats finaux
- Composants réutilisables :
  - Question.js : Affichage d'une question et ses réponses
- Styling complet : index.css (design moderne et responsive)
- Communication Async : Axios pour appels HTTP
- State Management : React Hooks (useState, useEffect)

2. Script de Base de Données

- Fichier : database.sql
- Création automatique des tables :
  - question : text, category
  - answer : text, is_correct, question_id
- Relations : Foreign Key de Answer vers Question
- Données : 20 questions pré-chargées
- Format : SQL standard PostgreSQL

3. Documentation

- README.md : Documentation complète
  - Table des matières
  - Fonctionnalités détaillées
  - Architecture technique
  - Prérequis
  - Installation étape par étape
  - Lancement de l'application
  - Structure complète du projet
  - Documentation API
  - Exemples d'utilisation
  - Troubleshooting
  - Notes de sécurité

- start.sh : Script d'automatisation (Linux/Mac)
- start.bat : Script d'automatisation (Windows)
- .gitignore : Pour backend et frontend

COMMENT DÉMARRER

Option 1 : Script Automatisé (Recommandé pour Windows)
```bash
double-cliquer sur start.bat
```

Option 2 : Manuel (Recommandé pour Linux/Mac)
```bash
 Terminal 1 - Database
psql -U postgres -d quizapp -f database.sql

 Terminal 2 - Backend
cd backend
mvn spring-boot:run

 Terminal 3 - Frontend
cd frontend
npm install
npm start
```

 Option 3 : Script Shell (Linux/Mac)
```bash
chmod +x start.sh
./start.sh
```

TECHNOLOGIES UTILISÉES

Frontend:
- React 18.2.0
- Axios 1.4.0
- CSS3
- React Hooks (useState, useEffect)

Backend:
- Spring Boot 3.1.0
- Spring Data JPA
- Maven
- PostgreSQL Driver
- Lombok

Database:
- PostgreSQL 12+
- SQL standard
