//
//  CalendarPage.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var subjectCreate: SubjectCreate
    @Binding var datePicked: DateComponents?
    @Binding var showSubject: Bool
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.delegate = context.coordinator
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, subjectCreate: _subjectCreate)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let diffSubject = subjectCreate.diffSubject {
            uiView.reloadDecorations(forDateComponents: [diffSubject.dateComponents], animated: true)
            subjectCreate.diffSubject = nil
        }

        if let shiftSubject = subjectCreate.shiftSubject {
            uiView.reloadDecorations(forDateComponents: [shiftSubject.dateComponents], animated: true)
            subjectCreate.shiftSubject = nil
        }
    }
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        var parent: CalendarView
        @ObservedObject var subjectCreate: SubjectCreate
        init(parent: CalendarView, subjectCreate: ObservedObject<SubjectCreate>) {
            self.parent = parent
            self._subjectCreate = subjectCreate
        }
        
        @MainActor
        func calendarView(_ calendarView: UICalendarView,
                          decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            let foundSubjects = subjectCreate.subjects
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
            if foundSubjects.isEmpty { return nil }

            if foundSubjects.count > 1 {
                return .image(UIImage(systemName: "doc.on.doc.fill"),
                              color: .red,
                              size: .large)
            }
            let oneSubject = foundSubjects.first!
            return .customView {
                let emoji = UILabel()
                emoji.text = oneSubject.subjectKind.emoji
                return emoji
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           didSelectDate dateComponents: DateComponents?) {
            parent.datePicked = dateComponents
            guard let dateComponents else { return }
            let foundSubjects = subjectCreate.subjects
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
            if !foundSubjects.isEmpty {
                parent.showSubject.toggle()
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           canSelectDate dateComponents: DateComponents?) -> Bool {
            return true
        }
        
    }
    
    
}
