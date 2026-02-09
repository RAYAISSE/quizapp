QuizApp - Application de Quiz Interactive

Une application web de type Quiz développée avec une stack technologique moderne : **Spring Boot** (backend), **ReactJS** (frontend) et **PostgreSQL** (base de données).

Table des Matières

- [Fonctionnalités](#fonctionnalités)
- [Architecture Technique](#architecture-technique)
- [Prérequis](#prérequis)
- [Installation et Configuration](#installation-et-configuration)
- [Lancement de l'Application](#lancement-de-lapplication)
- [Structure du Projet](#structure-du-projet)
- [API REST](#api-rest)
- [Utilisation](#utilisation)

---

Fonctionnalités

 Fonctionnalités Minimales Requises

 Démarrage du Quiz
- Page d'accueil simple avec bouton "Démarrer le Quiz"
- Chargement automatique des questions depuis le backend

 Déroulement du Quiz
- Affichage des questions une par une
- Affichage des options de réponse pour chaque question
- Sélection d'une seule réponse par question
- Navigation "Précédent" / "Suivant" entre les questions

Soumission et Résultats
- Bouton "Terminer et voir les résultats" pour soumettre les réponses
- Calcul du score côté serveur
- Affichage du score final

Fonctionnalités Supplémentaires

- Barre de progression visuelle
- Interface responsive (compatible mobile)
- Gestion d'erreurs
- Design moderne et intuitif

Architecture Technique

 Backend (Spring Boot)
- Framework : Spring Boot 3.1.0
- Langage : Java 17
- Build : Maven
- Dépendances : Spring Web, Spring Data JPA, PostgreSQL Driver

 Structure des couches :
- Controller : Endpoints REST
- Service : Logique métier (calcul du score)
- Repository : Accès aux données
- Entity : Modèles JPA

Frontend (ReactJS)
- Framework : React 18.2.0
- Gestionnaire d'état : React Hooks (useState, useEffect)
- Communication : Axios pour HTTP
- Styling : CSS3 moderne

Composants principaux :
- App.js : Composant racine
- Home.js : Page d'accueil
- Quiz.js : Gestion du déroulement du quiz
- Results.js : Affichage des résultats
- Question.js : Composant pour une question

Base de Données (PostgreSQL)
- Tables : question et answer
- Relation : OneToMany (Question → Answer)
- Données : 20 questions avec catégories variées

---

Prérequis

Avant de lancer l'application, assurez-vous d'avoir installé :

1. Java 17 ou supérieur
   - Télécharger depuis : https://www.oracle.com/java/technologies/downloads/

2. Node.js et npm (v14+)
   - Télécharger depuis : https://nodejs.org/

3. PostgreSQL (v12+)
   - Télécharger depuis : https://www.postgresql.org/download/

4. Maven (optionnel, inclus dans Spring Boot)
   - Télécharger depuis : https://maven.apache.org/

---

Installation et Configuration

Étape 1 : Configurer PostgreSQL

1. Ouvrir pgAdmin ou psql (terminal PostgreSQL)

2. Créer la base de données :
   ```sql
   CREATE DATABASE quizapp;
   ```

3. Importer le script SQL :
   ```bash
   psql -U postgres -d quizapp -f database.sql
   ```

   Ou manuellement dans pgAdmin :
   - Ouvrir `database.sql`
   - Exécuter le script

4. Vérifier la connexion :
   - Par défaut : postgres / postgres sur `localhost:5432`
   - Si vous avez un autre mot de passe, mettez à jour `backend/src/main/resources/application.properties`

### Étape 2 : Configurer le Backend

1. **Naviguer vers le dossier backend** :
   ```bash
   cd backend
   ```

2. **Mettre à jour les propriétés PostgreSQL** (si nécessaire) :
   - Fichier : `src/main/resources/application.properties`
   - Modifier les lignes :
     ```properties
     spring.datasource.url=jdbc:postgresql://localhost:5432/quizapp
     spring.datasource.username=postgres
     spring.datasource.password=postgres
     ```

3. **Compiler et lancer le backend** :
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

   Ou si Maven n'est pas installé, utiliser le wrapper Maven :
   ```bash
   mvnw clean install
   mvnw spring-boot:run
   ```

   Le backend démarre sur `http://localhost:8080`

### Étape 3 : Configurer le Frontend

1. **Naviguer vers le dossier frontend** :
   ```bash
   cd frontend
   ```

2. **Installer les dépendances** :
   ```bash
   npm install
   ```

3. **Lancer le serveur de développement** :
   ```bash
   npm start
   ```

   L'application React s'ouvrira automatiquement sur `http://localhost:3000`

---

## 🚀 Lancement de l'Application

### Procédure Complète

#### Terminal 1 - Base de Données
```bash
# S'assurer que PostgreSQL est actif
# Sur Windows : le service PostgreSQL doit être en cours d'exécution
# Sur Mac/Linux : démarrer le service PostgreSQL
```

#### Terminal 2 - Backend
```bash
cd backend
mvn spring-boot:run
# Ou
mvn clean install
mvn spring-boot:run
```

**Résultat attendu** :
```
Tomcat started on port(s): 8080
Started QuizAppApplication in X.XXX seconds
```

#### Terminal 3 - Frontend
```bash
cd frontend
npm install  # (si première fois)
npm start
```

**Résultat attendu** :
- Navigateur s'ouvre automatiquement sur `http://localhost:3000`
- Vous voyez la page d'accueil de QuizApp

---

## 📁 Structure du Projet

```
quizapp/
├── backend/
│   ├── pom.xml
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/quizapp/
│   │   │   │   ├── QuizAppApplication.java      # Classe principale
│   │   │   │   ├── controller/
│   │   │   │   │   └── QuizController.java      # Endpoints REST
│   │   │   │   ├── service/
│   │   │   │   │   └── QuizService.java         # Logique métier
│   │   │   │   ├── entity/
│   │   │   │   │   ├── Question.java            # Entité JPA
│   │   │   │   │   └── Answer.java              # Entité JPA
│   │   │   │   ├── repository/
│   │   │   │   │   ├── QuestionRepository.java
│   │   │   │   │   └── AnswerRepository.java
│   │   │   │   ├── dto/
│   │   │   │   │   ├── QuestionDTO.java
│   │   │   │   │   ├── AnswerDTO.java
│   │   │   │   │   ├── SubmitAnswersDTO.java
│   │   │   │   │   └── ScoreResponseDTO.java
│   │   │   │   └── config/
│   │   │   └── resources/
│   │   │       └── application.properties       # Config DB
│   │   └── test/
│   └── target/
│
├── frontend/
│   ├── package.json
│   ├── public/
│   │   └── index.html
│   ├── src/
│   │   ├── App.js                              # Component principal
│   │   ├── App.css
│   │   ├── index.js
│   │   ├── index.css                           # Styles globaux
│   │   ├── components/
│   │   │   └── Question.js                     # Composant Question
│   │   └── pages/
│   │       ├── Home.js                         # Page d'accueil
│   │       ├── Quiz.js                         # Page du quiz
│   │       └── Results.js                      # Page des résultats
│   └── node_modules/
│
├── database.sql                                 # Script SQL avec données
└── README.md                                    # Ce fichier
```

---

## 🔌 API REST

### Endpoints

#### 1. Récupérer les questions
**Endpoint** : `GET /api/quiz`

**Réponse** (200 OK) :
```json
[
  {
    "id": 1,
    "text": "Quelle est la capitale du Burkina Faso ?",
    "category": "Géographie",
    "answers": [
      {"id": 1, "text": "Ouagadougou"},
      {"id": 2, "text": "Bobo-Dioulasso"},
      {"id": 3, "text": "Koudougou"},
      {"id": 4, "text": "Banfora"}
    ]
  },
  ...
]
```

**Note** : Les réponses ne contiennent **pas** l'information `is_correct` (sécurité).

---

#### 2. Soumettre les réponses
**Endpoint** : `POST /api/quiz/submit`

**Body** :
```json
{
  "answers": {
    "1": 1,
    "2": 5,
    "3": 9,
    ...
  }
}
```

Où `"1": 1` signifie "Question 1, Réponse 1".

**Réponse** (200 OK) :
```json
{
  "score": 8,
  "totalQuestions": 20,
  "message": "Votre score : 8/20"
}
```

---

## 📖 Utilisation

### Flux Utilisateur

1. **Accueil** : Cliquer sur "Démarrer le Quiz"
2. **Quiz** : Répondre aux questions une par une
   - Utiliser les boutons "Précédent" / "Suivant"
   - Voir la barre de progression
3. **Résultats** : Voir le score final
   - Cliquer "Retour à l'accueil" pour recommencer

### Exemple de Séquence

```
User clicks "Démarrer le Quiz"
    ↓
Frontend: GET /api/quiz
    ↓
Backend: Récupère 20 questions de la BD
    ↓
Frontend: Affiche Question 1/20
    ↓
User: Sélectionne une réponse
    ↓
User: Clique "Suivant"
    ↓
Frontend: Affiche Question 2/20
    ↓
... (repeat for all 20 questions)
    ↓
User: Clique "Terminer et voir les résultats"
    ↓
Frontend: POST /api/quiz/submit { answers: {...} }
    ↓
Backend: Calcule le score (sécurisé, côté serveur)
    ↓
Frontend: Affiche score final
```

---

## 🐛 Troubleshooting

### Port déjà utilisé
```bash
# Backend port 8080
# Frontend port 3000

# Pour changer le port du backend :
# Modifier src/main/resources/application.properties
server.port=8081
```

### Erreur de connexion à PostgreSQL
```
Error: connect ECONNREFUSED 127.0.0.1:5432

Solution:
1. Vérifier que PostgreSQL est installé et lancé
2. Vérifier les credentials dans application.properties
3. Vérifier que la BD 'quizapp' existe
```

### Erreur CORS
```
Access to XMLHttpRequest blocked by CORS policy

Solution:
- Le backend inclut déjà @CrossOrigin(origins = "*")
- Vérifier que le frontend appelle http://localhost:8080/api/quiz
```

### React ne se lance pas
```bash
# Supprimer node_modules et réinstaller
rm -rf node_modules package-lock.json
npm install
npm start
```

---

## 📊 Données du Quiz

L'application inclut **20 questions** sur le Burkina Faso :

| Catégorie | Nombre de Questions |
|-----------|-------------------|
| Géographie | 3 |
| Histoire | 2 |
| Politique | 2 |
| Culture | 5 |
| Société | 2 |
| Économie | 4 |
| Sport | 1 |
| **Total** | **20** |

Chaque question a **4 options de réponse**, dont **une seule est correcte**.

---

## 📝 Notes de Développement

### Sécurité
- ✅ Logique de calcul du score côté **serveur** (impossible à tricher)
- ✅ Les réponses correctes ne sont **jamais** envoyées au frontend
- ✅ Validation côté serveur des réponses soumises

### Scalabilité
- ✅ Architecture microservices prête
- ✅ Séparation des couches (Controller → Service → Repository)
- ✅ DTOs pour découpler les entités JPA

### Performance
- ✅ Lazy loading des associations JPA
- ✅ Requêtes optimisées
- ✅ State management efficient avec React Hooks

---

**Dernière mise à jour** : 8 février 2026
