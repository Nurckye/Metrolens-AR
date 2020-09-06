//
//  SwiftUIView.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 06/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import URLImage

struct LoadingImageView: View {
    var url: URL
    var body: some View {
        URLImage(url)
    }
}

//struct LoadingImageView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoadingImageView(url: URL( "https://img.freepik.com/free-vector/shining-circle-purple-lighting-isolated-dark-background_1441-2396.jpg?size=626&ext=jpg"))
//    }
//}
