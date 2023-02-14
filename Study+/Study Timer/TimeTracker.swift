//
//  TimeTracker.swift
//  Study+
//
//  Created by Adam Mohsin on 15/02/2023.
//

import SwiftUI

struct TimeTracker: View {
    @State var elapsed = 0.0
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(lineWidth: 20)
                .foregroundColor(.gray)
                .opacity(0.1)
            
            Circle()
                .trim(from: 0.0,to: min (elapsed,1.0))
                .stroke(AngularGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.1112673828, blue: 0.05611023233, alpha: 1))]), center: .center) ,style: StrokeStyle(lineWidth: 15.0,lineCap: .round, lineJoin:.round))
                .rotationEffect((Angle(degrees: 270)))
                .animation(.easeInOut(duration: 1.0),value: elapsed)
            
            
            VStack(spacing: 30 ){
                
                VStack(spacing: 5){
                    Text("Elasped time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top )
                
                
                
                
                VStack(spacing: 5){
                    Text("Remaing time")
                        .opacity(0.7)
                    Text("0:00")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
            }
        }
            
            .frame(width: 250,height: 250)
            .padding()
            .onAppear{
                elapsed = 1
            }
        }
    }
    
    struct TimeTracker_Previews: PreviewProvider {
        static var previews: some View {
            TimeTracker()
        }
    }

