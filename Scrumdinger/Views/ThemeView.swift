//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/11/23.
//

import SwiftUI


struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 4).fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .foregroundColor(theme.accentColor)
                .padding(4)
                
        }
        .fixedSize(horizontal:false, vertical: true)
        
    }
}

struct ThemeView_Previews: PreviewProvider{
    static var previews: some View{
        ThemeView(theme: .buttercup)
    }
}
