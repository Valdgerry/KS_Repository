# KidneySaversApi

API pour l'application Kidney Savers, déployée sur Render avec PostgreSQL.

## Prérequis
- .NET 8.0 SDK
- PostgreSQL
- Compte Render

## Installation locale
1. Clonez le dépôt : git clone https://github.com/Brandondgb/KidneySaversApi.git
2. Configurez la connexion PostgreSQL dans appsettings.json.
3. Exécutez les migrations : dotnet ef database update
4. Lancez l’API : dotnet run

## Déploiement sur Render
1. Créez un service Web sur Render.
2. Connectez ce dépôt GitHub.
3. Ajoutez les variables d’environnement :
   - ConnectionStrings__DefaultConnection: "Host=;Database=;Username=;Password="
   - Jwt__Key: Une clé secrète longue
   - Jwt__Issuer: "KidneySavers"
   - Jwt__Audience: "KidneySavers"
4. Déployez !

## Endpoints
- POST /api/auth/register
- POST /api/auth/login
- GET /api/quiz
- GET /api/quiz/{id}
- POST /api/quiz/submit
- POST /api/tracking
- GET /api/tracking/{userId}
- POST /api/chatbot