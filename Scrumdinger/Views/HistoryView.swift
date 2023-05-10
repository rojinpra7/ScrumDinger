//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 5/3/23.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Divider()
                    .font(.headline)
                
                Text("Attendees")
                    .font(.title)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
        
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map{$0.name})
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(attendees: [DailyScrum.Attendee(name: "Rojin"), DailyScrum.Attendee(name: "Rupak"), DailyScrum.Attendee(name: "Santosh")], transcript: "Hey I worked on this bug fix issues from yestarday.")
    }
    static var previews: some View {
        HistoryView(history: history)
    }
}
