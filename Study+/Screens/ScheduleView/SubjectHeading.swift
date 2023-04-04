//
//  SubjectHeading.swift
//  Study+
//
//  Created by Adam Mohsin on 09/02/2023.
//

import SwiftUI

struct SubjectHeading: View {
    let subject: Subject
    @Binding var subjectKind: SubjectInfo?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(subject.subjectKind.emoji)
                        .font(.system(size: 40))
                    Text(subject.note)
                }
                Text(
                    subject.date.formatted(date: .abbreviated,
                                         time: .shortened)
                )
            }
            Spacer()
            Button {
                subjectKind = .update(subject)
            } label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
        }
    }
}


