//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/24/23.
//

import SwiftUI

struct NewScrumSheet: View {
    
    @State private var newScrum = DailyScrum.emptyScrum
    
    @Binding var isPresentingNewScrumView: Bool
    @Binding var scrums: [DailyScrum]
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack{
                DetailEditView(data: $newScrum)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Dismiss"){
                                isPresentingNewScrumView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Add"){
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                            }
                        }
                    }
            }
        } else {
            // Fallback on earlier versions
            NavigationView{
                DetailEditView(data: $newScrum)
            }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(isPresentingNewScrumView: .constant(true), scrums: .constant(DailyScrum.sampleData))
    }
}
