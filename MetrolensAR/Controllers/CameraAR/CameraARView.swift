//
//  MapView.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 16/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct CameraARView: UIViewControllerRepresentable {
    typealias UIViewControllerType = CameraARViewController 
    
    func makeUIViewController(context: Context) -> CameraARViewController {
        return CameraARViewController()
    }

    func updateUIViewController(_ uiViewController: CameraARViewController, context: Context) {
    }
}

struct CameraARView_Previews: PreviewProvider {
    static var previews: some View {
        CameraARView()
    }
}
