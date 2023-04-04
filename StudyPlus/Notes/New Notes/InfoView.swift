//
//  InfoView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//

//
//  InfoView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//

import SwiftUI

struct InfoView: View {
    @Binding var subject: CurrentSchedule // The Binding for CurrentSchedule
    
    @State private var data = CurrentSchedule.Data()// @State resposnible for CurrentSchedule data
    @State private var showInfoView = false // @State which presents info
    
    
    var body: some View {
        List {}
        .navigationTitle(subject.title)
        .toolbar {// Tool bar for the info screen
            Button("Edit") { // allows user to edit from the toolbar
                showInfoView = true
                data = subject.data
            }
        }
        .sheet(isPresented: $showInfoView) { //Uses .sheet to show info edit
            NavigationView {
                InfoEditView(data: $data) // Schedule data is passed to info edit
                    .navigationTitle(subject.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) { // Cancel button set for toolbar
                            Button("Cancel") {
                                showInfoView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) { // Done button set for toolbar
                            Button("Done") {
                                showInfoView = false
                                subject.change(from: data) // The schedule data is updated here
                            }
                        }
                    }
            }
        }
    }
}
