//
//  InfoEditView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//
import SwiftUI
//code which allows user to edit Notes 
struct InfoEditView: View {
    @Binding var data: CurrentSchedule.Data
    @State private var newSubjectName = "" //takes user input
    
    
    var body: some View {
        Form {
            Section(header: Text("Note Details")) {
                TextField("Note", text: $data.title) //titles for the edit view of the notes
                EmojiPicker(selection: $data.subject) //uses the emoji picker
                    }
            
           
        }
    }
}

struct InfoEditView_Previews: PreviewProvider {
    static var previews: some View {
        InfoEditView(data: .constant(CurrentSchedule.sampleData[0].data))
    }
}
