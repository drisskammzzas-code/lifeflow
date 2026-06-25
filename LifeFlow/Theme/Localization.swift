import Foundation

public struct Localization {
    private static let fr: [String: String] = [
        // Navigation Tabs
        "tabHome": "Accueil",
        "tabPlanning": "Planning",
        "tabProgress": "Progression",
        "tabOrganizer": "Organisateur",
        "tabProfile": "Profil",
        
        // Home
        "welcome": "Salut, {name} ! 👋",
        "dailyProgressTitle": "Progression du jour",
        "activitiesToday": "Activités d'aujourd'hui",
        "noActivitiesToday": "Aucune activité planifiée aujourd'hui.",
        "goToPlanning": "Rends-toi sur l'onglet 'Planning' pour organiser ta journée !",
        "tasksDone": "{done} sur {total} activités terminées",
        "encouragement0": "Prêt à commencer la journée ? 💪",
        "encouragementLow": "C'est un bon début, continue ! ⚡️",
        "encouragementMid": "Déjà plus de la moitié faite ! 🌟",
        "encouragementHigh": "Presque fini ! Ne lâche rien ! 🔥",
        "encouragementPerfect": "Journée parfaite ! Tu es au top ! 🏆",
        "victoryToast": "Super boulot ! +1 en discipline ! 🔥",
        
        // Planning Calendar
        "myPlanning": "Planning du {day}",
        "activitiesCount": "{count} activités",
        "noActivitiesDay": "Aucune activité programmée ce jour.",
        "createTimeBlocks": "Planifie des blocs de temps pour atteindre tes objectifs.",
        "addActivity": "Créer une activité",
        "editActivity": "Modifier l'activité",
        "isRecurring": "Activité récurrente hebdomadaire",
        
        // Form Fields
        "generalInfo": "Informations générales",
        "formName": "Nom de l'activité (ex: Cours de maths)",
        "formWeekday": "Jour de la semaine",
        "formNote": "Note optionnelle",
        "formHours": "Horaires",
        "formStart": "Heure de début",
        "formEnd": "Heure de fin",
        "formCategory": "Catégorie",
        "formStyle": "Style & Personnalisation",
        "formEmoji": "Saisir un Emoji",
        "formColor": "Couleur associée",
        "formReminder": "Rappel de notification",
        "formNotifyMe": "M'avertir",
        "noReminder": "Aucun rappel",
        "atExactTime": "À l'heure exacte",
        "minsBefore": "{mins} minutes avant",
        "cancelBtn": "Annuler",
        "saveBtn": "Enregistrer",
        "deleteBtn": "Supprimer cette activité",
        
        // Progress Screen
        "streakLabel": "Série de jours",
        "weeklySuccessLabel": "Semaine passée",
        "todayBreakdownTitle": "Aujourd'hui",
        "statusDone": "Fait",
        "statusNotDone": "Pas fait",
        "statusPostponed": "Reporté",
        "chartTitle": "Répartition par Catégorie (Faites)",
        "noChartData": "Aucune donnée enregistrée pour le moment.",
        "coachAdviceTitle": "Le conseil de l'Organisateur",
        
        // Profile & Settings
        "identitySection": "Identité",
        "pseudoLabel": "Pseudo",
        "quoteLabel": "Phrase perso",
        "avatarSection": "Choisis ton Avatar",
        "visualThemeSection": "Thème Visuel",
        "appColorSection": "Couleur de l'application",
        "settingsSection": "Paramètres de l'application",
        "systemReminders": "Rappels",
        "authNotifications": "Autorisation Notifications",
        "testReminderBtn": "Tester un rappel instantané (5s)",
        "localDataSection": "Données locales",
        "templatesCountLabel": "Activités programmées",
        "historyCountLabel": "Historique complété",
        "exportDataBtn": "Exporter ma configuration (JSON)",
        "dangerZone": "Zone de Danger",
        "resetAppBtn": "Réinitialiser l'application",
        "langLabel": "Langue / Language",
        "geminiApiKey": "Clé API Gemini (Optionnel)",
        "geminiInfo": "Permet d'activer l'IA en ligne Gemini 1.5 Flash pour répondre à toutes vos questions.",
        "alertResetConfirm": "Supprimer tout ton planning, tes statistiques et tes chats locaux définitivement ?",
        "alertInstantTest": "Rappel de test programmé !",
        
        // Weekdays
        "monday": "Lundi", "tuesday": "Mardi", "wednesday": "Mercredi", "thursday": "Jeudi", "friday": "Vendredi", "saturday": "Samedi", "sunday": "Dimanche"
    ]

