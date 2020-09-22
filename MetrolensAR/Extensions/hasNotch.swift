//
//  hasNotch.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 21/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}
