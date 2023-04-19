//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/5/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ScrumsView(scrums: $scrums)
            }
           
        }
    }
}
