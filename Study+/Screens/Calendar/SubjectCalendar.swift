//
//  SubjectCalendar.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct SubjectCalendar: View {
    @EnvironmentObject var subjectCreate: SubjectCreate
    @State private var datePicked: DateComponents?
    @State private var showSubject = false
    @State private var subjectKind: SubjectInfo?
    
    var body: some View {
        
            ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                             subjectCreate: subjectCreate,
                             datePicked: $datePicked,
                             showSubject: $showSubject)
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        subjectKind = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
            .sheet(item: $subjectKind) { $0 }
            .sheet(isPresented: $showSubject) {
                SubjectDay(datePicked:  $datePicked)
                    .presentationDetents([.medium, .large])
            }
            
                .navigationTitle("Calendar View")
        }
    }


struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectCalendar()
            .environmentObject(SubjectCreate(view: true))
    }
}

