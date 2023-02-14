//
//  SubjectColumns.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct SubjectColumns: View {
    @EnvironmentObject var theSubjects: SubjectCreate
    @State private var subjectKind: SubjectInfo?
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
            .navigationTitle("Calendar Events")
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

//struct EventsListView_Previews: PreviewProvider {
  //  static var previews: some View {
    //    EventsListView()
      //      .environmentObject(EventStore(preview: true))
   // }
//}

