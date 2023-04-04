//
//  ScheduleListScreen.swift
//  Study+
//
//  Created by Adam Mohsin on 06/02/2023.
//

import SwiftUI

struct ScheduleListScreen: View {
  
   
    @Binding var subjects: [CurrentSchedule]
    @EnvironmentObject var theSubjects: SubjectCreate
    @StateObject private var store = SubjectStorage()
   
    var body: some View {
      
        TabView{
            
          
            
            ScheduleView(subjects: $store.subjects,saveAction:{})
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
            SubjectColumns()
                .tabItem {
                    Label("Schedule", systemImage: "list.bullet")
                }
            SubjectCalendar()
                .tabItem {
                    Label("Calendar", systemImage: "calendar.circle")
                    
                }
            StudyTimer()
                .tabItem{
                    Label("Study Timer", systemImage: "timer")
                }
            
            
            
        }
    
        
    }
    
       
    
   }
    

