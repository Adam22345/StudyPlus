//
//  ScheduleListScreen.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct ScheduleListScreen: View {
    @EnvironmentObject var theSubjects: SubjectCreate
    var body: some View {
        TabView{
            SubjectColumns()
                .tabItem {
                    Label("List", systemImage: "list.triangle")
                }
            SubjectCalendar()
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                    
                }
            StudyTimer()
                .tabItem{
                    Label("Study Timer", systemImage: "clock")
                }

        }
    }
}

struct StartTabView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListScreen()
            .environmentObject(SubjectCreate(view: true))
    }
}
