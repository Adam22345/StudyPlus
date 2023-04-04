//
//  SubjectView.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import Foundation

class SubjectView: ObservableObject {
    @Published var date = Date()
    @Published var note = ""
    @Published var subjectKind: Subject.SubjectKind = .generic

    var id: String?
    var updating: Bool { id != nil }

    init() {}

    init(_ subject: Subject) {
        date = subject.date
        note = subject.note
        subjectKind = subject.subjectKind
        id = subject.id
    }

    var incomplete: Bool {
        note.isEmpty
    }
}
