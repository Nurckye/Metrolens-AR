//
//  ModalSheetScreen.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 23/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import URLImage


struct ModalSheetScreen: View {
    @State var isChart = false
    @Binding var data: Card
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack {
                        URLImage(self.data.image) { proxy in
                            proxy.image.resizable().frame(height: 300)
                        }
                        .frame(height: 300)
                        
                        HStack {
                           VStack(alignment: .leading) {
                            Text(self.data.title).font(.headline)
                            Text(self.data.type.capitalizingFirstLetter()).font(.subheadline).foregroundColor(Color.gray)
                           }
                           Spacer()
                           HStack {
                               Text("25 m").font(.headline)
                               Image(systemName: "location")
                           }
                       }.padding(.leading).padding(.trailing)
                    }
                    
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                            StateManager.manager.publish(key: MAP_SHEET_CHANGE_VIEW, payload: true)
                        }
                    }) {
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .clipShape(Circle())

                    }
                    .offset(
                        x: 40 - (UIScreen.main.bounds.width / 2),
                        y: 16 - 150)
                }
    
                // lista de like navigate stats
             
                VStack {
                    HStack(spacing: 32) {
                        SmallAction(action: {}, isPressed: false, icon: "location", title: "Locate")
                        SmallAction(action: {
                            withAnimation { self.isChart = true }
                        }, isPressed: false, icon: "chart.bar", title: "Stats")
                        SmallAction(action: {
                            self.data.isLiked = !self.data.isLiked
                        }, isPressed: self.data.isLiked, icon: "heart", title: "Like ")
                    }.padding()
                    Details(id: Int(self.data.id) ?? -1)
                }
            
            }.contentShape(Rectangle())
                    
        }
    }
}

//struct ModalSheetScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        ModalSheetScreen()
//    }
//}
