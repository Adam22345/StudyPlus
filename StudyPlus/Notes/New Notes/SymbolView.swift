//
//  SymbolView.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//

import SwiftUI
struct SymbolView: View { // creates the emoji viewer for the when adding new notes
    let symbol: Subject1
    var body: some View {
        NavigationStack{
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                Label(symbol.subjectEmoji, systemImage: "") //sets the emoji for the notes
                    .padding(4)
            }
                    .fixedSize(horizontal: false, vertical: true)
        }
    }
}
struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolView(symbol: .generic)
    }
}
