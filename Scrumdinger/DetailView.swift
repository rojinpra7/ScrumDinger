//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/7/23.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    
    var body: some View{
        List{
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView(scrum: $scrum)){
                    Label("Start Meeting", systemImage: "clock")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    
                }
                
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }.accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendes")){
                ForEach(scrum.attendees){ attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar{
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationView{
                DetailEditView(data: $editingScrum)
                    .navigationTitle("Edit")
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingEditView = false
                                scrum.update(from : data)
                            }
                        }
                    }
            }
            
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View{
        NavigationView{
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
