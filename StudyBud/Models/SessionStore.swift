//
//  SessionStore.swift
//  StudyBud
//
//  Created by Ayana Griffin on 5/30/25.
//


import Foundation

class SessionStore {
    private let recentKey = "recentTasks"
    private let settingsKey = "lastSession"

    // Return last two unique tasks the user entered.
    var recentTasks: [String] {
        get { UserDefaults.standard.stringArray(forKey: recentKey) ?? [] }
        set {
            let unique = Array(Set(newValue))
            let lastTwo = unique.suffix(2)
            UserDefaults.standard.set(Array(lastTwo), forKey: recentKey)
        }
    }

    func save(settings: SessionSettings) {
        // update recents
        var recents = UserDefaults.standard.stringArray(forKey: recentKey) ?? []
        recents.append(settings.taskName)
        recentTasks = recents

        // store last session
        if let data = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(data, forKey: settingsKey)
        }
    }

    func loadLast() -> SessionSettings? {
        guard let data = UserDefaults.standard.data(forKey: settingsKey),
              let s = try? JSONDecoder().decode(SessionSettings.self, from: data)
        else { return nil }
        return s
    }
}

