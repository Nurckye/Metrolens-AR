//
//  StateManager.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 22/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import Combine

class StateManager {
    let passThroughSubject = PassthroughSubject<String, Error>()
    static let manager = StateManager()
    
    private init() { }
}
