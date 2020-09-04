//
//  LocationService.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 05/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import MapKit

@objc class CurrentLocationData: NSObject {
    @objc dynamic var coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    func updateDate(newCoordinates: CLLocationCoordinate2D) {
        coordinates = newCoordinates
    }
}

class CurrentLocationObserver: NSObject {
    @objc var objectToObserve: CurrentLocationData
    var observation: NSKeyValueObservation?
    
    init(object: CurrentLocationData, callback: @escaping (CLLocationCoordinate2D) -> Void) {
        objectToObserve = object
        super.init()
        
        observation = observe(
            \.objectToObserve.coordinates,
            options: [.old, .new]
        ) { object, change in
            callback(object.objectToObserve.coordinates)
        }
    }
}

class LocationService: NSObject, CLLocationManagerDelegate {
    static let currentLocation = CurrentLocationData()
    
    static var shared = LocationService()
    let locationManager = CLLocationManager()

    private override init() {
        super.init()
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            locationManager.showsBackgroundLocationIndicator = true
        }
    }

    func addObserver(callback: @escaping (CLLocationCoordinate2D) -> Void) -> CurrentLocationObserver {
        return CurrentLocationObserver(object: LocationService.currentLocation, callback: callback)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        LocationService.currentLocation.coordinates = locValue
    }
}
