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
    
    
    func subscribe<T>(key: String, callback: @escaping (T) -> Void) -> AnyCancellable {
        guard let currentState = state[key] else {
            let entry = StateEntry<T>()
            state[key] = entry
            return entry.subscribe(callback: callback)
        }
        
        let castedCurrentState = currentState as! StateEntry<T>
        return castedCurrentState.subscribe(callback: callback)
    }
    
    func subscribeToLast<T>(key: String, callback: @escaping (T?) -> Void) -> AnyCancellable {
        guard let currentState = state[key] else {
            let entry = LatestStateEntry<T>()
            state[key] = entry
            return entry.subscribe(callback: callback)
        }
        
        let castedCurrentState = currentState as! LatestStateEntry<T>
        return castedCurrentState.subscribe(callback: callback)
    }
    
    func publish<T>(key: String, payload: T) {
        guard let currentState = state[key] else {
            let entry = StateEntry<T>()
            state[key] = entry
            entry.publish(data: payload)
            return
        }
        
        let castedCurrentState = currentState as! StateEntry<T>
        castedCurrentState.publish(data: payload)
    }
    
    func publishToLast<T>(key: String, payload: T) {
        guard let currentState = state[key] else {
            let entry = LatestStateEntry<T>()
            state[key] = entry
            entry.publish(data: payload)
            return
        }
            
        let castedCurrentState = currentState as! LatestStateEntry<T>
        castedCurrentState.publish(data: payload)
    }
    
    
    private init() { }
}
