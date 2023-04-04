//
//  ScheduleView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//
import SwiftUI

struct ScheduleView: View {
    @Binding var subjects: [CurrentSchedule]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = CurrentSchedule.Data()
    let saveAction: ()->Void
    
    var body: some View {
        NavigationStack{
            
            List {
                ForEach($subjects) { $subject in
                    NavigationLink(destination: InfoView(subject: $subject)) {
                        SubjectView1(subject: subject)
                    }
                }
                .onDelete { indices in
                    subjects.remove(atOffsets: indices)}
            }
            
            
            .navigationTitle("Notes")
            
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus.circle.fill")
                }
                .accessibilityLabel("New Note")
            }
            
            .sheet(isPresented: $isPresentingNewScrumView) {
                NavigationView {
                    InfoEditView(data: $newScrumData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Dismiss") {
                                    isPresentingNewScrumView = false
                                    newScrumData = CurrentSchedule.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Add") {
                                    let newSubject = CurrentSchedule(data: newScrumData)
                                    subjects.append(newSubject)
                                    isPresentingNewScrumView = false
                                    newScrumData = CurrentSchedule.Data()
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
            ScheduleView (subjects: .constant(CurrentSchedule.sampleData), saveAction: {})
        }
    }
}

