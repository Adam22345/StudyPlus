//
//  NoteView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//
import SwiftUI

struct NoteView: View {
    @Binding var subjects: [CurrentSchedule] // Binding the variable subjects to CurrentSchedule
    @Environment(\.scenePhase) private var scenePhase // @Environment check current state of the App
    @State private var showNewNote = false
    @State private var newNotes = CurrentSchedule.Data() // Presents new Notes to CurrentSchedule
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack{
            List {
                ForEach($subjects) { $subject in
                    NavigationLink(destination: InfoView(subject: $subject)) {
                        SubjectView1(subject: subject) //Updates the subject in the view
                        }
                }
                .onDelete { indices in
                    subjects.remove(atOffsets: indices)} // removes any user input
            }
                .navigationTitle("Notes")
                .toolbar {
                Button(action: { //Button to add new notes
                    showNewNote = true
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .accessibilityLabel("New Note")
            }
                .sheet(isPresented: $showNewNote) { // .sheet to add new notes and show them
                NavigationView {
                    InfoEditView(data: $newNotes)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    showNewNote = false
                                    newNotes = CurrentSchedule.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) { // tool bar to add the new notes
                                Button("Add") {
                                    let newSubject = CurrentSchedule(data: newNotes)
                                    subjects.append(newSubject)
                                    showNewNote = false
                                    newNotes = CurrentSchedule.Data() // new notes data
                                }
                            }
                        }
                }
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive { saveAction() }
            }
        }
    }
        
    }
    
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoteView (subjects: .constant(CurrentSchedule.sampleData), saveAction: {})
        }
    }
}

