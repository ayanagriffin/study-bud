//
//  SessionSettings.swift
//  StudyBud
//
//  Created by Ayana Griffin on 4/28/25.
//  Holds the user’s choice for a session.


import Foundation

struct SessionSettings: Codable {
    var taskName: String
    var durationMinutes: Int
}
