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
}
