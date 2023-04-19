//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/10/23.
//

import SwiftUI

struct DetailEditView: View{
    @Binding var data : DailyScrum.Data
    @State private var newAttendeeName = ""
    
    var body: some View{
        Form{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $data.title)
                HStack{
                    Slider(value: $data.lengthInMinutes){
                        Text("Length")
                    }.accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes").accessibilityHidden(true)
                }
            }
            ThemePicker(selection: $data.theme)
            
            Section(header: Text("Attendees")){
                ForEach(data.attendees){ attende in
                    Text(attende.name)
                }
                .onDelete{ indices in
                    data.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendeeName)
                    Button(action: {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName
                            )
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill").accessibilityLabel("")
                    }.disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider{
    static var previews: some View {
        DetailEditView(data: .constant(DailyScrum.sampleData[0].data))
    }
}
