//
//  Subject.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import Foundation

struct Subject: Identifiable{
    
    enum SubjectKind: String, CaseIterable,Identifiable {
        case maths, science, computer, english, generic
        var id: String {
            self.rawValue
        }
        
        
        var emoji: String {
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
        
}
    
    
    var subjectKind: SubjectKind
    var date: Date
    var note: String
    var id: String
    
    
    
   
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    
    init(id: String = UUID().uuidString, subjectKind: SubjectKind = .generic, date: Date, note: String) {
        self.subjectKind = subjectKind
        self.date = date
        self.note = note
        self.id = id
    }
    
    
    
    static var sampleSubjects:[Subject] {
        
        return [
        
            Subject(subjectKind: .science, date: Date().diff(numDays: 3), note: "Complete Formulas"),
            Subject(subjectKind: .maths, date: Date().diff(numDays: 5), note: "Check Calculations"),
            Subject(subjectKind: .computer, date: Date().diff(numDays: 8), note: "Start Progarmming work"),
            Subject(subjectKind: .english, date: Date().diff(numDays: 10), note: "Look Up Definitions"),
            Subject(subjectKind: .generic, date: Date().diff(numDays: 11), note: "Organise Notes")
            
            
            
        
        
        
        
        ]
        
        
    }
    
    
    
    
    
    
    
    
    
    
}

