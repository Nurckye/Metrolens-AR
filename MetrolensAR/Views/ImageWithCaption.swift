//
//  ImageWithCaption.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 19/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import URLImage

struct ImageWithCaption: View {
    var imageUrl: URL
    var title: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title).font(.callout).foregroundColor(.gray)
                Spacer()
            }
            URLImage(imageUrl, placeholder: {_ in
                Text("Loading")
            }) { proxy in
                proxy.image.resizable()
            }.cornerRadius(16)
        }
    }
}

struct ImageWithCaption_Previews: PreviewProvider {
    static var previews: some View {
        ImageWithCaption(
            imageUrl: URL(string: "https://cdn.peri.com/.imaging/l/dam/e013946d-4143-435a-9b5b-72b69f83fe10/744/consolidare-reabilitare-%C8%99i-amenaj%C4%83ri-palatul-culturii-%E2%80%93-ia%C8%99i-rom%C3%A2nia.jpg")!, title: "Palatul parlamentului Iasi"
        )
    }
}
