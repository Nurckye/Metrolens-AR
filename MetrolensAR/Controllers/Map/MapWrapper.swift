//
//  MapWrapper.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 17/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import Combine
import UIKit

struct MapWrapper: View {
    @Environment(\.colorScheme) var colorScheme
    @State var showingDetail = false
    let publisher = Just(1)

    
    let buttonBackgroundLight = UIColor(red: 0.937, green: 0.863, blue: 0.973, alpha: 1)
    let buttonBackgroundDark = UIColor(red: 0.15, green: 0.07, blue: 0.19, alpha: 1.00)
    static func computeButtonHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height - (UIDevice.current.hasNotch ? 180 : 120)
    }
    
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
            }
            .padding(24)
            .background(Color(colorScheme == .dark ? buttonBackgroundDark : buttonBackgroundLight))
            .foregroundColor(.purple)
            .cornerRadius(20)
            .position(
                x: UIScreen.main.bounds.size.width - 72,
                y: MapWrapper.computeButtonHeight())
            .sheet(isPresented: $showingDetail) {
                CameraARView()
            } 
        }
    }
}

struct MapWrapper_Previews: PreviewProvider {
    static var previews: some View {
        MapWrapper()
    }
}
