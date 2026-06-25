import SwiftUI

public struct ProfileView: View {
    // AppStorage Profile States
    @AppStorage("user_pseudo") private var pseudo: String = "Champion"
    @AppStorage("user_avatar") private var avatarName: String = "🚀"
    @AppStorage("user_quote") private var userQuote: String = "Rien ne t'arrête ! 🚀"
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("theme_name") private var themeName: String = "Minimaliste"
    @AppStorage("language") private var lang: String = "fr"
    @AppStorage("gemini_api_key") private var apiKey: String = ""
    
    @State private var themeColor: Color = Color(hex: "#7209B7")
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                themeBackground
                
                ScrollView {
                    VStack(spacing: 20) {
                        
                        // Live Card Preview
                        previewCard
                        
                        // Language Selector
                        HStack {
                            Text(Localization.t("langLabel", lang: lang))
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(textColor)
                            Spacer()
                            Button(action: toggleLanguage) {
                                Text(lang == "fr" ? "FR 🇫🇷" : "EN 🇬🇧")
                                    .font(.caption)
                                    .fontWeight(.black)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 6)
                                    .background(primaryColor)
                                    .cornerRadius(8)
                            }
                        }
                        .padding()
                        .glassCard(themeName: themeName)
                        .padding(.horizontal)
                        
                        // Identity Inputs
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Localization.t("identitySection", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                                .padding(.horizontal)
                            
                            VStack(spacing: 12) {
                                HStack {
                                    Text(Localization.t("pseudoLabel", lang: lang))
                                        .foregroundColor(secondaryTextColor)
                                    Spacer()
                                    TextField("", text: $pseudo)
                                        .multilineTextAlignment(.trailing)
                                        .fontWeight(.bold)
                                        .foregroundColor(primaryColor)
                                }
                                .padding()
                                .glassCard(themeName: themeName)
                                
                                HStack {
                                    Text(Localization.t("quoteLabel", lang: lang))
                                        .foregroundColor(secondaryTextColor)
                                    Spacer()
                                    TextField("", text: $userQuote)
                                        .multilineTextAlignment(.trailing)
                                        .foregroundColor(textColor)
                                }
                                .padding()
                                .glassCard(themeName: themeName)
                            }
                            .padding(.horizontal)
                        }
                        
                        // Avatar Presets
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Localization.t("avatarSection", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                                .padding(.horizontal)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(AppTheme.defaultAvatars, id: \.self) { emoji in
                                        Button(action: { avatarName = emoji }) {
                                            Text(emoji)
                                                .font(.title2)
                                                .frame(width: 44, height: 44)
                                                .background(
                                                    Circle()
                                                        .fill(avatarName == emoji ? primaryColor : primaryColor.opacity(0.12))
                                                )
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                        
                        // Visual Themes Selector
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Localization.t("visualThemeSection", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                                .padding(.horizontal)
                            
                            VStack(spacing: 8) {
                                ForEach(AppTheme.visualThemes, id: \.self) { thName in
                                    Button(action: { themeName = thName }) {
                                        HStack {
                                            Text(thName)
                                                .fontWeight(themeName == thName ? .bold : .regular)
                                                .foregroundColor(textColor)
                                            Spacer()
                                            if themeName == thName {
                                                Image(systemName: "checkmark.circle.fill")
                                                    .foregroundColor(primaryColor)
                                            }
                                        }
                                        .padding()
                                        .glassCard(themeName: themeName)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        
                        // Infinite Color Picker Tint
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Localization.t("appColorSection", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                                .padding(.horizontal)
                            
                            ColorPicker(
                                lang == "fr" ? "Couleur principale" : "Accent color",
                                selection: $themeColor
                            )
                            .padding()
                            .glassCard(themeName: themeName)
                            .padding(.horizontal)
                            .onChange(of: themeColor) { newValue in
                                themeColorHex = newValue.toHex()
                            }
                        }
                        
                        // Gemini API Key Secure Section
                        VStack(alignment: .leading, spacing: 10) {
                            Text(Localization.t("geminiApiKey", lang: lang))
                                .font(.headline)
                                .foregroundColor(textColor)
                                .padding(.horizontal)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                SecureField(
                                    lang == "fr" ? "Coller votre clé API" : "Paste your API key",
                                    text: $apiKey
                                )
                                .padding(12)
                                .background(Color(.secondarySystemBackground))
                                .cornerRadius(10)
                                .foregroundColor(textColor)
                                
                                Text(Localization.t("geminiInfo", lang: lang))
                                    .font(.caption2)
                                    .foregroundColor(secondaryTextColor)
                            }
                            .padding()
                            .glassCard(themeName: themeName)
                            .padding(.horizontal)
                        }
                        
                        // Link to Settings View
                        NavigationLink(destination: SettingsView()) {
                            HStack {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(secondaryTextColor)
                                Text(Localization.t("settingsSection", lang: lang))
                                    .foregroundColor(textColor)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(secondaryTextColor)
                            }
                            .padding()
                            .glassCard(themeName: themeName)
                            .padding(.horizontal)
                            .padding(.top, 10)
                        }
                        
                        Spacer()
                            .frame(height: 30)
                    }
                    .padding(.top)
                }
            }
            .navigationTitle(Localization.t("tabProfile", lang: lang))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                themeColor = Color(hex: themeColorHex)
            }
        }
    }
    
    private var previewCard: some View {
        HStack(spacing: 15) {
            Text(avatarName)
                .font(.system(size: 32))
                .foregroundColor(primaryColor)
                .padding(10)
                .background(Circle().fill(primaryColor.opacity(0.15)))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(pseudo)
                    .font(.headline)
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
    
    private func toggleLanguage() {
        lang = lang == "fr" ? "en" : "fr"
        
        if lang == "fr" && userQuote == "Nothing stops you! 🚀" {
            userQuote = "Rien ne t'arrête ! 🚀"
        } else if lang == "en" && userQuote == "Rien ne t'arrête ! 🚀" {
            userQuote = "Nothing stops you! 🚀"
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
