//
//  EmojiPicker.swift
//  Study+
//
//  Created by Adam Mohsin on 18/02/2023.
//

import SwiftUI

struct EmojiPicker: View {
    @Binding var selection: Subject1
    //Picker used to allow user to select diffrent Emoji
    var body: some View {
        Picker("Emoji", selection: $selection) {
            ForEach(Subject1.allCases) { symbol in
                SymbolView(symbol: symbol)
                   .tag(symbol)
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        EmojiPicker(selection: .constant(.maths))
    }
}
