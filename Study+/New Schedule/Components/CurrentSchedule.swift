/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct CurrentSchedule: Identifiable, Codable {
    let id: UUID
    var title: String
    var subjectNames: [SubjectName]
    var lengthInMinutes: Int
    var subject: Subject1
    var timeLine: [Timeline] = []
   
    
    init(id: UUID = UUID(), title: String  , subjectNames: [String], lengthInMinutes: Int, subject: Subject1) {
        self.id = id
        self.title = title
        self.subjectNames = subjectNames.map { SubjectName(name: $0) }
        self.lengthInMinutes = lengthInMinutes
        self.subject = subject

    }
}

extension CurrentSchedule {
    struct SubjectName: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data {
        var title: String = ""
        var attendees: [SubjectName] = []
        var lengthInMinutes: Double = 5
        var subject: Subject1 = .generic
       
        
    }
    
    var data: Data {
        Data(title: title, attendees: subjectNames, lengthInMinutes: Double(lengthInMinutes), subject: subject)
    }
    
    mutating func change(from data: Data) {
        title = data.title
        subjectNames = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        subject = data.subject
        
    }
    
    init(data: Data) {
        id = UUID()
        title = data.title
        subjectNames = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        subject = data.subject
  
    
    }
}

extension CurrentSchedule {
    static let sampleData: [CurrentSchedule] =
    [
        CurrentSchedule(title: "",  subjectNames: [""], lengthInMinutes: 10, subject: .maths)
    ]
}
