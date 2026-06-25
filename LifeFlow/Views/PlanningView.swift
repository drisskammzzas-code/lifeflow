import SwiftUI
import SwiftData

public struct PlanningView: View {
    @Environment(\.modelContext) private var modelContext
    
    // User preferences in AppStorage
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("theme_name") private var themeName: String = "Minimaliste"
    @AppStorage("language") private var lang: String = "fr"
    
    // Queries
    @Query private var templates: [ActivityTemplate]
    
    // Selected Date in real-time calendar
    @State private var selectedDate: Date = Date()
    
    // Sheet presentation state
    @State private var showAddSheet = false
    @State private var selectedTemplateForEdit: ActivityTemplate? = nil
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    // Helper to get formatted day title, e.g. "Lundi 25 Juin"
    private var selectedDayName: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: lang == "fr" ? "fr_FR" : "en_US")
        formatter.dateFormat = "EEEE d MMMM"
        return formatter.string(from: selectedDate).capitalized
    }
    
    // Get weekday component of the selected date (1 = Sunday, 2 = Monday...)
    private var selectedWeekday: Int {
        Calendar.current.component(.weekday, from: selectedDate)
    }
    
    // Filter templates matching either recurring day of week or specific date
    private var filteredTemplates: [ActivityTemplate] {
        let calendar = Calendar.current
        return templates.filter { template in
            if template.isRecurring {
                return template.dayOfWeekRaw == selectedWeekday
            } else if let specificDate = template.specificDate {
                return calendar.isDate(specificDate, inSameDayAs: selectedDate)
            }
            return false
        }
        .sorted(by: { $0.totalMinutesFromMidnight < $1.totalMinutesFromMidnight })
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                themeBackground
                
                VStack(spacing: 0) {
                    
                    ScrollView {
                        VStack(spacing: 16) {
                            // Graphical Calendar Picker Card
                            DatePicker(
                                "",
                                selection: $selectedDate,
                                displayedComponents: .date
                            )
                            .datePickerStyle(.graphical)
                            .accentColor(primaryColor)
                            .padding(12)
                            .glassCard(themeName: themeName)
                            .padding(.horizontal)
                            .padding(.top, 10)
                            
                            // Day Header
                            HStack {
                                Text(Localization.t("myPlanning", lang: lang, replacements: ["day": selectedDayName]))
                                    .font(.headline)
                                    .foregroundColor(textColor)
                                Spacer()
                                Text(Localization.t("activitiesCount", lang: lang, replacements: ["count": String(filteredTemplates.count)]))
                                    .font(.subheadline)
                                    .foregroundColor(secondaryTextColor)
                            }
                            .padding(.horizontal)
                            
                            // Activity Cards List
                            if filteredTemplates.isEmpty {
                                emptyStateView
                            } else {
                                LazyVStack(spacing: 12) {
                                    ForEach(filteredTemplates) { template in
                                        activityCard(for: template)
                                            .contentShape(Rectangle())
                                            .onTapGesture {
                                                selectedTemplateForEdit = template
                                            }
                                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                                Button(role: .destructive) {
                                                    deleteTemplate(template)
                                                } label: {
                                                    Label("Delete", systemImage: "trash")
                                                }
                                            }
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            Spacer()
                                .frame(height: 80)
                        }
                    }
                }
                
                // Floating Action Button
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: { showAddSheet = true }) {
                            Image(systemName: "plus")
                                .font(.title.bold())
                                .foregroundColor(.white)
                                .frame(width: 56, height: 56)
                                .background(
                                    Circle()
                                        .fill(primaryColor)
                                        .shadow(color: primaryColor.opacity(0.4), radius: 6, x: 0, y: 3)
                                )
                        }
                        .padding(.trailing, 20)
                        .padding(.bottom, 16)
                    }
                }
            }
            .navigationTitle(Localization.t("tabPlanning", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showAddSheet) {
                AddEditActivityView(defaultDate: selectedDate)
            }
            .sheet(item: $selectedTemplateForEdit) { template in
                AddEditActivityView(activityToEdit: template)
            }
        }
    }
    
    @ViewBuilder
    private func activityCard(for template: ActivityTemplate) -> some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 3)
                .fill(Color(hex: template.colorHex))
                .frame(width: 5, height: 45)
            
            ZStack {
                Circle()
                    .fill(Color(hex: template.colorHex).opacity(0.12))
                    .frame(width: 38, height: 38)
                
                Text(template.iconEmoji)
                    .font(.system(size: 18))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(template.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
                    .lineLimit(1)
                
                HStack(spacing: 6) {
                    Image(systemName: "clock")
                        .font(.system(size: 9))
                        .foregroundColor(secondaryTextColor)
                    Text("\(template.startTimeString) - \(template.endTimeString)")
                        .font(.system(size: 9))
                        .foregroundColor(secondaryTextColor)
                }
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(template.category.displayName)
                    .font(.system(size: 9))
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(hex: template.colorHex))
                    .cornerRadius(6)
                
                if template.reminderOffsetMinutes >= 0 {
                    HStack(spacing: 3) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 8))
                            .foregroundColor(primaryColor)
                        Text(reminderLabel(for: template.reminderOffsetMinutes))
                            .font(.system(size: 8))
                            .foregroundColor(secondaryTextColor)
                    }
                }
            }
        }
        .padding(12)
        .glassCard(themeName: themeName)
    }
    
    private func reminderLabel(for offset: Int) -> String {
        switch offset {
        case 0: return Localization.t("atExactTime", lang: lang)
        default: return Localization.t("minsBefore", lang: lang, replacements: ["mins": String(offset)])
        }
    }
    
    private func deleteTemplate(_ template: ActivityTemplate) {
        NotificationManager.shared.cancelNotification(for: template)
        modelContext.delete(template)
        try? modelContext.save()
    }
    
    private var emptyStateView: some View {
        VStack(spacing: 12) {
            Text("📝")
                .font(.system(size: 36))
            Text(Localization.t("noActivitiesDay", lang: lang))
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(textColor)
            Text(Localization.t("createTimeBlocks", lang: lang))
                .font(.caption)
                .foregroundColor(secondaryTextColor)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .glassCard(themeName: themeName)
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
