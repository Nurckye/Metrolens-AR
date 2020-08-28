//
//  Card.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 22/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

struct Card : Identifiable {
    var id : Int
    var image : String
    var title : String
    var details : String
    var expand : Bool
}
