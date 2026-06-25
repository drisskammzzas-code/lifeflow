import SwiftUI
import SwiftData

public struct SettingsView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    // User preferences in AppStorage
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("theme_name") private var themeName: String = "Minimaliste"
    @AppStorage("language") private var lang: String = "fr"
    
    // Data Queries
    @Query private var templates: [ActivityTemplate]
    @Query private var logs: [ActivityLog]
    @Query private var messages: [ChatMessage]
    
    // Notification authorization observer
    @StateObject private var notificationManager = NotificationManager.shared
    
    // Alerts trigger state
    @State private var showResetAlert = false
    @State private var showTestNotificationSuccess = false
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    // Codable structure for backup JSON serialization
    struct PlannerBackup: Codable {
        let appName: String
        let backupDate: String
        let lang: String
        let templatesCount: Int
        let logsCount: Int
    }
    
    private var exportDataString: String {
        let backupObj = PlannerBackup(
            appName: "LifeFlow iOS Native App",
            backupDate: ISO8601DateFormatter().string(from: Date()),
            lang: lang,
            templatesCount: templates.count,
            logsCount: logs.count
        )
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        if let data = try? encoder.encode(backupObj), let jsonStr = String(data: data, encoding: .utf8) {
            return jsonStr
        }
        return "{}"
    }
    
    public init() {}
    
    public var body: some View {
        ZStack {
            themeBackground
            
            Form {
                // Section 1: Notifications
                Section(header: Text(Localization.t("systemReminders", lang: lang))) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(Localization.t("authNotifications", lang: lang))
                                .font(.body)
                            Text(notificationManager.isAuthorized ? (lang == "fr" ? "Activées ✅" : "Enabled ✅") : (lang == "fr" ? "Désactivées ❌" : "Disabled ❌"))
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                        if !notificationManager.isAuthorized {
                            Button(lang == "fr" ? "Activer" : "Enable") {
                                notificationManager.requestAuthorization { granted in
                                    if !granted {
                                        if let url = URL(string: UIApplication.openSettingsURLString) {
                                            UIApplication.shared.open(url)
                                        }
                                    }
                                }
                            }
                            .foregroundColor(primaryColor)
                            .fontWeight(.semibold)
                        }
                    }
                    
                    Button(action: {
                        notificationManager.sendInstantTestNotification()
                        showTestNotificationSuccess = true
                    }) {
                        HStack {
                            Image(systemName: "bell.badge.fill")
                            Text(Localization.t("testReminderBtn", lang: lang))
                        }
                        .foregroundColor(primaryColor)
                    }
                }
                
                // Section 2: Data Storage & Backups
                Section(header: Text(Localization.t("localDataSection", lang: lang))) {
                    HStack {
                        Text(Localization.t("templatesCountLabel", lang: lang))
                        Spacer()
                        Text("\(templates.count)")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text(Localization.t("historyCountLabel", lang: lang))
                        Spacer()
                        Text("\(logs.count)")
                            .foregroundColor(.secondary)
                    }
                    
                    ShareLink(
                        item: exportDataString,
                        preview: SharePreview("LifeFlow-Backup.json")
                    ) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text(Localization.t("exportDataBtn", lang: lang))
                        }
                        .foregroundColor(primaryColor)
                    }
                }
                
                // Section 3: Reset App Data
                Section(header: Text(Localization.t("dangerZone", lang: lang))) {
                    Button(action: { showResetAlert = true }) {
                        HStack {
                            Image(systemName: "trash.fill")
                            Text(Localization.t("resetAppBtn", lang: lang))
                        }
                        .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle(Localization.t("settingsSection", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
            .alert(lang == "fr" ? "Réinitialisation" : "Reset App", isPresented: $showResetAlert) {
                Button(lang == "fr" ? "Annuler" : "Cancel", role: .cancel) {}
                Button(lang == "fr" ? "Tout supprimer" : "Delete Everything", role: .destructive) {
                    resetAllData()
                }
            } message: {
                Text(Localization.t("alertResetConfirm", lang: lang))
            }
            .alert(lang == "fr" ? "Rappel de test" : "Test Reminder", isPresented: $showTestNotificationSuccess) {
                Button("OK") {}
            } message: {
                Text(lang == "fr" ? "Verrouille ton téléphone et attends 5 secondes pour voir le rappel s'afficher !" : "Lock your phone and wait 5 seconds to see the notification banner!")
            }
        }
    }
    
    private func resetAllData() {
        NotificationManager.shared.cancelAllNotifications()
        
        for t in templates {
            modelContext.delete(t)
        }
        for l in logs {
            modelContext.delete(l)
        }
        for m in messages {
            modelContext.delete(m)
        }
        
        try? modelContext.save()
        
        // Purge AppStorage
        UserDefaults.standard.removeObject(forKey: "user_pseudo")
        UserDefaults.standard.removeObject(forKey: "user_avatar")
        UserDefaults.standard.removeObject(forKey: "user_quote")
        UserDefaults.standard.removeObject(forKey: "theme_color")
        UserDefaults.standard.removeObject(forKey: "theme_name")
        UserDefaults.standard.removeObject(forKey: "language")
        UserDefaults.standard.removeObject(forKey: "gemini_api_key")
        
        dismiss()
    }
    
    @ViewBuilder
    private var themeBackground: some View {
        if themeName == "Néon / Cyberpunk" {
            LinearGradient(colors: [Color.black, Color(hex: "#100028")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        } else if themeName == "Doux Pastel" {
            LinearGradient(colors: [Color(hex: "#FFEAF2"), Color(hex: "#EAF2FF")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        } else if themeName == "Rétro Gaming" {
            Color(hex: "#0A0A0A")
                .ignoresSafeArea()
        } else {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
        }
    }
    
    private var textColor: Color {
        if themeName == "Néon / Cyberpunk" || themeName == "Rétro Gaming" {
            return .white
        } else {
            return .primary
        }
    }
}
