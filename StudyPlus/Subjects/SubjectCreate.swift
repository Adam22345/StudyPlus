//
//  SubjectCreate.swift
//  Study+
//
//  Created by Adam Mohsin on 13/02/2023.
//

import Foundation

@MainActor
class SubjectCreate: ObservableObject {
    
    @Published var subjects = [Subject]()
    @Published var view: Bool
    @Published var diffSubject: Subject?
    @Published var shiftSubject: Subject?
    
    init(view: Bool = false) {
        self.view = view
        getSubjects()
    }
    
    
    func getSubjects() {
        if view {
            subjects = Subject.sampleSubjects
        } else {
            
        }
    }
    
    func add(_ subject: Subject) {
        subjects.append(subject)
        diffSubject = subject
    }
    
    
    
    func delete(_ event: Subject) {
        if let index = subjects.firstIndex(where: {$0.id == event.id}) {
            diffSubject = subjects.remove(at: index)
        }
    }
    
    func update(_ subject: Subject) {
        if let index = subjects.firstIndex(where: {$0.id == subject.id}) {
            shiftSubject = subjects[index]
            subjects[index].date = subject.date
            subjects[index].note = subject.note
            subjects[index].subjectKind = subject.subjectKind
            diffSubject = subject
        }
    }
    
    
    
}
