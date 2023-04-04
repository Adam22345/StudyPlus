//
//  SubjectStructure.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct SubjectStructure: View {
    @EnvironmentObject var subjectCreate: SubjectCreate
    @StateObject var viewSubject: SubjectView
    @Environment(\.dismiss) var dismiss
    @FocusState private var focus: Bool?
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    DatePicker(selection: $viewSubject.date) {
                        Text("Date and Time")
                    }
                    TextField("Note", text: $viewSubject.note, axis: .vertical)
                        .focused($focus, equals: true)
                    Picker("Event Type", selection: $viewSubject.subjectKind) {
                        ForEach(Subject.SubjectKind.allCases) {subjectKind in
                            Text(subjectKind.emoji + " " + subjectKind.rawValue.capitalized)
                                .tag(subjectKind)
                        }
                    }
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            if viewSubject.updating {
                                // update this event
                                let subject = Subject(id: viewSubject.id!,
                                                  subjectKind: viewSubject.subjectKind,
                                                  date: viewSubject.date,
                                                  note: viewSubject.note)
                                subjectCreate.update(subject)
                            } else {
                                // create new event
                                let newSubject = Subject(subjectKind: viewSubject.subjectKind,
                                                     date: viewSubject.date,
                                                     note: viewSubject.note)
                                subjectCreate.add(newSubject)
                            }
                            dismiss()
                        } label: {
                            Text(viewSubject.updating ? "Update Subject" : "Add Subject")
                        }
                        .buttonStyle(.borderedProminent)
                        .disabled(viewSubject.incomplete)
                        Spacer()
                    }
                    ) {
                        EmptyView()
                    }
                }
            }
            .navigationTitle(viewSubject.updating ? "Update" : "New Event")
            .onAppear {
                focus = true
            }
        }
    }
}

struct SubjectViewPreview: PreviewProvider {
    static var previews: some View {
        SubjectStructure(viewSubject: SubjectView())
            .environmentObject(SubjectCreate())
    }
}



