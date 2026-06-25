import SwiftUI
import SwiftData

public struct AssistantView: View {
    @Environment(\.modelContext) private var modelContext
    
    // Configurations
    @AppStorage("user_pseudo") private var pseudo: String = "Champion"
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("theme_name") private var themeName: String = "Minimaliste"
    @AppStorage("language") private var lang: String = "fr"
    @AppStorage("gemini_api_key") private var apiKey: String = ""
    
    // Core data references for AI analysis context
    @Query private var templates: [ActivityTemplate]
    @Query private var logs: [ActivityLog]
    
    // Fetch Chat messages
    @Query(sort: \ChatMessage.timestamp, order: .forward) private var messages: [ChatMessage]
    
    @State private var inputText: String = ""
    @State private var isTyping: Bool = false
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    private var suggestions: [String] {
        lang == "fr" ? [
            "📊 Bilan de ma semaine",
            "💡 Conseils de discipline",
            "📚 Organiser mes devoirs",
            "😴 Sommeil & Fatigue"
        ] : [
            "📊 Week analysis",
            "💡 Discipline tips",
            "📚 Homework strategy",
            "😴 Recovery & Sleep"
        ]
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                themeBackground
                
                VStack(spacing: 0) {
                    // Chat Scroll
                    ScrollViewReader { proxy in
                        ScrollView {
                            LazyVStack(spacing: 12) {
                                if messages.isEmpty {
                                    welcomePlaceholderCard
                                } else {
                                    ForEach(messages) { msg in
                                        chatBubble(for: msg)
                                            .id(msg.id)
                                    }
                                }
                                
                                if isTyping {
                                    typingIndicatorBubble
                                        .id("typing_indicator")
                                }
                            }
                            .padding()
                        }
                        .onChange(of: messages.count) { _ in
                            if let lastMsg = messages.last {
                                withAnimation {
                                    proxy.scrollTo(lastMsg.id, anchor: .bottom)
                                }
                            }
                        }
                        .onChange(of: isTyping) { newValue in
                            if newValue {
                                withAnimation {
                                    proxy.scrollTo("typing_indicator", anchor: .bottom)
                                }
                            }
                        }
                        .onAppear {
                            if let lastMsg = messages.last {
                                proxy.scrollTo(lastMsg.id, anchor: .bottom)
                            }
                        }
                    }
                    
                    // Suggestions Chips
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(suggestions, id: \.self) { sug in
                                Button(action: { submitMessage(text: sug) }) {
                                    Text(sug)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 8)
                                        .background(Capsule().fill(primaryColor.opacity(0.12)))
                                        .foregroundColor(primaryColor)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                    
                    // Composition Input Row
                    HStack(spacing: 10) {
                        TextField(lang == "fr" ? "Pose-moi une question..." : "Ask me anything...", text: $inputText, axis: .vertical)
                            .padding(12)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(20)
                            .lineLimit(1...4)
                            .foregroundColor(textColor)
                        
                        Button(action: {
                            let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                            if !text.isEmpty {
                                submitMessage(text: text)
                                inputText = ""
                            }
                        }) {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                                .foregroundColor(inputText.isEmpty ? .secondary : primaryColor)
                        }
                        .disabled(inputText.isEmpty)
                    }
                    .padding()
                    .background(Color(colorSchemeBackground).opacity(0.8))
                }
            }
            .navigationTitle(Localization.t("tabOrganizer", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: clearChatHistory) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
    
    private var welcomePlaceholderCard: some View {
        VStack(spacing: 15) {
            Text("✨")
                .font(.system(size: 40))
                .padding(.top, 30)
            
            Text(lang == "fr" ? "Discute avec l'Organisateur !" : "Chat with the Organizer!")
                .font(.headline)
                .foregroundColor(textColor)
            
            Text(lang == "fr" 
                ? "Je suis ton assistant personnel. Je peux analyser ton planning récurrent, évaluer tes réussites ou te donner des conseils d'organisation scolaire."
                : "I am your personal assistant. I can analyze your schedule, evaluate your success rate, or give study advice.")
                .font(.subheadline)
                .foregroundColor(secondaryTextColor)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            if apiKey.isEmpty {
                Text(lang == "fr"
                    ? "💡 Note: Ajoute une clé API Gemini dans ton Profil pour débloquer de vraies réponses ouvertes à n'importe quelle question !"
                    : "💡 Note: Add a Gemini API key in your Profile to unlock real answers to any open question!")
                    .font(.caption2)
                    .foregroundColor(primaryColor)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
        .padding()
        .glassCard(themeName: themeName)
        .padding()
    }
    
    @ViewBuilder
    private func chatBubble(for msg: ChatMessage) -> some View {
        HStack {
            if msg.isUser {
                Spacer()
                Text(msg.text)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 16,
                            bottomLeadingRadius: 16,
                            bottomTrailingRadius: 4,
                            topTrailingRadius: 16
                        )
                        .fill(primaryColor)
                    )
            } else {
                Text(msg.text)
                    .font(.subheadline)
                    .foregroundColor(textColor)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 16,
                            bottomLeadingRadius: 4,
                            bottomTrailingRadius: 16,
                            topTrailingRadius: 16
                        )
                        .fill(themeName == "Néon / Cyberpunk" || themeName == "Rétro Gaming" ? Color.white.opacity(0.1) : Color(.systemGray6))
                    )
                Spacer()
            }
        }
    }
    
    private var typingIndicatorBubble: some View {
        HStack {
            HStack(spacing: 4) {
                Circle().fill(secondaryTextColor).frame(width: 6, height: 6).opacity(0.4)
                Circle().fill(secondaryTextColor).frame(width: 6, height: 6).opacity(0.7)
                Circle().fill(secondaryTextColor).frame(width: 6, height: 6).opacity(1.0)
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 12)
            .background(
                UnevenRoundedRectangle(
                    topLeadingRadius: 16,
                    bottomLeadingRadius: 4,
                    bottomTrailingRadius: 16,
                    topTrailingRadius: 16
                )
                .fill(themeName == "Néon / Cyberpunk" || themeName == "Rétro Gaming" ? Color.white.opacity(0.1) : Color(.systemGray6))
            )
            Spacer()
        }
    }
    
    private func clearChatHistory() {
        for msg in messages {
            modelContext.delete(msg)
        }
        try? modelContext.save()
    }
    
    private func submitMessage(text: String) {
        let userMsg = ChatMessage(text: text, isUser: true)
        modelContext.insert(userMsg)
        try? modelContext.save()
        
        isTyping = true
        
        // Execute hybrid API callback
        AssistantService.generateResponse(
            query: text,
            pseudo: pseudo,
            lang: lang,
            templates: templates,
            logs: logs,
            apiKey: apiKey
        ) { reply in
            let assistantMsg = ChatMessage(text: reply, isUser: false)
            modelContext.insert(assistantMsg)
            try? modelContext.save()
            isTyping = false
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
    
    private var colorSchemeBackground: UIColor {
        if themeName == "Néon / Cyberpunk" || themeName == "Rétro Gaming" {
            return .black
        } else {
            return .systemBackground
        }
    }
}
