/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct InfoView: View {
    @Binding var subject: CurrentSchedule
    
    @State private var data = CurrentSchedule.Data()
    @State private var showInfoView = false
    
    var body: some View {
        List {
          
            Section(header: Text("Attendees")) {
                ForEach(subject.subjectNames) { subjectNames in
                    Label(subjectNames.name, systemImage: "person")
                }
            }
            
          
            
            
            Section(header: Text("Timeline")) {
                if subject.timeLine.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(subject.timeLine) { timeline in
                    HStack {
                        Image(systemName: "calendar")
                        Text(timeline.date, style: .date)
                    }
                }
            }
        }
        .navigationTitle(subject.title)
        .toolbar {
            Button("Edit") {
                showInfoView = true
                data = subject.data
            }
        }
        .sheet(isPresented: $showInfoView) {
            NavigationView {
                InfoEditView(data: $data)
                    .navigationTitle(subject.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                showInfoView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                showInfoView = false
                                subject.change(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoView(subject: .constant(CurrentSchedule.sampleData[0]))
        }
    }
}
