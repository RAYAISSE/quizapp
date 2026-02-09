#!/bin/bash
# QuickStart Script - Démarrage automatisé de QuizApp

echo "=========================================="
echo "QuizApp - Démarrage Rapide"
echo "=========================================="
echo ""

# Vérifier si PostgreSQL est lancé
echo "✓ Vérifiez que PostgreSQL est en cours d'exécution sur localhost:5432"
echo ""

# Vérifier si Java est installé
if ! command -v java &> /dev/null; then
    echo "✗ Java n'est pas installé. Veuillez installer Java 17+"
    exit 1
fi
echo "✓ Java détecté"

# Vérifier si Node.js est installé
if ! command -v node &> /dev/null; then
    echo "✗ Node.js n'est pas installé. Veuillez installer Node.js"
    exit 1
fi
echo "✓ Node.js détecté : $(node -v)"

# Vérifier si npm est installé
if ! command -v npm &> /dev/null; then
    echo "✗ npm n'est pas installé. Veuillez installer npm"
    exit 1
fi
echo "✓ npm détecté : $(npm -v)"

echo ""
echo "=========================================="
echo "Initialisation de la Base de Données"
echo "=========================================="

# Importer la base de données (vous devez avoir postgre disponible)
echo "⚠ Veuillez importer database.sql manuellement dans PostgreSQL"
echo "  Commande : psql -U postgres -d quizapp -f database.sql"

echo ""
echo "=========================================="
echo "Lancement du Backend (Spring Boot)"
echo "=========================================="

cd backend
mvn clean install
mvn spring-boot:run &
BACKEND_PID=$!

echo "Backend lancé (PID: $BACKEND_PID)"
sleep 5

echo ""
echo "=========================================="
echo "Lancement du Frontend (React)"
echo "=========================================="

cd ../frontend
npm install
npm start &
FRONTEND_PID=$!

echo "Frontend lancé (PID: $FRONTEND_PID)"

echo ""
echo "=========================================="
echo "✓ Application Lancée!"
echo "=========================================="
echo "Frontend  : http://localhost:3000"
echo "Backend   : http://localhost:8080"
echo "Database  : localhost:5432/quizapp"
echo ""
echo "Appuyez sur Ctrl+C pour arrêter l'application"

# Attendre l'arrêt
wait
