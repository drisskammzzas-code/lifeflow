import SwiftUI
import SwiftData

public struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    
    // User preferences in AppStorage
    @AppStorage("user_pseudo") private var pseudo: String = "Champion"
    @AppStorage("user_avatar") private var avatarName: String = "🚀"
    @AppStorage("user_quote") private var userQuote: String = "Rien ne t'arrête ! 🚀"
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("theme_name") private var themeName: String = "Minimaliste"
    @AppStorage("language") private var lang: String = "fr"
    
    // Confetti and motivational toast state
    @State private var showConfetti = false
    @State private var motivationalToast: String? = nil
    @State private var showToast = false
    
    // Queries
    @Query private var templates: [ActivityTemplate]
    @Query private var logs: [ActivityLog]
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    // Today's date and key
    private var todayDate: Date { Date() }
    private var todayDateKey: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: todayDate)
    }
    
    // Day of the week (1 = Sunday, 2 = Monday...)
    private var todayWeekdayRaw: Int {
        Calendar.current.component(.weekday, from: todayDate)
    }
    
    // Filter activities for today (both recurring and specific date)
    private var todayTemplates: [ActivityTemplate] {
        let calendar = Calendar.current
        return templates.filter { template in
            if template.isRecurring {
                return template.dayOfWeekRaw == todayWeekdayRaw
            } else if let specificDate = template.specificDate {
                return calendar.isDate(specificDate, inSameDayAs: todayDate)
            }
            return false
        }
        .sorted(by: { $0.totalMinutesFromMidnight < $1.totalMinutesFromMidnight })
    }
    
    // Helper to get status of an activity today
    private func statusForToday(templateId: UUID) -> String {
        if let log = logs.first(where: { $0.templateId == templateId && $0.dateKey == todayDateKey }) {
            return log.status
        }
        return "pending"
    }
    
    // Daily completion statistics
    private var todayStats: (done: Int, total: Int, percentage: Int) {
        let list = todayTemplates
        if list.isEmpty { return (0, 0, 0) }
        
        var doneCount = 0
        for t in list {
            if statusForToday(templateId: t.id) == "done" {
                doneCount += 1
            }
        }
        
        let percentage = Int(Double(doneCount) / Double(list.count) * 100)
        return (doneCount, list.count, percentage)
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                themeBackground
                
                VStack(spacing: 20) {
                    // Header Card
                    headerSection
                    
                    // Daily Stats Circle Ring Card
                    statsRingSection
                    
                    // Upcoming Activities
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Localization.t("activitiesToday", lang: lang))
                            .font(.headline)
                            .foregroundColor(textColor)
                            .padding(.horizontal)
                        
                        if todayTemplates.isEmpty {
                            emptyStateView
                        } else {
                            ScrollView {
                                LazyVStack(spacing: 12) {
                                    ForEach(todayTemplates) { template in
                                        activityRow(for: template)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top)
                
                // Confetti Animation overlay
                ConfettiView(isPresented: $showConfetti)
                
                // Motivational Toast Overlay
                if showToast, let message = motivationalToast {
                    VStack {
                        Spacer()
                        HStack(spacing: 10) {
                            Text("🎉")
                                .font(.title2)
                            Text(message)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal, 24)
                        .background(
                            Capsule()
                                .fill(primaryColor)
                                .shadow(color: primaryColor.opacity(0.4), radius: 8, x: 0, y: 4)
                        )
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 30)
                    }
                    .animation(.spring(), value: showToast)
                }
            }
            .navigationTitle(Localization.t("tabHome", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // Header design with user profile summary
    private var headerSection: some View {
        HStack(spacing: 15) {
            Text(avatarName)
                .font(.system(size: 32))
                .foregroundColor(primaryColor)
                .padding(10)
                .background(Circle().fill(primaryColor.opacity(0.15)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(Localization.t("welcome", lang: lang, replacements: ["name": pseudo]))
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                
                Text(userQuote)
                    .font(.caption)
                    .foregroundColor(secondaryTextColor)
                    .italic()
            }
            
            Spacer()
        }
        .padding()
        .glassCard(themeName: themeName)
        .padding(.horizontal)
    }
    
    // Stats ring progress indicator
    private var statsRingSection: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .stroke(textColor.opacity(0.08), lineWidth: 10)
                    .frame(width: 80, height: 80)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(Double(todayStats.percentage) / 100.0, 1.0)))
                    .stroke(
                        primaryColor,
                        style: StrokeStyle(lineWidth: 10, lineCap: .round)
                    )
                    .rotationEffect(Angle(degrees: -90))
                    .frame(width: 80, height: 80)
                    .animation(.easeOut(duration: 0.8), value: todayStats.percentage)
                
                Text("\(todayStats.percentage)%")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(Localization.t("dailyProgressTitle", lang: lang))
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(textColor)
                
                Text(Localization.t("tasksDone", lang: lang, replacements: ["done": String(todayStats.done), "total": String(todayStats.total)]))
                    .font(.caption)
                    .foregroundColor(secondaryTextColor)
                
                let encouragement = getEncouragement(percentage: todayStats.percentage)
                Text(encouragement)
                    .font(.caption2)
                    .foregroundColor(primaryColor)
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        .padding()
        .glassCard(themeName: themeName)
        .padding(.horizontal)
    }
    
    // Empty state when no activities are scheduled for today
    private var emptyStateView: some View {
        VStack(spacing: 15) {
            Text("📅")
                .font(.system(size: 40))
            Text(Localization.t("noActivitiesToday", lang: lang))
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(textColor)
            Text(Localization.t("goToPlanning", lang: lang))
                .font(.caption)
                .foregroundColor(secondaryTextColor)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .glassCard(themeName: themeName)
        .padding(.horizontal)
    }
    
    // Single activity row item with buttons to log actions
    @ViewBuilder
    private func activityRow(for template: ActivityTemplate) -> some View {
        let status = statusForToday(templateId: template.id)
        
        HStack(spacing: 12) {
            // Category tag color bar
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(hex: template.colorHex))
                .frame(width: 5, height: 45)
            
            // Icon
            ZStack {
                Circle()
                    .fill(Color(hex: template.colorHex).opacity(0.12))
                    .frame(width: 38, height: 38)
                
                Text(template.iconEmoji)
                    .font(.system(size: 18))
            }
            
            // Name and Details
            VStack(alignment: .leading, spacing: 4) {
                Text(template.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(status == "done" ? secondaryTextColor : textColor)
                    .strikethrough(status == "done")
                
                HStack(spacing: 6) {
                    Text(template.startTimeString)
                        .font(.system(size: 9))
                        .fontWeight(.black)
                        .foregroundColor(Color(hex: template.colorHex))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color(hex: template.colorHex).opacity(0.1))
                        .cornerRadius(4)
                    
                    Text("•")
                        .foregroundColor(secondaryTextColor)
                        .font(.caption2)
                    
                    Text(template.category.displayName)
                        .font(.system(size: 10))
                        .foregroundColor(secondaryTextColor)
                }
                
                if !template.note.isEmpty {
                    Text(template.note)
                        .font(.caption2)
                        .foregroundColor(secondaryTextColor)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            // Action status selectors
            HStack(spacing: 6) {
                actionButton(status: "done", currentStatus: status, icon: "✓", color: .green, action: {
                    updateStatus(for: template.id, to: "done")
                })
                
                actionButton(status: "notDone", currentStatus: status, icon: "✗", color: .red, action: {
                    updateStatus(for: template.id, to: "notDone")
                })
                
                actionButton(status: "postponed", currentStatus: status, icon: "➔", color: .orange, action: {
                    updateStatus(for: template.id, to: "postponed")
                })
            }
        }
        .padding(12)
        .glassCard(themeName: themeName)
        .opacity(status == "done" ? 0.75 : 1.0)
    }
    
    // Status button representation
    @ViewBuilder
    private func actionButton(
        status: String,
        currentStatus: String,
        icon: String,
        color: Color,
        action: @escaping () -> Void
    ) -> some View {
        Button(action: action) {
            Text(icon)
                .font(.system(size: 12, weight: .black, design: .rounded))
                .foregroundColor(currentStatus == status ? .white : color)
                .frame(width: 26, height: 26)
                .background(
                    Circle()
                        .fill(currentStatus == status ? color : color.opacity(0.15))
                )
        }
        .buttonStyle(.plain)
    }
    
    // Update logging action
    private func updateStatus(for templateId: UUID, to status: String) {
        if let existingLog = logs.first(where: { $0.templateId == templateId && $0.dateKey == todayDateKey }) {
            existingLog.status = status
        } else {
            let newLog = ActivityLog(templateId: templateId, date: todayDate, status: status)
            modelContext.insert(newLog)
        }
        
        try? modelContext.save()
        
        if status == "done" {
            triggerMotivationalSplash()
        }
    }
    
    // Confetti and random toast message
    private func triggerMotivationalSplash() {
        let motivationalMessages = lang == "fr" ? [
            "Super boulot ! +1 en discipline ! 🔥",
            "Tu gères grave ! Reste focus ! 🚀",
            "Tâche terminée ! Fais-toi plaisir ! 🎉",
            "Une victoire de plus aujourd'hui ! 💪",
            "Rien ne t'arrête, continue comme ça ! 🌟",
            "Un pas de plus vers tes objectifs ! 🏆"
        ] : [
            "Great job! +1 discipline! 🔥",
            "You rock! Stay focused! 🚀",
            "Task finished! Reward yourself! 🎉",
            "One more win today! 💪",
            "Nothing stops you, keep it up! 🌟",
            "One step closer to your goals! 🏆"
        ]
        
        motivationalToast = motivationalMessages.randomElement()
        showConfetti = true
        showToast = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            showToast = false
        }
    }
    
    private func getEncouragement(percentage: Int) -> String {
        switch percentage {
        case 0: return Localization.t("encouragement0", lang: lang)
        case 1..<40: return Localization.t("encouragementLow", lang: lang)
        case 40..<75: return Localization.t("encouragementMid", lang: lang)
        case 75..<100: return Localization.t("encouragementHigh", lang: lang)
        case 100: return Localization.t("encouragementPerfect", lang: lang)
        default: return ""
        }
    }
    
    // Theme stylings
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
            // Minimaliste
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
    
    private var secondaryTextColor: Color {
        if themeName == "Néon / Cyberpunk" || themeName == "Rétro Gaming" {
            return .gray
        } else {
            return .secondary
        }
    }
}
