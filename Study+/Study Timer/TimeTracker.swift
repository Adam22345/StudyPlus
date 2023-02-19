//
//  TimeTracker.swift
//  Study+
//
//  Created by Adam Mohsin on 15/02/2023.
//

import SwiftUI

struct TimeTracker: View {
    @EnvironmentObject var studyOrganiser:StudyOrganiser
   
    
   let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0,to: min (studyOrganiser.progression,1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.1112673828, blue: 0.05611023233, alpha: 1))]), center: .center) ,style: StrokeStyle(lineWidth: 15.0,lineCap: .round, lineJoin:.round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0),value: studyOrganiser.progression)
            
            
            VStack(spacing: 30 ){
                
                if studyOrganiser.startStudy == .negative {
                    VStack(spacing: 5){
                        Text("Upcoming Study Session")
                            .opacity(0.7)
                        Text("\(studyOrganiser.studySessions.studyhours.formatted()) Hours")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }else{
                    
                    
                    
                    VStack(spacing: 5){
                        Text("Elasped time(\(studyOrganiser.progression.formatted(.percent)))")
                            .opacity(0.7)
                        Text(studyOrganiser.startingtime, style: .timer)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding(.top )
                    
                    
                    
                    
                    VStack(spacing: 5){
                        if !studyOrganiser.timepassed{
                            Text("Remaining time(\((1-studyOrganiser.progression).formatted(.percent)))")
                                .opacity(0.7)
                        }else{
                            Text("Extra time")
                                .opacity(0.7)
                        }
                        
                        Text(studyOrganiser.finishingtime, style: .timer)
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                }
            }
        }
            
            .frame(width: 250,height: 250)
            .padding()
   //         .onAppear{
     //           elapsed = 1
     //       }
            .onReceive(timer){ _ in
                studyOrganiser.trace()
                
            }

 
        }
        
    }

    
    struct TimeTracker_Previews: PreviewProvider {
        static var previews: some View {
            TimeTracker()
                .environmentObject(StudyOrganiser())
        }
    }

