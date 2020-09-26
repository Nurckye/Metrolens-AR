//
//  SmallAction.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 27/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct SmallAction: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> Void
    var isPressed: Bool
    var icon: String
    var title: String
    
    
    var body: some View {
        let computedIconName = self.isPressed ? (self.icon + ".fill") : self.icon
        let generalColor = colorScheme == .dark ? Color.white : Color.black
        let computedColor = self.isPressed ? Color.red : generalColor
        
        
        return Button(action: {
            self.action()
        }) {
            HStack {
                Image(systemName: computedIconName).foregroundColor(computedColor).font(.footnote)
                Text(self.title).font(.footnote)
            }.padding(12).overlay(
                RoundedRectangle(cornerRadius: 20)
                .stroke(lineWidth: 1)
            )
        }
        .foregroundColor(generalColor)
        .frame(maxWidth: 80)
    }
}

struct SmallAction_Previews: PreviewProvider {
    static var previews: some View {
        SmallAction(action: {}, isPressed: true, icon: "heart", title: "hello")
    }
}
