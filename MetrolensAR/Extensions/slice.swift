//
//  slice.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 01/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
extension String {
func slice(from: String, to: String) -> String? {

    return (range(of: from)?.upperBound).flatMap { substringFrom in
        (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
            substring(with: substringFrom..<substringTo)
        }
    }
}
}
