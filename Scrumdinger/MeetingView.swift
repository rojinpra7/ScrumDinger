//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/5/23.
//

import SwiftUI

struct MeetingView: View {
    @StateObject var scrumTimer = ScrumTimer()
    @Binding var scrum: DailyScrum
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16.0).fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                HStack{
                    Text("Speaker 1 of 5")
                    Spacer()
                    Button(action: {}){
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
            
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        
       
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
