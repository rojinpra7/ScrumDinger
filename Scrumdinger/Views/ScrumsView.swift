//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/6/23.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack{
            List{
                ForEach($scrums) {$scrum in
                    NavigationLink(destination: DetailView(scrum: $scrum)){
                        CardView(scrum: scrum)
                            
                    }
                    .listRowBackground(scrum.theme.mainColor)
                    
                    
                }
            }
            .navigationTitle("Daily Scrums")
            .toolbar{
                Button(action: {
                    isPresentingNewScrumView = true
                }){
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
            .sheet(isPresented: $isPresentingNewScrumView){
                NewScrumSheet(isPresentingNewScrumView: $isPresentingNewScrumView, scrums: $scrums )
            }
            .onChange(of: scenePhase) { phase in
                if phase == .inactive {
                    saveAction()
                }
            }
        }
       
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View { 
        NavigationView{
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
        }
        
    }
}
