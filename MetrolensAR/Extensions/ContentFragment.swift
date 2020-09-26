//
//  ContentFragment.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 07/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import URLImage
import Pages


 
struct ContentFragment: View {
    var topText: String
    var bottomText: String
    var imageUrl: URL
    
    let itemWidth: CGFloat = UIScreen.main.bounds.width
    let itemHeight: CGFloat = 280
    let numberOfItems = 3

    @State var index: Int = 0
    @State var currentPage: Int = 0

    
    var body: some View {
        VStack {
            Text(topText)
            ImageWithCaption(
                imageUrl: imageUrl,
                title: "Another view:"
            ).padding(.top).padding(.bottom).frame(maxHeight: 300)
            
            Text(bottomText)
        }.padding()
    }
}

struct ContentFragment_Previews: PreviewProvider {
    static var previews: some View {
        ContentFragment(
            topText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dui velit, semper molestie consequat sed, tristique et nisi. In quis leo ornare, fermentum orci id, mattis felis. Duis placerat id neque et commodo. Nunc accumsan, diam sed tincidunt ultrices, libero ante euismod ipsum, non porta est massa non odio. Ut elementum vel nibh eu faucibus. Nunc faucibus sit amet leo at posuere. Donec pulvinar laoreet venenatis. Sed diam enim, congue sagittis ante nec, viverra vulputate massa. Duis posuere, arcu in luctus euismod, elit purus congue mi, sed pharetra nibh purus a ipsum. Nam sagittis augue tempor dui venenatis luctus. Aenean in ex nibh. Integer eu sem in augue mollis fermentum. Pellentesque dictum scelerisque porttitor. Duis id metus lectus. Fusce sollicitudin dignissim purus, id blandit lacus iaculis at. Integer aliquet tortor elit, id sagittis nisl tincidunt ut.",
            bottomText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse dui velit, semper molestie consequat sed, tristique et nisi. In quis leo ornare, fermentum orci id, mattis felis. Duis placerat id neque et commodo. Nunc accumsan, diam sed tincidunt ultrices, libero ante euismod ipsum, non porta est massa non odio. Ut elementum vel nibh eu faucibus. Nunc faucibus sit amet leo at posuere. Donec pulvinar laoreet venenatis. Sed diam enim, congue sagittis ante nec, viverra vulputate massa. Duis posuere, arcu in luctus euismod, elit purus congue mi, sed pharetra nibh purus a ipsum. Nam sagittis augue tempor dui venenatis luctus. Aenean in ex nibh. Integer eu sem in augue mollis fermentum. Pellentesque dictum scelerisque porttitor. Duis id metus lectus. Fusce sollicitudin dignissim purus, id blandit lacus iaculis at. Integer aliquet tortor elit, id sagittis nisl tincidunt ut.",
            imageUrl: URL(string: "https://images.unsplash.com/photo-1554435493-93422e8220c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2776&q=80")!
        )
    }
}
