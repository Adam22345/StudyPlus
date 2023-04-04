//
//  SubjectList.swift
//  Study+
//
//  Created by Adam Mohsin on 09/02/2023.
//

import SwiftUI

struct SubjectList: View {
    @Binding var subjects: [Subject]
    @Environment(\.scenePhase) private var scenePhase
    @EnvironmentObject var theSubjects: SubjectCreate
    @State private var subjectType: SubjectInfo?
    let saveAction: ()->Void
    var body: some View {
        NavigationStack {
            List {
                ForEach(theSubjects.subjects.sorted {$0.date < $1.date }) { subject in
                    SubjectRow(subject: subject, subjectType: $subjectType)
                        .swipeActions {
                            Button(role: .destructive) {
                                theSubjects.delete(subject)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                }
            }
            .navigationTitle("Calendar Events")
            .sheet(item: $subjectType) { $0 }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        subjectType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                        
                        
                        
                        
                    }
                }
               
            }
           
           
            
        }
        onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
                }
        
    }
   
   
}


struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectList(subjects: .constant(Subject.sampleSubjects) ,saveAction:{})
            .environmentObject(SubjectCreate(view: true))
    }
}

