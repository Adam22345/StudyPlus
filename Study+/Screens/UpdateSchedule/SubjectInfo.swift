//
//  SubjectInfo.swift
//  Study+
//
//  Created by Adam Mohsin on 14/02/2023.
//

import SwiftUI

enum SubjectInfo: Identifiable, View {
    case new
    case update(Subject)
    var id: String {
        switch self {
        case .new:
            return "new"
        case .update:
            return "update"
        }
    }

    var body: some View {
        switch self {
        case .new:
            return SubjectStructure(viewSubject: SubjectView())
        case .update(let subject):
            return SubjectStructure(viewSubject: SubjectView(subject))
        }
    }
}
