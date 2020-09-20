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
//            Pages(currentPage: $currentPage) {
//                ForEach(0..<self.data.count) { i in
//                    ZStack {
//                        URLImage(self.data[i].image) { proxy in
//                            proxy.image
//                                .resizable()
//                                .aspectRatio(contentMode: .fill)
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                        }
//                    }
//
//                }
//            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            ModelPages(data, currentPage: $currentPage) { pageIndex, item in
                URLImage(item.image) { proxy in
                    proxy.image
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.red)
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
