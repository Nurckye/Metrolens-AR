//
//  Memstore.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 31/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//
import MapKit

class MemStorage {
    static var locations = Array<LocationEntry>()
    static var currentUserLocation: CLLocationCoordinate2D? = nil
    
    
    static func getLocationById(id: String) -> LocationEntry {
        var curr: LocationEntry = locations[0]
        for location in locations {
            if location.id == id {
                print(location)
                print(location)
                print(location)
                print(location)
                curr = location
//                return location
            }
        }
        return curr
    }
}
