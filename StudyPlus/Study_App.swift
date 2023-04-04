//
//  Study_App.swift
//  Study+
//
//  Created by Adam Mohsin on 03/02/2023.
//

import SwiftUI
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
                Tabs(subjects: $store.subjects) //loads all the tabs of the App
                    .environmentObject(theSubjects)
                
                NoteView(subjects: $store.subjects){
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
