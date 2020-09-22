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
    private var state: [String: Any] = [:]
    static let manager = StateManager()
    
    
    func subscribe<T>(key: String, callback: @escaping (T) -> Void) -> AnyCancellable{
        guard let currentState = state[key] else {
            let entry = StateEntry<T>()
            state[key] = entry
            return entry.subscribe(callback: callback)
        }
        
        let castedCurrentState = currentState as! StateEntry<T>
        return castedCurrentState.subscribe(callback: callback)
    }
    
    func publish<T>(key: String, newState: T) {
        guard let currentState = state[key] else {
            let entry = StateEntry<T>()
            state[key] = entry
            entry.publish(data: newState)
            return
        }
        
        let castedCurrentState = currentState as! StateEntry<T>
        castedCurrentState.publish(data: newState)
    }
    
    private init() { }
}
