/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct EmojiPicker: View {
    @Binding var selection: Subject1
    
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
