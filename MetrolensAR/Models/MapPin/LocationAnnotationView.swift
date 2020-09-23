//
//  LandmarkAnnotation.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 23/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import MapKit

final class LocationAnnotationView: MKAnnotationView {
    var id: Int?
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

        frame = CGRect(x: 0, y: 0, width: 40, height: 50)
        centerOffset = CGPoint(x: 0, y: -frame.size.height / 2)

        canShowCallout = true
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
//        backgroundColor = .clear

//        let view = MapPinView()
//        addSubview(view)

//        view.frame = bounds
    }
}
