//
//  CurrentSchedule.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//

import Foundation

struct CurrentSchedule: Identifiable, Codable { // the body of the CurrentSchedule along with all variables
    let id: UUID
    var title: String
    var subjectNames: [SubjectName]
    var timeLeft: Int
    var subject: Subject1
    var timeLine: [Timeline] = []
   
    
    init(id: UUID = UUID(), title: String  , subjectNames: [String], timeLeft: Int, subject: Subject1) { //initialises all the methods for the variables
        self.id = id
        self.title = title
        self.subjectNames = subjectNames.map { SubjectName(name: $0) }
        self.timeLeft = timeLeft
        self.subject = subject

    }
}

extension CurrentSchedule {
    struct SubjectName: Identifiable, Codable { // adding Identifiable, Codable
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data { // constructs data for the CurrentSchedule
        var title: String = ""
        var otherNotes: [SubjectName] = []
        var timeLeft: Double = 5
        var subject: Subject1 = .generic
       
        
    }
    
    var data: Data {
        Data(title: title, otherNotes: subjectNames, timeLeft: Double(timeLeft), subject: subject)
    }
    
    mutating func change(from data: Data) { // modifies the properties of Data
        title = data.title
        subjectNames = data.otherNotes
        timeLeft = Int(data.timeLeft)
        subject = data.subject
        
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        subjectNames = data.otherNotes
        timeLeft = Int(data.timeLeft)
        subject = data.subject
  
    
    }
}

extension CurrentSchedule {
    static let sampleData: [CurrentSchedule] =
    [
        CurrentSchedule(title: "",  subjectNames: [""], timeLeft: 10, subject: .maths)
    ]
}
