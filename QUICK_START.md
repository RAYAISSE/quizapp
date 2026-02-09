# GUIDE DE DÉMARRAGE RAPIDE - QuizApp

## Avant de Commencer (5 minutes)

### Vérifiez que vous avez :
1. Java 17+ installé : `java -version`
2. Node.js installé : `node -v`
3. PostgreSQL installé et lancé
4. npm installé : `npm -v`

---

## Étape 1 : Configuration de la Base de Données (5 minutes)

### Windows (pgAdmin ou pgAdmin4)
1. Ouvrir **pgAdmin**
2. Créer nouvelle BD : `quizapp`
3. Ouvrir Query Tool et exécuter `database.sql`

### Ou via Terminal
```bash
psql -U postgres -d quizapp -f database.sql
```

**Credentials par défaut :**
- Username: `postgres`
- Password: `postgres`
- Server: `localhost:5432`
- Database: `quizapp`

---

## Étape 2 : Démarrer l'Application

### Option A : Windows (Plus simple)
**Double-cliquer sur** : `start.bat`

Puis attendre l'ouverture automatique du navigateur sur `http://localhost:3000`

### Option B : Terminal 1 - Backend
```bash
cd backend
mvn clean install
mvn spring-boot:run
```

Attendez le message :
```
Tomcat started on port(s): 8080 with context path ''
```

### Option C : Terminal 2 - Frontend
```bash
cd frontend
npm install
npm start
```

Attendez que le navigateur s'ouvre sur `http://localhost:3000`

---

## Vérifications

### Backend actif ?
- Visitez : http://localhost:8080/api/quiz
- Vous devez voir les 20 questions en JSON

### Frontend actif ?
- Visitez : http://localhost:3000
- Vous devez voir l'écran d'accueil

### Base de données connectée ?
- Backend logs doivent afficher : `HibernateDialect initialized`

---

## Test du Quiz

1. Cliquer sur "Démarrer le Quiz"
2. Répondre aux 20 questions
3. Cliquer "Terminer et voir les résultats"
4. Voir votre score

---

## Problèmes Courants

### Port 8080 déjà utilisé
```bash
# Changer le port dans backend/src/main/resources/application.properties
server.port=8081
```

### Port 3000 déjà utilisé
```bash
# React l'indiquera automatiquement
# Ou lancez sur un autre port
PORT=3001 npm start
```

### PostgreSQL ne démarre pas
```bash
# Windows : Chercher "Services" → PostgreSQL → Démarrer
# Mac : brew services start postgresql
# Linux : sudo systemctl start postgresql
```

### Erreur Maven
```bash
# Nettoyer et réinstaller
cd backend
mvn clean
mvn install
```

---

## Fichiers Importants

```
quizapp/
├── README.md              ← Documentation complète
├── database.sql           ← Script SQL à exécuter
├── PROJECT_SUMMARY.md     ← Résumé du projet
├── start.bat              ← Script démarrage (Windows)
├── start.sh               ← Script démarrage (Linux/Mac)
├── backend/
│   ├── pom.xml           ← Dépendances Maven
│   └── src/               ← Code Java
└── frontend/
    ├── package.json      ← Dépendances npm
    └── src/              ← Code React
```

---

## URLs Importantes

- **Frontend** : http://localhost:3000
- **Backend** : http://localhost:8080
- **API Quiz** : http://localhost:8080/api/quiz
- **API Submit** : http://localhost:8080/api/quiz/submit (POST)

---

**La plupart des problèmes se résolvent en 2-3 redémarrages ! 🔄**
