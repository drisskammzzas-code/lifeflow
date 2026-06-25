import SwiftUI

public struct MainTabView: View {
    @AppStorage("theme_color") private var themeColorHex: String = "#7209B7"
    @AppStorage("language") private var lang: String = "fr"
    @State private var selectedTab = 0
    
    private var primaryColor: Color {
        Color(hex: themeColorHex)
    }
    
    public init() {}
    
    public var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label(Localization.t("tabHome", lang: lang), systemImage: "house.fill")
                }
                .tag(0)
            
            PlanningView()
                .tabItem {
                    Label(Localization.t("tabPlanning", lang: lang), systemImage: "calendar")
                }
                .tag(1)
            
            ProgressView()
                .tabItem {
                    Label(Localization.t("tabProgress", lang: lang), systemImage: "chart.bar.fill")
                }
                .tag(2)
            
            AssistantView()
                .tabItem {
                    Label(Localization.t("tabOrganizer", lang: lang), systemImage: "sparkles")
                }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Label(Localization.t("tabProfile", lang: lang), systemImage: "person.crop.circle.fill")
                }
                .tag(4)
        }
        .tint(primaryColor)
    }
}
