//
//  userDistance.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 05/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import MapKit

func getUserDistance(from point: CLLocationCoordinate2D) -> Double {
    let userLocation = CLLocation(
        latitude: LocationService.currentLocation.coordinates.latitude,
        longitude: LocationService.currentLocation.coordinates.longitude
    )
   
    let pointLocation = CLLocation(
        latitude:  point.latitude,
        longitude: point.longitude
    )
    return userLocation.distance(from: pointLocation)
}
