//
//  MapWrapper.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 17/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct MapWrapper: View {
    @State var showingDetail = false
    let buttonBackground = UIColor(red: 0.937, green: 0.863, blue: 0.973, alpha: 1)
    var body: some View {
        ZStack {
            MapView()
            Button(action: {
                self.showingDetail = true
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "camera").font(.system(size: 24))
                    Text("AR").font(.custom("AvenirNext-MediumBold", size: 18))
                    }
            }.padding(20).background(Color(buttonBackground)).foregroundColor(.purple).cornerRadius(20)    .position(x: UIScreen.main.bounds.size.width - 60, y: UIScreen.main.bounds.size.height - 170).sheet(isPresented: $showingDetail) {
                CameraARView()
            }
        }.edgesIgnoringSafeArea(.top)
    }
}

struct MapWrapper_Previews: PreviewProvider {
    static var previews: some View {
        MapWrapper()
    }
}
