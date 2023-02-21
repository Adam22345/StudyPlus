//
//  Study_App.swift
//  Study+
//
//  Created by Adam Mohsin on 11/02/2023.
//

import SwiftUI

//App is executed here
enum Screen{
    case calendar
    case progress
}

final class manageTabs: ObservableObject {
    
    @Published var screen: Screen = .calendar
    
    
    func change (to screen: Screen) {
        self.screen = screen
    }
}


@main
struct Study: App {
    @StateObject private var store = SubjectStorage()
    @StateObject var theSubjects = SubjectCreate(view: true)
    
    
    var body: some Scene {
        WindowGroup {
            
            
            NavigationView {
                
                
                
                
                
                ScheduleView(subjects: $store.subjects) {
                    SubjectStorage.store(subjects: store.subjects) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                        
                    }
                    
                }
                
                
            
            
        }
            ScheduleListScreen(subjects: $store.subjects) //Needs to be fixed 
            .environmentObject(theSubjects)
           
            .onAppear {
                SubjectStorage.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let subjects):
                        store.subjects = subjects
                    }
                }
            }
        }
    }
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
  //  @StateObject var router = manageTabs()
    
   // var body: some Scene {
     //   WindowGroup {
       //     TabView(selection: $router.screen){
         //       CalendarScreen()
           //         .badge(10)
             //       .tag(Screen.calendar)
               //     .environmentObject(router)
                 //   .tabItem {
                   //     Label("Calendar",systemImage: "calendar")
       //             }
         //       ProgressScreen()
           //         .tag(Screen.progress)
             //       .environmentObject(router)
               //     .tabItem{
                 //       Label("Progress",systemImage: "chart.bar.xaxis")
         //           }
            
        //    }
       // }
 
//}

