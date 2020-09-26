//
//  decodeBusyHours.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 26/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

func decodeBusyHours(value: Int) -> [Double]{
    var result = [Double]()
    var temp = value
    for _ in 0..<7 {
        temp /= 10
        result.append(Double(temp % 10))
    }
    
    return result
}

//func generateChartData(value: Int) -> [(Stri)
