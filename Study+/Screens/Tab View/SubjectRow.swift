//
//  SubjectRow.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct SubjectRow: View {
    let subject: Subject
    @Binding var subjectType: SubjectInfo?
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
                subjectType = .update(subject)
            } label: {
                Text("Edit")
            }
            .buttonStyle(.bordered)
        }
    }
}

 struct ListViewRow_Previews: PreviewProvider {
     static let subject = Subject(subjectKind: .maths, date: Date(), note: "Let's party")
    static var previews: some View {
        SubjectRow(subject: subject, subjectType: .constant(.new))
    }
 }
