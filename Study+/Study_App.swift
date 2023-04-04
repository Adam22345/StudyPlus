//
//  Study_App.swift
//  Study+
//
//  Created by Adam Mohsin on 11/02/2023.
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

//App is executed here
@main
//This code is the main point of entry of the App
struct Study: App {
    // These StateObjects store and retrieve users subjects
    @StateObject private var store = SubjectStorage()
    @StateObject var theSubjects = SubjectCreate(view: true) // create new subjects
    
    // the body of the app used to dispaly the views
    var body: some Scene {
        WindowGroup {
          NavigationView{
                ScheduleListScreen(subjects: $store.subjects)
                    .environmentObject(theSubjects)
                
                ScheduleView(subjects: $store.subjects){
                    SubjectStorage.store(subjects: store.subjects) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
           
            //code for error handling
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
