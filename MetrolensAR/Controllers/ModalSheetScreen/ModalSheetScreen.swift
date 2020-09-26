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
    @Binding var data: Card
    @State var isLiked: Bool
    @Environment(\.presentationMode) var presentationMode

    
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
    
             
                VStack {
                    HStack(spacing: 36) {
                        SmallAction(action: {
                            self.presentationMode.wrappedValue.dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                MemStorage.shareLocation(id: self.data.id)
                            }
                        }, isPressed: false, icon: "square.and.arrow.up", title: "Share")
                        SmallAction(action: {
                            withAnimation {
                                StateManager.manager.publish(key: CHART_SELECTED_EVENT, payload: self.data.id)
                            }
                        }, isPressed: false, icon: "chart.bar", title: "Stats")
                        SmallAction(action: {
                            self.data.isLiked = !self.data.isLiked
                            isLiked = self.data.isLiked
                            
                        }, isPressed: isLiked, icon: "heart", title: "Like ")
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
