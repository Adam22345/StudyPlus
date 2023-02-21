/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct InfoEditView: View {
    @Binding var data: CurrentSchedule.Data
    @State private var newSubjectName = ""
    
    
    var body: some View {
        Form {
            Section(header: Text("Schedule Details")) {
                TextField("Title", text: $data.title)
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                    
                            
                    
                }
                EmojiPicker(selection: $data.subject)
                
                
                
       
            }
            
            
            
            
            
            
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newSubjectName)
                    Button(action: {
                        withAnimation {
                            let attendee = CurrentSchedule.SubjectName(name: newSubjectName)
                            data.attendees.append(attendee)
                            newSubjectName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newSubjectName.isEmpty)
                }
            }
        }
    }
}

struct InfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        InfoEditView(data: .constant(CurrentSchedule.sampleData[0].data))
    }
}
