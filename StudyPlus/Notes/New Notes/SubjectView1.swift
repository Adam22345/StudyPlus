//
//  SubjectView1.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//
import SwiftUI
struct SubjectView1: View { //creates the view to check subjects and notes
    let subject: CurrentSchedule
    var body: some View {
        NavigationStack{
            ZStack{
                VStack(alignment: .leading) { // adjusts the alignment of the view
                    Text(subject.title)
                        .accessibilityAddTraits(.isHeader)
                        .font(.headline)
                    Spacer()
                        .font(.caption)
                }
                .padding()
            }
        }
    }
}
struct SubjectView_Previews: PreviewProvider {
    static var subject = CurrentSchedule.sampleData[0]
    static var previews: some View {
        SubjectView1(subject: subject)
    }
}
