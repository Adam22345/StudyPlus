//
//  StudyTimer.swift
//  Study+
//
//  Created by Adam Mohsin on 15/02/2023.
//
//Timer for studying
import SwiftUI

struct StudyTimer: View {
  
   @StateObject var studyOrganiser = StudyOrganiser()
    
    var title: String {
        switch studyOrganiser.startStudy {
            
        case .negative:
            return "start study "
        
        
        case .study:
            return "You are Studying now "
            
        
        case .finished:
            return "Study Finished "
            
            
            
        }
    }
  
    
    var body:some View {
        
        ZStack {
            

            
            VStack(spacing:40){
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1112673828, blue: 0.05611023233, alpha: 1)))
                
                Text(studyOrganiser.studySessions.rawValue)
                    .fontWeight(.bold)
                    .padding(.horizontal,24)
                    .padding(.vertical,8)
                    .backgroundStyle(.thinMaterial)
                    .cornerRadius(20)
                
                TimeTracker()
                    .environmentObject(studyOrganiser)
                //Keeps Track of timer settings
                HStack(spacing: 60){
                    
                    VStack(spacing: 5) {
                        Text(studyOrganiser.startStudy == .negative ? "Start" : "Started")
                            .opacity(0.7)
                        
                        Text(studyOrganiser.startingtime,format:.dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    VStack(spacing: 5) {
                        Text(studyOrganiser.startStudy == .negative ? "Finish" : "Finished")
                            .opacity(0.7)
                        
                        Text(studyOrganiser.finishingtime,format:.dateTime.weekday().hour().minute().second())
                            .fontWeight(.bold)
                    }
                    
                }
                
                Button {
                    studyOrganiser.startStudying()
                    
                } label: {
                    Text(studyOrganiser.startStudy == .study ? "Finish Studying": "Start Studying")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal,24)
                        .padding(.vertical,8)
                        .backgroundStyle(.thinMaterial)
                        .cornerRadius(20)
                    
                }
                
            }
            
           
        
           

            
        }
    }
    
}

struct StudyTimer_Previews: PreviewProvider {
    static var previews: some View {
        StudyTimer()
    }
}
