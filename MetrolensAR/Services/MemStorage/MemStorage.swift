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
                curr = location
            }
        }
        return curr
    }
    
    static func shareLocation(id: String) {
        let location = getLocationById(id: id)
        let message = "Hey, I think you should check out \(location.name). You can find out more about it on Metrolens"
        let activityView = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil)
    }
}
