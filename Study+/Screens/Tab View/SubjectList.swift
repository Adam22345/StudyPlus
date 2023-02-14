//
//  SubjectList.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct SubjectList: View {
    @EnvironmentObject var theSubjects: SubjectCreate
    @State private var subjectType: SubjectInfo?
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
    }
}

struct EventsListView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectList()
            .environmentObject(SubjectCreate(view: true))
    }
}
