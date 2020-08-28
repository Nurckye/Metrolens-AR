//
//  LikesView.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 23/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct LikesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Friday, August 2020")
                        Text("Likes")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                CardPreview()
                CardPreview()
                CardPreview()
                CardPreview()
                CardPreview()
            }.padding()
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
    }
}
