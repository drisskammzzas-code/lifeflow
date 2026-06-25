import SwiftUI
import SwiftData

public struct AddEditActivityView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @AppStorage("language") private var lang: String = "fr"
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    
    // Core states
    @State private var name: String = ""
    @State private var isRecurring: Bool = true
    @State private var selectedWeekday: DayOfWeek = .monday
    @State private var specificDate: Date = Date()
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var category: Category = .ecole
    @State private var iconEmoji: String = "📚"
    @State private var selectedColor: Color = Color(hex: "#3A86F0")
    @State private var note: String = ""
    @State private var reminderOffset: Int = -1
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    // Target configuration (if edit)
    var activityToEdit: ActivityTemplate?
    
    // Check if input forms are correct
    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && startTime < endTime && !iconEmoji.isEmpty
    }
    
    // Add mode initializer
    public init(defaultDate: Date = Date()) {
        self.activityToEdit = nil
        
        let weekdayRaw = Calendar.current.component(.weekday, from: defaultDate)
        _selectedWeekday = State(initialValue: DayOfWeek(rawValue: weekdayRaw) ?? .monday)
        _specificDate = State(initialValue: defaultDate)
    }
    
    // Edit mode initializer
    public init(activityToEdit: ActivityTemplate) {
        self.activityToEdit = activityToEdit
        
        _name = State(initialValue: activityToEdit.name)
        _isRecurring = State(initialValue: activityToEdit.isRecurring)
        _selectedWeekday = State(initialValue: activityToEdit.dayOfWeek)
        _specificDate = State(initialValue: activityToEdit.specificDate ?? Date())
        _category = State(initialValue: activityToEdit.category)
        _iconEmoji = State(initialValue: activityToEdit.iconEmoji)
        _selectedColor = State(initialValue: Color(hex: activityToEdit.colorHex))
        _note = State(initialValue: activityToEdit.note)
        _reminderOffset = State(initialValue: activityToEdit.reminderOffsetMinutes)
        
        // Convert hour/minute values to Date objects
        let calendar = Calendar.current
        let today = Date()
        let start = calendar.date(bySettingHour: activityToEdit.startHour, minute: activityToEdit.startMinute, second: 0, of: today) ?? today
        let end = calendar.date(bySettingHour: activityToEdit.endHour, minute: activityToEdit.endMinute, second: 0, of: today) ?? today
        
        _startTime = State(initialValue: start)
        _endTime = State(initialValue: end)
    }
    
    public var body: some View {
        NavigationStack {
            Form {
                Section(header: Text(Localization.t("generalInfo", lang: lang))) {
                    TextField(Localization.t("formName", lang: lang), text: $name)
                    
                    Toggle(Localization.t("isRecurring", lang: lang), isOn: $isRecurring)
                        .tint(primaryColor)
                    
                    if isRecurring {
                        Picker(Localization.t("formWeekday", lang: lang), selection: $selectedWeekday) {
                            ForEach(DayOfWeek.sortedCases) { day in
                                Text(day.fullName).tag(day)
                            }
                        }
                    } else {
                        DatePicker(Localization.t("formWeekday", lang: lang), selection: $specificDate, displayedComponents: .date)
                    }
                    
                    TextField(Localization.t("formNote", lang: lang), text: $note)
                }
                
                Section(header: Text(Localization.t("formHours", lang: lang))) {
                    DatePicker(Localization.t("formStart", lang: lang), selection: $startTime, displayedComponents: .hourAndMinute)
                    DatePicker(Localization.t("formEnd", lang: lang), selection: $endTime, displayedComponents: .hourAndMinute)
                }
                
                Section(header: Text(Localization.t("formCategory", lang: lang))) {
                    Picker(Localization.t("formCategory", lang: lang), selection: $category) {
                        ForEach(Category.allCases) { cat in
                            HStack {
                                Text(cat.defaultEmoji)
                                Text(cat.displayName)
                            }
                            .tag(cat)
                        }
                    }
                    .onChange(of: category) { newValue in
                        // Pre-fill styles based on default category values
                        iconEmoji = newValue.defaultEmoji
                        selectedColor = Color(hex: newValue.defaultColorHex)
                    }
                }
                
                Section(header: Text(Localization.t("formStyle", lang: lang))) {
                    HStack {
                        Text(Localization.t("formEmoji", lang: lang))
                        Spacer()
                        TextField("", text: $iconEmoji)
                            .frame(width: 50)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: iconEmoji) { newValue in
                                if newValue.count > 0 {
                                    // Limit input to exactly one emoji
                                    iconEmoji = String(newValue.prefix(1))
                                }
                            }
                    }
                    
                    ColorPicker(Localization.t("formColor", lang: lang), selection: $selectedColor)
                }
                
                Section(header: Text(Localization.t("formReminder", lang: lang))) {
                    Picker(Localization.t("formNotifyMe", lang: lang), selection: $reminderOffset) {
                        Text(Localization.t("noReminder", lang: lang)).tag(-1)
                        Text(Localization.t("atExactTime", lang: lang)).tag(0)
                        Text(Localization.t("minsBefore", lang: lang, replacements: ["mins": "5"])).tag(5)
                        Text(Localization.t("minsBefore", lang: lang, replacements: ["mins": "10"])).tag(10)
                        Text(Localization.t("minsBefore", lang: lang, replacements: ["mins": "30"])).tag(30)
                    }
                }
                
                if activityToEdit != nil {
                    Section {
                        Button(role: .destructive, action: delete) {
                            HStack {
                                Spacer()
                                Text(Localization.t("deleteBtn", lang: lang))
                                Spacer()
                            }
                        }
                    }
                }
            }
            .navigationTitle(activityToEdit == nil ? Localization.t("addActivity", lang: lang) : Localization.t("editActivity", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(Localization.t("cancelBtn", lang: lang)) { dismiss() }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button(Localization.t("saveBtn", lang: lang)) { save() }
                        .disabled(!isValid)
                        .fontWeight(.bold)
                }
            }
        }
    }
    
    private func save() {
        let calendar = Calendar.current
        let startComponents = calendar.dateComponents([.hour, .minute], from: startTime)
        let endComponents = calendar.dateComponents([.hour, .minute], from: endTime)
        
        let startHour = startComponents.hour ?? 8
        let startMinute = startComponents.minute ?? 0
        let endHour = endComponents.hour ?? 9
        let endMinute = endComponents.minute ?? 0
        
        let colorHex = selectedColor.toHex()
        
        if let existing = activityToEdit {
            existing.name = name
            existing.isRecurring = isRecurring
            existing.dayOfWeek = selectedWeekday
            existing.specificDate = isRecurring ? nil : calendar.startOfDay(for: specificDate)
            existing.startHour = startHour
            existing.startMinute = startMinute
            existing.endHour = endHour
            existing.endMinute = endMinute
            existing.category = category
            existing.colorHex = colorHex
            existing.iconEmoji = iconEmoji
            existing.note = note
            existing.reminderOffsetMinutes = reminderOffset
            
            NotificationManager.shared.scheduleNotification(for: existing)
        } else {
            let newActivity = ActivityTemplate(
                name: name,
                isRecurring: isRecurring,
                dayOfWeek: selectedWeekday,
                specificDate: isRecurring ? nil : specificDate,
                startHour: startHour,
                startMinute: startMinute,
                endHour: endHour,
                endMinute: endMinute,
                category: category,
                colorHex: colorHex,
                iconEmoji: iconEmoji,
                note: note,
                reminderOffsetMinutes: reminderOffset
            )
            modelContext.insert(newActivity)
            
            NotificationManager.shared.scheduleNotification(for: newActivity)
        }
        
        try? modelContext.save()
        dismiss()
    }
    
    private func delete() {
        if let existing = activityToEdit {
            NotificationManager.shared.cancelNotification(for: existing)
            modelContext.delete(existing)
            try? modelContext.save()
        }
        dismiss()
    }
}
