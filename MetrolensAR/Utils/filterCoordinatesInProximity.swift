//
//  filterCoordinatesInProximity.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 05/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import MapKit

func filterCoordinatesInProximity(
    locations: Array<LocationEntry>) -> Array<LocationEntry> {
    return locations.filter {
        getUserDistance(from: $0.coordinates) < 300
    }
}
