//
//  ContentPicker.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 16/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct ContentPicker: View, CallbackResultHandler{
    func onResultSuccess() {
        print("YEY")
    }
    
    func onResultFailure() {
        print("NayNay")
    }
    
 
    var which: NavigationLocation
    
    var body: some View {
        ZStack {
            MapWrapper().isHidden(which != NavigationLocation.Map)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.top)
            
            DiscoverWrapper().isHidden(which != NavigationLocation.Discover)
            
            LikesView().isHidden(which != NavigationLocation.Likes)
        }
     
    }
}

struct ContentPicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentPicker(which: NavigationLocation.Map)
    }
}
