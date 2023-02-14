//
//  Study_App.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI


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
struct Study_App: App {
    
    @StateObject var theSubjects = SubjectCreate(view: true)

    var body: some Scene {
        WindowGroup {
            ScheduleListScreen()
                .environmentObject(theSubjects)
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
}
