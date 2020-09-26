//
//  StoriesModal.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 21/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import URLImage
import Pages

struct StoriesModal: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var presentedIndex: Int
    @State var currentPage = 0
    var data: [Card]
    
    var body: some View {
    
        VStack {
            ModelPages(data, currentPage: $currentPage) { pageIndex, item in
                ZStack {
                    URLImage(item.image) { proxy in
                        proxy.image
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .clipped()
                            .edgesIgnoringSafeArea(.all)
                            .blur(radius: 20)
                    }
                    URLImage(item.image) { proxy in
                        proxy.image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipped()
                            .edgesIgnoringSafeArea(.all)
                            .cornerRadius(16)
                            .padding()
                    }
                    VStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text(item.title).font(Font.largeTitle.weight(.bold)).foregroundColor(Color.white)
                                Spacer()
                            }
                            HStack {
                                Text(item.type.capitalizingFirstLetter()).font(.headline).foregroundColor(Color.white)
                                Spacer()
                            }
                        }
                    }.padding().padding(.bottom, 30)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
              presentationMode.wrappedValue.dismiss()
        }
      }
}

//struct StoriesModal_Previews: PreviewProvider {
//    static var previews: some View {
//        StoriesModal()
//    }
//}
