import Foundation

public final class AssistantService {
    
    public static func generateResponse(
        query: String,
        pseudo: String,
        lang: String,
        templates: [ActivityTemplate],
        logs: [ActivityLog],
        apiKey: String,
        completion: @escaping (String) -> Void
    ) {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        if trimmedQuery.isEmpty {
            completion("")
            return
        }
        
        // If API key is not present, use offline backup rule engine
        guard !apiKey.isEmpty else {
            let offlineReply = generateOfflineReply(query: trimmedQuery, pseudo: pseudo, lang: lang, templates: templates, logs: logs)
            completion(offlineReply)
            return
        }
        
        // Build Gemini 1.5 REST URL
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=\(apiKey)") else {
            completion(lang == "fr" ? "Erreur : URL de service incorrecte." : "Error: Invalid service URL.")
            return
        }
        
        let totalAct = templates.count
        let doneCount = logs.filter { $0.status == "done" }.count
        let rate = logs.isEmpty ? 0 : Int(Double(doneCount) / Double(logs.count) * 100)
        
        let systemPrompt = """
        Tu es "Organisateur", le coach AI de LifeFlow. Tu es un guide d'organisation pour les jeunes.
        Réponds en \(lang == "fr" ? "Français" : "Anglais").
        L'utilisateur s'appelle \(pseudo).
        Voici ses métriques actuelles :
        - Nombre total de blocs d'activités hebdomadaires planifiés : \(totalAct)
        - Son taux de réussite global : \(rate)%
        Donne des réponses encourageantes, concrètes, amicales et synthétiques (3-4 phrases max) avec des émojis.
        """
        
