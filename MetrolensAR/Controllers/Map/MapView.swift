//
//  MapView.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 16/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct MapView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MapViewController
    static let displayMap = MapViewController()
    
    func makeUIViewController(context: Context) -> MapViewController {
        return MapView.displayMap
    }

    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
