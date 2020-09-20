//
//  dateUtils.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 12/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

func getCurrentDateFormatted() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, dd MMMM yyyy"
    return dateFormatter.string(from: Date())
}
