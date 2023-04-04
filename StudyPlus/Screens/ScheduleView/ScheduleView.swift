//
//  ScheduleView.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct ScheduleView: View {
    @EnvironmentObject var theSubjects: SubjectCreate
    @State private var subjectKind: SubjectInfo?
    @Environment(\.scenePhase) private var scenePhase
   
    var body: some View {
        NavigationStack {
            List {
                ForEach(theSubjects.subjects.sorted {$0.date < $1.date }) { subject in
                    SubjectHeading(subject: subject, subjectKind: $subjectKind)
                        .swipeActions {
                            Button(role: .destructive) {
                                theSubjects.delete(subject)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                    }
                }
            .navigationTitle("Schedule")
            .sheet(item: $subjectKind) { $0 }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        subjectKind = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
        }
    }
}
    


