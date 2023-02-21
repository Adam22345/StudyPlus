/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct Timeline: Identifiable, Codable {
  
    let id: UUID
    let date: Date
    var attendees: [CurrentSchedule.SubjectName]
    var lengthInMinutes: Int
    


    init(id: UUID = UUID(), date: Date = Date(), attendees: [CurrentSchedule.SubjectName], lengthInMinutes: Int = 5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        
        
 
    }
}
