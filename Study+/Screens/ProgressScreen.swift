//
//  ProgressScreen.swift
//  Study Kit
//
//  Created by Adam Mohsin on 11/02/2023.
//

import SwiftUI

struct ProgressScreen: View {
    @EnvironmentObject var router: manageTabs
    var body: some View {
        ZStack{
            
            VStack{
                
                Text("Progress")
                    .font(.system(size: 36,weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                
                Button{
                    router.change(to: .calendar)
                } label: {
                    Text("Switch to Calendar")
                }
            }
            
        }

        .frame(maxWidth: .infinity,
               maxHeight: .infinity,
               alignment: .topLeading)
        .background(.white)
        .clipped()
    }
}

struct ProgressScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProgressScreen()
            .environmentObject(manageTabs())
    }
}

