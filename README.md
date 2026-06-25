# 🦋 LifeFlow - Application iOS Native

**LifeFlow** est une application iOS native moderne développée avec **SwiftUI** et **SwiftData** pour iPhone (iOS 17+). Conçue comme un organisateur de vie et de bien-être, elle intègre une planification flexible en temps réel, des rappels persistants en arrière-plan et un coach intelligent bilingue propulsé par l'IA.

---

## ✨ Fonctionnalités Clés

* **🦋 Icône Personnalisée Néo-Papillon** : Une icône moderne avec un papillon stylisé aux reflets néons.
* **📅 Calendrier Interactif en Temps Réel** : 
  * Vue calendrier graphique (`DatePicker` en mode `.graphical`).
  * Support de deux modes de planification : **Tâches Récurrentes** (chaque lundi, mardi, etc.) et **Tâches Uniques** (date spécifique).
* **🔔 Véritable Notifications en Arrière-Plan** :
  * Programmation locale avec le framework natif iOS `UserNotifications` via des déclencheurs de calendrier (`UNCalendarNotificationTrigger`).
  * Les rappels fonctionnent même si l'application est fermée et si le téléphone est verrouillé ou éteint.
* **🎨 Personnalisation Infinie** :
  * Sélection libre de **n'importe quel emoji** pour représenter vos activités.
  * Palette de couleurs infinie grâce au composant natif iOS `ColorPicker`.
* **🤖 Coach d'Organisation IA Hybride** :
  * Conversation ouverte en temps réel avec l'Organisateur AI bilingue via l'API **Gemini 1.5 Flash**.
  * Option de clé API Gemini personnalisée dans le profil.
  * Mode hors-ligne / de secours avec un système de règles locales si aucune clé API n'est fournie.
* **🌍 Bilingue Natif (Français & Anglais)** :
  * Dictionnaire de traduction intégré facilitant le basculement instantané de la langue dans l'application.

---

## 🏗️ Architecture du Projet

Le code source est organisé selon l'architecture MVVM moderne d'iOS :

* **`LifeFlowApp.swift`** : Point d'entrée de l'application et initialisation des conteneurs SwiftData.
* **`Models/`** : Modèles de données persistés de manière transparente par SwiftData :
  * `ActivityTemplate` : Modèles d'activités (récurrences ou dates uniques).
  * `ActivityLog` : Enregistrement de l'état quotidien des tâches validées.
  * `ChatMessage` : Historique des conversations locales avec le coach.
* **`Services/`** :
  * `NotificationManager` : Gestionnaire natif pour demander les autorisations et programmer les notifications locales iOS.
  * `AssistantService` : Service d'intégration de l'API Gemini 1.5 Flash avec gestion de fallback local.
* **`Theme/`** : Définition des couleurs néons, des dégradés, extensions d'initialisation de couleur Hex et effet visuel de confettis (`ConfettiView`).
* **`Views/`** : Vues SwiftUI modulaires de l'interface utilisateur.

---

## 🛠️ Compilation & Intégration Continue (CI/CD)

Le dépôt utilise **GitHub Actions** pour compiler automatiquement l'application dans le cloud sur des serveurs macOS virtuels. Cela permet de générer un fichier `.ipa` d'installation sans avoir besoin de posséder un Mac localement.

À chaque commit poussé sur la branche principale (`main`), le workflow `.github/workflows/build.yml` :
1. Récupère le code et configure la version de Xcode (Xcode 15.4+).
2. Génère le projet Xcode et compile la cible de production en mode Release sans signature de code obligatoire.
3. Package le binaire obtenu sous forme de fichier `.ipa` d'installation.
4. Télécharge le fichier `.ipa` dans les **Artifacts** du run de l'action GitHub.

---

## 📥 Guide d'Installation sur Windows (Sideloading avec Sideloadly)

Puisque le fichier `.ipa` généré par le cloud n'est pas signé avec un certificat de développeur Apple payant, vous pouvez l'installer gratuitement sur votre iPhone personnel en utilisant votre compte Apple (Apple ID) standard depuis Windows.

### Étape 1 : Prérequis sur Windows
1. Téléchargez et installez **Sideloadly** sur votre ordinateur Windows : [https://sideloadly.io](https://sideloadly.io).
2. Assurez-vous d'avoir installé **iTunes** (version non-Microsoft Store de préférence) pour les pilotes de connexion iPhone.

### Étape 2 : Activer le Mode Développeur sur iPhone (Requis sous iOS 16+)
1. Sur votre iPhone, allez dans **Réglages > Confidentialité et sécurité**.
2. Défilez vers le bas jusqu'à la section **Mode développeur**.
3. Activez le commutateur, puis redémarrez votre iPhone comme demandé.
4. Au redémarrage, déverrouillez le téléphone et appuyez sur **Activer** puis entrez votre code de verrouillage.

### Étape 3 : Installation de l'application
1. Ouvrez **Sideloadly** sur votre PC Windows.
2. Connectez votre iPhone à l'ordinateur à l'aide d'un câble USB.
3. Glissez-déposez le fichier **`LifeFlow.ipa`** (que vous aurez téléchargé depuis les résultats de compilation GitHub Actions) dans le cadre de gauche de Sideloadly.
4. Dans le champ **Apple Account**, saisissez votre adresse email Apple ID (celle que vous utilisez sur votre iPhone).
5. Cliquez sur le bouton **Start**.
6. Sideloadly vous demandera votre mot de passe Apple ID (les données transitent de façon sécurisée directement vers les serveurs Apple pour générer un certificat de développeur gratuit valide 7 jours).
7. Attendez que Sideloadly affiche la mention `Done.` dans les logs. L'icône de LifeFlow apparaîtra alors sur votre écran d'accueil !

### Étape 4 : Approuver le certificat de développeur gratuit sur l'iPhone
Lors de la première ouverture de l'application, iOS affichera un message d'avertissement indiquant que le développeur n'est pas approuvé.
1. Allez dans **Réglages > Général > Gestion des VPN et des appareils**.
2. Dans la section *App de développeur*, touchez votre adresse e-mail Apple ID.
3. Touchez **Faire confiance à [Votre e-mail]**, puis confirmez.
4. Vous pouvez maintenant lancer **LifeFlow** et l'utiliser pleinement !

> 💡 **Remarque importante** : Les certificats de développeur gratuits d'Apple expirent après 7 jours. Pour continuer à utiliser l'application après 7 jours, il vous suffit de reconnecter votre iPhone à votre PC et de cliquer à nouveau sur **Start** dans Sideloadly (vos données d'application ne seront pas perdues).
