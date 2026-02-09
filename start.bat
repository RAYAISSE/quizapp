@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
REM QuickStart Script pour Windows - Démarrage de QuizApp (Version Améliorée)

cls
echo.
echo ==========================================
echo    QuizApp - Demarrage Rapide (Windows)
echo ==========================================
echo.

REM ==================== VERIFICATION DES PREREQUIS ====================
echo [ETAPE 1/4] Verification des prerequisites...
echo.

REM Verifier Java
echo   Verification de Java...
java -version >nul 2>&1
if errorlevel 1 (
    echo   [ERREUR] Java n'est pas installe ou non accessible
    echo   - Installez Java 17 ou plus recent
    echo   - Assurez-vous que JAVA_HOME est configure
    echo   - Lien : https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('java -version 2^>^&1 ^| findstr /R "version"') do echo   [OK] %%i
)

REM Verifier Node.js et l'installer si necessaire
echo.
echo   Verification de Node.js...
where node >nul 2>&1
if errorlevel 1 (
    echo   [!] Node.js n'a pas ete trouve. Installation en cours...
    echo.
    call choco install nodejs -y >nul 2>&1
    if !errorlevel! neq 0 (
        echo   [ERREUR] Impossible d'installer Node.js via Chocolatey
        echo   - Veuillez installer Node.js manuellement :
        echo   - Lien : https://nodejs.org/ ^(version LTS recommandee^)
        echo.
        pause
        exit /b 1
    )
    REM Rafraichir les variables d'environnement
    for /f "tokens=2*" %%a in ('reg query HKLM\SYSTEM\CurrentControlSet\Control\Session^
 Manager\Environment /v PATH') do set "NEWPATH=%%b"
    if "!NEWPATH!" neq "" set "PATH=!NEWPATH!"
    echo   [OK] Node.js installe. Relancez le script.
    pause
    exit /b 0
) else (
    for /f "tokens=*" %%i in ('node --version') do echo   [OK] Node.js %%i
)

REM Verifier npm
echo.
echo   Verification de npm...
where npm >nul 2>&1
if errorlevel 1 (
    echo   [ERREUR] npm n'est pas installe
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('npm --version') do echo   [OK] npm %%i
)

REM Verifier Maven
echo.
echo   Verification de Maven...
where mvn >nul 2>&1
if errorlevel 1 (
    echo   [ERREUR] Maven n'est pas installe ou non accessible
    echo   - Installez Maven 3.6+
    echo   - Assurez-vous que MAVEN_HOME est configure
    echo   - Lien : https://maven.apache.org/download.cgi
    pause
    exit /b 1
) else (
    for /f "tokens=*" %%i in ('mvn --version ^| findstr /R "Apache Maven"') do echo   [OK] %%i
)

REM ==================== VERIFICATION POSTGRESQL ====================
echo.
echo [ETAPE 2/4] Configuration de PostgreSQL...
echo.
echo   Avant de continuer, assurez-vous que :
echo   1. PostgreSQL est installe ET lance
echo   2. La base de donnees 'quizapp' existe
echo   3. Le fichier database.sql a ete importe
echo.
echo   Pour configurer PostgreSQL :
echo   - Ouvrez une invite de commande
echo   - Executez : psql -U postgres -d quizapp -f database.sql
echo.
echo   IMPORTANT: Si cette etape n'est pas faite, l'application ne fonctionnera pas!
echo.
pause

REM ==================== DEMARRAGE DU BACKEND ====================
echo.
echo [ETAPE 3/4] Demarrage du Backend (Spring Boot)...
echo.

if not exist "backend" (
    echo [ERREUR] Le dossier 'backend' n'existe pas
    pause
    exit /b 1
)

cd /d "%~dp0backend"
echo   Construction du projet Maven...
call mvn clean install

if !errorlevel! neq 0 (
    echo.
    echo   [ERREUR] La compilation Maven a echoue
    echo   Verifiez que :
    echo   - Maven est correctement installe
    echo   - Java 17+ est installe
    echo   - Vous avez une connexion Internet ^(pour telecharger les dependances^)
    pause
    cd /d "%~dp0"
    exit /b 1
)

echo.
echo   [OK] Backend compile avec succes
echo   Demarrage du serveur Spring Boot dans une nouvelle fenetre...
start "QuizApp Backend" cmd /k "cd /d "%~dp0backend" && mvn spring-boot:run"
timeout /t 3 /nobreak
echo   [OK] Serveur Backend lance sur http://localhost:8080

REM ==================== DEMARRAGE DU FRONTEND ====================
echo.
echo [ETAPE 4/4] Demarrage du Frontend (React)...
echo.

if not exist "..\frontend" (
    echo [ERREUR] Le dossier 'frontend' n'existe pas
    pause
    exit /b 1
)

cd /d "%~dp0frontend"
echo   Installation des dependances npm...
call npm install -q

if !errorlevel! neq 0 (
    echo   [ERREUR] L'installation npm a echoue
    echo   Verifiez que npm fonctionne correctement
    pause
    cd /d "%~dp0"
    exit /b 1
)

echo   [OK] Dependances installes
echo   Demarrage de React...
start "QuizApp Frontend" cmd /k "npm start"
timeout /t 3 /nobreak

REM ==================== FINALE ====================
echo.
echo ==========================================
echo    Application Lancee Avec Succes!
echo ==========================================
echo.
echo   Frontend  : http://localhost:3000
echo   Backend   : http://localhost:8080
echo   Database  : localhost:5432/quizapp
echo.
echo   Attendre 10-15 secondes pour que tout soit pret...
echo.
pause
cd /d "%~dp0"
