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


struct SheetView: View {
    @Binding var isCamera: Bool
    @Binding var data: Card
    @State var subscriber: AnyCancellable?

    
    var body: some View {
        return VStack {
            if self.isCamera {
                CameraARView()
//                Text("SALLLUT")
                
            } else {
                ModalSheetScreen(data: $data)
                    .transition(.asymmetric(
                                    insertion: AnyTransition.move(edge: .leading),
                                    removal: AnyTransition.move(edge: .trailing))
                    )
                    .animation(.easeIn)
            }
        }.onAppear {
            subscriber = StateManager.manager.subscribe(key: MAP_SHEET_CHANGE_VIEW) { (value: Bool) in
                isCamera = value
            }
        }
    }
    
}

struct MapWrapper: View {
    @Environment(\.colorScheme) var colorScheme
    @State var data: Card = {
        var locationData = MemStorage.locations[0]
        return Card(
            id: locationData.id,
            image: locationData.featuredImage,
            title: locationData.name,
            details: locationData.firstBody,
            type: locationData.type,
            expand: true)
    }()
    
    @State var showingDetail = false
    @State var subscriber: AnyCancellable?
    @State var isCamera = true
    
    let buttonBackgroundLight = UIColor(red: 0.937, green: 0.863, blue: 0.973, alpha: 1)
    let buttonBackgroundDark = UIColor(red: 0.15, green: 0.07, blue: 0.19, alpha: 1.00)
    static func computeButtonHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height - (UIDevice.current.hasNotch ? 180 : 140)
    }
    
    var body: some View {
        ZStack {
            MapView()
            Button(action: {
                isCamera = true
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
                SheetView(
                    isCamera: $isCamera,
                    data: $data
                )
            }
        }.onAppear {
            subscriber = StateManager.manager.subscribe(
                key: LOCATION_SELECTED_EVENT
            ) { (payload: PresentationInfo) in

                guard let id = payload.locationId else {
                    return
                }

                let locationData = MemStorage.getLocationById(id: id)

                data = Card(
                    id: locationData.id,
                    image: locationData.featuredImage,
                    title: locationData.name,
                    details: locationData.firstBody,
                    type: locationData.type,
                    expand: true)

                isCamera = payload.isCamera
                showingDetail = payload.isPresented
            }
        }
    }
}

struct MapWrapper_Previews: PreviewProvider {
    static var previews: some View {
        MapWrapper()
    }
}
