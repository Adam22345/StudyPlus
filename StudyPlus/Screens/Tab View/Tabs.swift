//
//  Tabs.swift
//  Study+
//
//  Created by Adam Mohsin on 06/02/2023.
//

import SwiftUI

struct Tabs: View {
  
   
    @Binding var subjects: [CurrentSchedule]
    @EnvironmentObject var theSubjects: SubjectCreate
    @StateObject private var store = SubjectStorage()
   
    var body: some View {
      
        TabView{
            
          
            NoteView(subjects: $store.subjects,saveAction:{})
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
            ScheduleView()
                .tabItem {
                    Label("Schedule", systemImage: "list.bullet")
                }
            CalendarViewer()
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
    