    private static let en: [String: String] = [
        // Navigation Tabs
        "tabHome": "Home",
        "tabPlanning": "Schedule",
        "tabProgress": "Progress",
        "tabOrganizer": "Organizer",
        "tabProfile": "Profile",
        
        // Home
        "welcome": "Hey, {name}! 👋",
        "dailyProgressTitle": "Daily Progress",
        "activitiesToday": "Today's Activities",
        "noActivitiesToday": "No activities scheduled for today.",
        "goToPlanning": "Go to the 'Schedule' tab to organize your day!",
        "tasksDone": "{done} out of {total} activities completed",
        "encouragement0": "Ready to start the day? 💪",
        "encouragementLow": "Good start, keep going! ⚡️",
        "encouragementMid": "Already more than half done! 🌟",
        "encouragementHigh": "Almost finished! Don't give up! 🔥",
        "encouragementPerfect": "Perfect day! You are at the top! 🏆",
        "victoryToast": "Great job! +1 discipline! 🔥",
        
        // Planning Calendar
        "myPlanning": "Schedule for {day}",
        "activitiesCount": "{count} activities",
        "noActivitiesDay": "No activities scheduled for this day.",
        "createTimeBlocks": "Plan time blocks to reach your goals.",
        "addActivity": "Create an Activity",
        "editActivity": "Modify Activity",
        "isRecurring": "Weekly recurring activity",
        
        // Form Fields
        "generalInfo": "General Information",
        "formName": "Activity name (e.g. Math Class)",
        "formWeekday": "Day of the week",
        "formNote": "Optional Note",
        "formHours": "Hours",
        "formStart": "Start Time",
        "formEnd": "End Time",
        "formCategory": "Category",
        "formStyle": "Style & Customization",
        "formEmoji": "Enter an Emoji",
        "formColor": "Associated Color",
        "formReminder": "Reminder Notification",
        "formNotifyMe": "Notify Me",
        "noReminder": "No reminder",
        "atExactTime": "At exact start time",
        "minsBefore": "{mins} minutes before",
        "cancelBtn": "Cancel",
        "saveBtn": "Save",
        "deleteBtn": "Delete this activity",
        
        // Progress Screen
        "streakLabel": "Day Streak",
        "weeklySuccessLabel": "Last Week",
        "todayBreakdownTitle": "Today",
        "statusDone": "Done",
        "statusNotDone": "Missed",
        "statusPostponed": "Postponed",
        "chartTitle": "Distribution by Category (Done)",
        "noChartData": "No data recorded yet.",
        "coachAdviceTitle": "Organizer's Advice",
        
        // Profile & Settings
        "identitySection": "Identity",
        "pseudoLabel": "Nickname",
        "quoteLabel": "Personal Quote",
        "avatarSection": "Choose your Avatar",
        "visualThemeSection": "Visual Theme",
        "appColorSection": "App Theme Color",
        "settingsSection": "App Settings",
        "systemReminders": "Reminders",
        "authNotifications": "Notification Permission",
        "testReminderBtn": "Test instant reminder (5s)",
        "localDataSection": "Local Data",
        "templatesCountLabel": "Scheduled Activities",
        "historyCountLabel": "History Completed",
        "exportDataBtn": "Export config (JSON)",
        "dangerZone": "Danger Zone",
        "resetAppBtn": "Reset application",
        "langLabel": "Language / Langue",
        "geminiApiKey": "Gemini API Key (Optional)",
        "geminiInfo": "Activates the online Gemini 1.5 Flash AI to answer any of your questions.",
        "alertResetConfirm": "Permanently delete all your schedule, statistics, and local chats?",
        "alertInstantTest": "Test reminder scheduled!",
        
        // Weekdays
        "monday": "Monday", "tuesday": "Tuesday", "wednesday": "Wednesday", "thursday": "Thursday", "friday": "Friday", "saturday": "Saturday", "sunday": "Sunday"
    ]

    public static func t(_ key: String, lang: String, replacements: [String: String] = [:]) -> String {
        var text = ""
        if lang == "en" {
            text = en[key] ?? fr[key] ?? key
        } else {
            text = fr[key] ?? key
        }
        for (k, v) in replacements {
            text = text.replacingOccurrences(of: "{\(k)}", with: v)
        }
        return text
    }
}
