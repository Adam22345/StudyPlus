//
//  InfoView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//

import SwiftUI

struct InfoView: View {
    @Binding var subject: CurrentSchedule
    
    @State private var data = CurrentSchedule.Data()
    @State private var showInfoView = false
    
    var body: some View {
        List {}
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