        let requestBody: [String: Any] = [
            "contents": [
                [
                    "role": "user",
                    "parts": [
                        ["text": systemPrompt],
                        ["text": "Message : \(trimmedQuery)"]
                    ]
                ]
            ],
            "generationConfig": [
                "maxOutputTokens": 250,
                "temperature": 0.7
            ]
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            completion(lang == "fr" ? "Erreur lors de la préparation de la requête." : "Error preparing request payload.")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(lang == "fr" ? "Désolé, problème de connexion : \(error.localizedDescription)" : "Sorry, connection issue: \(error.localizedDescription)")
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(lang == "fr" ? "Aucune réponse reçue du serveur." : "Empty server response received.")
                }
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]],
                   let firstCandidate = candidates.first,
                   let content = firstCandidate["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let firstPart = parts.first,
                   let text = firstPart["text"] as? String {
                    
                    let replyText = text.trimmingCharacters(in: .whitespacesAndNewlines)
                    DispatchQueue.main.async {
                        completion(replyText)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(lang == "fr" 
                            ? "Clef API invalide ou limite atteinte. Configurable dans Profil > Paramètres." 
                            : "Invalid API key or quota exceeded. Configurable in Profile > Settings.")
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    completion(lang == "fr" ? "Erreur de traitement de la réponse AI." : "AI response parsing error.")
                }
            }
        }.resume()
    }
    
    private static func generateOfflineReply(
        query: String,
        pseudo: String,
        lang: String,
        templates: [ActivityTemplate],
        logs: [ActivityLog]
    ) -> String {
        let input = query.lowercased()
        let isFr = lang == "fr"
        
        let totalAct = templates.count
        let doneLogs = logs.filter { $0.status == "done" }
        let rate = logs.isEmpty ? 0 : Int(Double(doneLogs.count) / Double(logs.count) * 100)
        
        if isFr {
            if input.contains("bonjour") || input.contains("salut") || input.contains("hello") || input.contains("cc") {
                return "Salut \(pseudo) ! 👋 Je suis l'Organisateur local. Je peux analyser ton planning, te motiver ou t'aider à organiser ton temps scolaire ou ton sport. Écris 'analyse' ou 'discipline' !"
            }
            
            if input.contains("analyse") || input.contains("stat") || input.contains("bilan") || input.contains("semaine") {
                var advice = "📊 **Analyse de ton planning, \(pseudo) :**\n\n"
                advice += "• Tu as **\(totalAct)** activités configurées dans ta semaine.\n"
                if !logs.isEmpty {
                    advice += "• Taux de réussite global : **\(rate)%** (\(doneLogs.count) faites, \(logs.count - doneLogs.count) ratées).\n\n"
                    if rate >= 80 {
                        advice += "🔥 Magnifique ! Ta discipline est inspirante. Continue comme ça !"
                    } else if rate >= 50 {
                        advice += "⚡️ Bons efforts, essaie de limiter les reports ou les omissions."
                    } else {
                        advice += "⚠️ Fatigue ou planning trop chargé ? N'hésite pas à rajouter des blocs de 'Repos'."
                    }
                } else {
                    advice += "• Pas d'historique pour le moment. Rends-toi sur la page d'Accueil pour cocher tes réussites !"
                }
                return advice;
            }
            
            if input.contains("discipline") || input.contains("motivation") || input.contains("flemme") || input.contains("motiver") {
                return "💡 **Conseils de discipline pour \(pseudo) :**\n\n" +
                    "1. **La règle des 2 minutes** : Force-toi à démarrer l'activité pendant 2 minutes. Souvent, la flemme disparaît dès qu'on s'y met.\n\n" +
                    "2. **Coupe ton téléphone** : Éloigne les distractions visuelles de ton bureau.\n\n" +
                    "3. **Sommeil régulier** : La fatigue détruit la volonté. Prends soin de ton repos !"
            }
            
            if input.contains("devoir") || input.contains("ecole") || input.contains("école") || input.contains("travail") {
                return "📚 **Organisation scolaire :**\n\nPour tes devoirs, planifie des blocs de **30 à 45 minutes** avec des pauses de 5 minutes complètes. Ne regarde pas d'écrans pendant les pauses pour laisser reposer ton attention."
            }
            
            if input.contains("fatigue") || input.contains("repos") || input.contains("sommeil") || input.contains("dormir") {
                return "😴 **Sommeil & Énergie :**\n\nSi tu te sens fatigué, réduis la longueur de tes créneaux de travail et planifie au moins 8 heures de sommeil. Pense aussi à t'hydrater, c'est capital pour la mémoire !"
            }
            
            return "Je comprends, \(pseudo). 🤔 Écris 'analyse' pour voir tes chiffres, 'discipline' pour surmonter un coup de mou, ou entre ta clé API Gemini dans les paramètres pour débloquer une vraie conversation ouverte !"
        } else {
            // English Fallback
            if input.contains("hello") || input.contains("hi") || input.contains("hey") || input.contains("cc") {
                return "Hello \(pseudo)! 👋 I am your local Organizer. I can analyze your schedule, motivate you, or help you structure your studies and workouts. Try writing 'analyze' or 'discipline'!"
            }
            
            if input.contains("analyze") || input.contains("stat") || input.contains("week") || input.contains("progress") {
                var advice = "📊 **Schedule Analysis for \(pseudo):**\n\n"
                advice += "• You have **\(totalAct)** activities configured in your planner.\n"
                if !logs.isEmpty {
                    advice += "• Success rate: **\(rate)%** (\(doneLogs.count) completed, \(logs.count - doneLogs.count) missed).\n\n"
                    if rate >= 80 {
                        advice += "🔥 Outstanding! Your discipline is solid. Keep pushing!"
                    } else if rate >= 50 {
                        advice += "⚡️ Good job, try to focus on avoiding postponing tasks."
                    } else {
                        advice += "⚠️ Overwhelmed? Don't hesitate to schedule more 'Rest' blocks."
                    }
                } else {
                    advice += "• No history logs yet. Go to the Home screen to check off your first tasks!"
                }
                return advice;
            }
            
            if input.contains("discipline") || input.contains("motivation") || input.contains("lazy") || input.contains("motivate") {
                return "💡 **Discipline advice for \(pseudo):**\n\n" +
                    "1. **The 2-Minute Rule**: Commit to doing the task for just 2 minutes. The inertia is usually broken once you start.\n\n" +
                    "2. **Ditch the phone**: Keep distractions out of sight.\n\n" +
                    "3. **Sleep well**: Good energy is key to maintaining self-control."
            }
            
            if input.contains("homework") || input.contains("school") || input.contains("study") || input.contains("work") {
                return "📚 **Study tips:**\n\nSet study timers for **30 to 45 minutes** followed by a 5-minute offline break. This keeps your focus sharp and your mind fresh."
            }
            
            if input.contains("fatigue") || input.contains("rest") || input.contains("sleep") || input.contains("tired") {
                return "😴 **Rest & Recover:**\n\nRest is essential. Ensure you get 8 hours of sleep. Try scheduling dedicated recovery blocks after intense schoolwork or exercise."
            }
            
            return "I hear you, \(pseudo). 🤔 Type 'analyze' to view stats, 'discipline' for a boost, or enter a free Gemini API key in settings to unlock a full online conversation!"
        }
    }
}
