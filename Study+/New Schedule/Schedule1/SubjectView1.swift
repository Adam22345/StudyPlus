/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct SubjectView1: View {
    let subject: CurrentSchedule
    
    var body: some View {
        
        NavigationStack{
            ZStack{
                
                VStack(alignment: .leading) {
                    Text(subject.title)
                        .accessibilityAddTraits(.isHeader)
                        .font(.headline)
                    Spacer()
                    HStack {
                        Label("\(subject.subjectNames.count)", systemImage: "person.3")
                            .accessibilityLabel("\(subject.subjectNames.count) attendees")
                        Spacer()
                        
                        
                        
                        
                        
                        
                        Label("\(subject.lengthInMinutes)", systemImage: "clock")
                            .accessibilityLabel("\(subject.lengthInMinutes) minute meeting")
                        
                        
                    }
                    .font(.caption)
                }
                .padding()
                
                
            }
            
        }
        
    }
    
    
}

struct SubjectView_Previews: PreviewProvider {
    static var subject = CurrentSchedule.sampleData[0]
    static var previews: some View {
        SubjectView1(subject: subject)
            
            
    }
}
