//
//  SightSector.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 05/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

class SightSector<T> {
    var degreesSightTrack: [Int: T] = [:]
    private let step = 20
    
    func addValue<T>(degrees: Int, value: T) {
        if degrees < 0 || degrees > 360 { return }
        self.degreesSightTrack[Int(degrees / step) * step] = value as? T {
            set {

            }
        }
    }
    
    func getValues() -> Array<T> {
        var values = Array<T>()
        for (_, value) in degreesSightTrack {
            values.append(value)
        }
        return values
    }
}
