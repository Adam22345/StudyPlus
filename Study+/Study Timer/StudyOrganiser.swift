//
//  StudyOrganiser.swift
//  Study+
//
//  Created by Adam Mohsin on 19/02/2023.
//

import Foundation

enum StartStudy{
    case negative
    case study
    case finished
}

enum StudySessions: String{
    case short = "1-2 hours"
    case medium = "2-3 hours"
    case long = "4-5 hours (Longer Not Recommended)"
    
    
    var studyhours : Double{
        switch self {
        case .short:
            return 2
        case .medium:
            return 3
        case .long:
            return 4
        }
    }
}

class StudyOrganiser: ObservableObject{
    @Published private(set) var startStudy: StartStudy = .negative
    @Published private (set) var studySessions: StudySessions = .short
    @Published private (set) var startingtime:Date{
        didSet {
            print("startTime",startingtime.formatted(.dateTime.month().day().hour().second()))
            if startStudy == .study {
                finishingtime = startingtime.addingTimeInterval(studytime)
            } else {
                finishingtime = startingtime.addingTimeInterval(finishtime)
            }
        }
        
    }
  
    @Published private (set) var finishingtime: Date{
        didSet{
            print("finishTime",finishingtime.formatted(.dateTime.month().day().hour().second()))
        }
        
        
        
    }
    @Published private (set) var timepassed: Bool = false
    @Published private (set) var timeElapsed: Double = 0.0
    @Published private (set) var progression: Double = 0.0
   
    
    //when testing and finliasation is complete multiply these by 60
    var studytime : Double {
        return studySessions.studyhours * 60 * 60
    }
    var finishtime : Double {
        return (24 - studySessions.studyhours) * 60 * 60
    }
    
    init() {
        let cal = Calendar.current
        
//        var parts = cal.dateComponents([.year,.month,.day,.hour], from: Date())
//        parts.hour = 14
//        print(parts)
//        let timeset = cal.date(from: parts) ?? Date.now
//        print("timeset",timeset.formatted(.dateTime.month().day().hour().second()))
        
        
        let parts = DateComponents(hour:14)
        let timeset = cal.nextDate(after: .now, matching: parts, matchingPolicy: .nextTime )!
        
        print("timeset",timeset.formatted(.dateTime.month().day().hour().second()))
        
        // this one times 60 after testing 
        startingtime = timeset
        finishingtime = timeset.addingTimeInterval(StudySessions.short.studyhours * 60 * 60 )
        
    }
    
    func startStudying(){
        startStudy = startStudy == .study ? .finished : .study
        startingtime = Date()
    }
    
    func trace(){
        
        guard startStudy != .negative else {return}
        print("now",Date().formatted(.dateTime.month().day().hour().second()))
        
        
        if finishingtime >= Date(){
            print ("not alapsed")
            timepassed = false
        }else {
            print("elapsed")
            timepassed = true
        }
        
        timeElapsed += 1
        print("timeElapsed", timeElapsed)
        
        let maxTime = startStudy == .study ? studytime : finishtime
        progression = (timeElapsed / maxTime * 100).rounded() / 100
        print("progress",progression)
    }
}
