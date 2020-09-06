//
//  capitalizingFirstLetter.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 07/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}
