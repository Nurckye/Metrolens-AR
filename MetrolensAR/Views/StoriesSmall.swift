//
//  StoriesSmall.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 20/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import URLImage


struct StoriesSmall: View {
    var data: [Card]
    let size: CGFloat = 80
    @State var presentedIndex = 0
    @State var isPresented = false

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 24) {
                Spacer()
                ForEach(0..<self.data.count) { i in
                    Button(action: {
                            presentedIndex = i
                            self.isPresented = true
                    }) {
                        URLImage(self.data[i].image) { proxy in
                            proxy.image.resizable().frame(width: size, height: size, alignment: .center)
                        }.cornerRadius(size / 2)
                    }.fullScreenCover(isPresented: $isPresented) {
                        StoriesModal(presentedIndex: $presentedIndex, data: data)
                    }
                }
            }
        }
    }
}

struct StoriesSmall_Previews: PreviewProvider {
    static var previews: some View {
        StoriesSmall(data: [])
    }
}
