//
//  SubjectDay.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct SubjectDay: View {
    @EnvironmentObject var subjectCreate: SubjectCreate
    @Binding var datePicked: DateComponents?
    @State private var subjectType: SubjectInfo?
    
    var body: some View {
        NavigationStack {
            Group {
                if let datePicked {
                    let foundSubject = subjectCreate.subjects
                        .filter {$0.date.startOfDay == datePicked.date!.startOfDay}
                    List {
                        ForEach(foundSubject) { subject in
                            SubjectRow(subject: subject, subjectType:  $subjectType)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        subjectCreate.delete(subject)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                                .sheet(item: $subjectType) { $0 }
                        }
                    }
                }
            }
            .navigationTitle(datePicked?.date?.formatted(date: .long, time: .omitted) ?? "")
        }
    }
}

struct SubjectDay_Preview: PreviewProvider {
    static var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    static var previews: some View {
        SubjectDay(datePicked: .constant(dateComponents))
            .environmentObject(SubjectCreate(view: true)
            )
    }
}
