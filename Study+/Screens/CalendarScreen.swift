//
//  CalendarScreen.swift
//  Study Kit
//
//  Created by Adam Mohsin on 11/02/2023.
//

import SwiftUI

struct CalendarScreen: View {
    
    @EnvironmentObject var router: manageTabs
    
    var body: some View {
        ZStack{
            VStack{
                
                Text("Calendar")
                    .font(.system(size: 36,weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                
                Button{
                    router.change(to: .progress)
                } label: {
                    Text("Switch to ")
                }
            }
            
        }
        .frame(maxWidth: .infinity,
              
               maxHeight: .infinity,
               alignment: .topLeading
               )
        .background(.white)
        .clipped()
    }
}

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen()
            .environmentObject(manageTabs())
    }
}

