import SwiftUI
import SwiftData
import Charts

public struct ProgressView: View {
    @Query private var templates: [ActivityTemplate]
    @Query private var logs: [ActivityLog]
    
    @AppStorage("user_pseudo") private var pseudo: String = "Champion"
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("theme_name") private var themeName: String = "Minimaliste"
    @AppStorage("language") private var lang: String = "fr"
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    private var todayDateKey: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: Date())
    }
    
    // Stats for Today
    private var todayStats: (done: Int, notDone: Int, postponed: Int) {
        let todayLogs = logs.filter { $0.dateKey == todayDateKey }
        let done = todayLogs.filter { $0.status == "done" }.count
        let notDone = todayLogs.filter { $0.status == "notDone" }.count
        let postponed = todayLogs.filter { $0.status == "postponed" }.count
        return (done, notDone, postponed)
    }
    
    // Weekly Success Rate (Past 7 Days)
    private var weeklySuccessRate: Int {
        let calendar = Calendar.current
        let today = Date()
        
        var totalActivitiesInWeek = 0
        var completedActivitiesInWeek = 0
        
        for offset in 0..<7 {
            guard let date = calendar.date(byAdding: .day, value: -offset, to: today) else { continue }
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dayKey = formatter.string(from: date)
            
            let weekdayRaw = calendar.component(.weekday, from: date)
            
            // Filter templates occurring on this day
            let scheduledTemplates = templates.filter { template in
                if template.isRecurring {
                    return template.dayOfWeekRaw == weekdayRaw
                } else if let specificDate = template.specificDate {
                    return calendar.isDate(specificDate, inSameDayAs: date)
                }
                return false
            }
            if scheduledTemplates.isEmpty { continue }
            
            let dayLogs = logs.filter { $0.dateKey == dayKey }
            
            for t in scheduledTemplates {
                totalActivitiesInWeek += 1
                if let log = dayLogs.first(where: { $0.templateId == t.id }), log.status == "done" {
                    completedActivitiesInWeek += 1
                }
            }
        }
        
        guard totalActivitiesInWeek > 0 else { return 0 }
        return Int(Double(completedActivitiesInWeek) / Double(totalActivitiesInWeek) * 100)
    }
    
    // Streak calculation (Consecutive successful days)
    private var currentStreak: Int {
        let calendar = Calendar.current
        let today = Date()
        var streak = 0
        var checkOffset = 0
        
        while true {
            guard let checkDate = calendar.date(byAdding: .day, value: -checkOffset, to: today) else { break }
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let dayKey = formatter.string(from: checkDate)
            let weekdayRaw = calendar.component(.weekday, from: checkDate)
            
            let scheduledForDay = templates.filter { template in
                if template.isRecurring {
                    return template.dayOfWeekRaw == weekdayRaw
                } else if let specificDate = template.specificDate {
                    return calendar.isDate(specificDate, inSameDayAs: checkDate)
                }
                return false
            }
            
            if scheduledForDay.isEmpty {
                checkOffset += 1
                if checkOffset > 100 { break } // safety check
                continue
            }
            
            let dayLogs = logs.filter { $0.dateKey == dayKey }
            let doneCount = dayLogs.filter { $0.status == "done" }.count
            let totalLogged = dayLogs.count
            
            if checkOffset == 0 && totalLogged == 0 {
                // Ignore today if nothing is marked yet to keep streak alive
                checkOffset += 1
                continue
            }
            
            if doneCount > 0 && doneCount >= (scheduledForDay.count / 2) {
                streak += 1
                checkOffset += 1
            } else {
                break
            }
        }
        return streak
    }
    
    // Category statistics chart data
    struct CategoryStat: Identifiable {
        let id = UUID()
        let categoryName: String
        let count: Int
        let color: Color
    }
    
    private var categoryStatistics: [CategoryStat] {
        var counts: [Category: Int] = [:]
        
        for log in logs where log.status == "done" {
            if let template = templates.first(where: { $0.id == log.templateId }) {
                counts[template.category, default: 0] += 1
            }
        }
        
        return Category.allCases.map { cat in
            CategoryStat(
                categoryName: cat.displayName,
                count: counts[cat] ?? 0,
                color: Color(hex: cat.defaultColorHex)
            )
        }
        .filter { $0.count > 0 }
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                themeBackground
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // Streak & Success Rate Grid
                        HStack(spacing: 15) {
                            VStack(spacing: 8) {
                                Text("🔥")
                                    .font(.title)
                                
                                Text("\(currentStreak)")
                                    .font(.system(size: 32, weight: .bold, design: .rounded))
                                    .foregroundColor(textColor)
                                
                                Text(Localization.t("streakLabel", lang: lang))
                                    .font(.caption)
                                    .foregroundColor(secondaryTextColor)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .glassCard(themeName: themeName)
                            
                            VStack(spacing: 8) {
                                Text("📊")
                                    .font(.title)
                                
                                Text("\(weeklySuccessRate)%")
                                    .font(.system(size: 32, weight: .bold, design: .rounded))
                                    .foregroundColor(textColor)
                                
                                Text(Localization.t("weeklySuccessLabel", lang: lang))
                                    .font(.caption)
                                    .foregroundColor(secondaryTextColor)
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .glassCard(themeName: themeName)
                        }
                        .padding(.horizontal)
                        
                        // Today breakdown card
                        VStack(alignment: .leading, spacing: 12) {
                            Text(Localization.t("todayBreakdownTitle", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                            
                            HStack(spacing: 20) {
                                statIndicator(title: Localization.t("statusDone", lang: lang), count: todayStats.done, color: .green)
                                statIndicator(title: Localization.t("statusNotDone", lang: lang), count: todayStats.notDone, color: .red)
                                statIndicator(title: Localization.t("statusPostponed", lang: lang), count: todayStats.postponed, color: .orange)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .glassCard(themeName: themeName)
                        .padding(.horizontal)
                        
                        // Category Chart
                        VStack(alignment: .leading, spacing: 15) {
                            Text(Localization.t("chartTitle", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                            
                            if categoryStatistics.isEmpty {
                                HStack {
                                    Spacer()
                                    VStack(spacing: 8) {
                                        Text("📉")
                                            .font(.title)
                                        Text(Localization.t("noChartData", lang: lang))
                                            .font(.caption)
                                            .foregroundColor(secondaryTextColor)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 30)
                            } else {
                                Chart(categoryStatistics) { stat in
                                    BarMark(
                                        x: .value("Category", stat.categoryName),
                                        y: .value("Count", stat.count)
                                    )
                                    .foregroundStyle(stat.color)
                                    .cornerRadius(6)
                                }
                                .frame(height: 180)
                                .chartYAxis {
                                    AxisMarks(position: .leading)
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .glassCard(themeName: themeName)
                        .padding(.horizontal)
                        
                        // Personal Coach advice
                        VStack(spacing: 12) {
                            Text("✨")
                                .font(.title2)
                            
                            Text(Localization.t("coachAdviceTitle", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                            
                            Text(getCoachingAdvice())
                                .font(.subheadline)
                                .foregroundColor(secondaryTextColor)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 10)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .glassCard(themeName: themeName)
                        .padding(.horizontal)
                        
                        Spacer()
                            .frame(height: 20)
                    }
                    .padding(.top)
                }
            }
            .navigationTitle(Localization.t("tabProgress", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    private func statIndicator(title: String, count: Int, color: Color) -> some View {
        VStack(spacing: 4) {
            Text("\(count)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
            Text(title)
                .font(.caption)
                .foregroundColor(secondaryTextColor)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func getCoachingAdvice() -> String {
        let rate = weeklySuccessRate
        if templates.isEmpty {
            return lang == "fr" ? "Planifie tes premières activités pour commencer !" : "Schedule your first activities to start!"
        }
        if rate == 0 {
            return lang == "fr" ? "Commence par marquer tes activités terminées aujourd'hui." : "Start by checking off today's activities."
        } else if rate >= 80 {
            return lang == "fr" ? "Tu es sur une excellente lancée, \(pseudo) ! Reste régulier." : "You are on an excellent run, \(pseudo)! Stay consistent."
        } else if rate >= 50 {
            return lang == "fr" ? "C'est pas mal ! Essaie de bloquer des pauses régulières." : "Not bad! Try blocking regular breaks."
        } else {
            return lang == "fr" ? "Ne te décourage pas ! Planifie plus de repos." : "Don't discourage yourself! Schedule more rest."
        }
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
    
    private var secondaryTextColor: Color {
        if themeName == "Néon / Cyberpunk" || themeName == "Rétro Gaming" {
            return .gray
        } else {
            return .secondary
        }
    }
}
