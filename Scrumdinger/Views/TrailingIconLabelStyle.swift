//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by Rojin Prajapati on 4/6/23.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
    
}

extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon: Self {Self()}
}
