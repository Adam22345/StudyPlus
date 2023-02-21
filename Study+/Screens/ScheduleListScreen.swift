//
//  ScheduleListScreen.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
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
                    Label("Schedule", systemImage: "list.clipboard")
                }
            SubjectColumns()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
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
    

//struct StartTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            ScheduleListScreen(subjects: .constant(Subject.sampleSubjects) ,saveAction:{})
 //               .environmentObject(SubjectCreate(view: true))
       // }
 //   }
//}
