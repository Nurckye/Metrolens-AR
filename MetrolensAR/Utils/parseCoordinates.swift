//
//  parseCoordinates.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 31/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import MapKit

func parseCoordinates(str: String) -> CLLocationCoordinate2D {
    guard let result = str.slice(from:"(", to:")")?.components(separatedBy: " ") else {
        return CLLocationCoordinate2D(latitude: 0, longitude: 0)
    }
    
    guard
        let latitude = Double(result[1]),
        let longitude = Double(result[0]) else { return CLLocationCoordinate2D(latitude: 0, longitude: 0)}
    print("LAT:", latitude)
    print("LON:", longitude)

    return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
}
