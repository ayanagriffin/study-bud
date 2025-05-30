import Foundation

struct DialogueManager {
    static let taskPrompts = [
        "What are you working on today?",
        "Got something in mind for this session?",
        "Let’s pick a task—what’s on deck?"
    ]

    static let durationPrompts = [
        "How long shall we go for—30 or 45 minutes?",
        "Pick a duration:",
        "Set your timer—30 or 45?"
    ]

    static func randomTaskPrompt() -> String {
        taskPrompts.randomElement()!
    }
    static func randomDurationPrompt() -> String {
        durationPrompts.randomElement()!
    }
}

