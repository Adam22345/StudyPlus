//
//  Subject1.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//
import SwiftUI

enum Subject1: String, CaseIterable, Identifiable, Codable {
    case maths
    
    case science
    
    case computer
    
    case english
    
    case generic
    var subjectEmoji: String {
        switch self {
        case .maths:
            return "➗"
        case .science:
            return "🧪"
        case .computer:
            return "🖥️"
        case .english:
            return "📖"
        case .generic:
            return "📚"
        }
    }
    var mainEmoji: String {
        String(rawValue)
    }
    var subjectType: String {
        rawValue.capitalized
    }
    var id: String {
        subjectType
    }
}
