//
//  Location.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 31/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import MapKit

struct LocationEntry {
    let id: String
    let name: String
    let coordinates: CLLocationCoordinate2D
    let featuredImage: URL
    let firstBody: String
    let type: String
}
