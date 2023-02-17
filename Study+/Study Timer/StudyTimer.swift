//
//  StudyTimer.swift
//  Study+
//
//  Created by Adam Mohsin on 15/02/2023.
//

import SwiftUI

struct StudyTimer: View {
    var body: some View {
        ZStack{
            
            timer
            
        }
    }
    
    var timer:some View {
        VStack{
            
            Text("Start Studying!")
                .font(.headline)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.1112673828, blue: 0.05611023233, alpha: 1)))
            
            Text("2 hours")
                .fontWeight(.bold)
                .padding(.horizontal,24)
                .padding(.vertical,8)
                .backgroundStyle(.thinMaterial)
                .cornerRadius(20)
            
            TimeTracker()
            //Keeps Track of timer settings
            HStack(spacing: 60){
                
                VStack(spacing: 5) {
                    Text("start")
                        .opacity(0.7)
                    
                    Text(Date(),format:.dateTime.weekday().hour().minute().second())
                        .fontWeight(.bold)
                }
                VStack(spacing: 5) {
                    Text("End")
                        .opacity(0.7)
                    
                    Text(Date().addingTimeInterval(16),format:.dateTime.weekday().hour().minute().second())
                        .fontWeight(.bold)
                }
                
            }
            
            Button {
                
            } label: {
                Text("Start Studying")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal,24)
                    .padding(.vertical,8)
                    .backgroundStyle(.thinMaterial)
                    .cornerRadius(20)
                
            }
            
        }
        .foregroundColor(.black)
        
    }
    
}

struct StudyTimer_Previews: PreviewProvider {
    static var previews: some View {
        StudyTimer()
    }
}
