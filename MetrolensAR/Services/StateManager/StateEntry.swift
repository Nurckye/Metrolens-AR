//
//  LocationEntryState.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 23/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import Combine

//class StateSubscribe {
//    var subscriber: AnyCancellable?
//    
//    fun
//}

class StateEntry<T>: Subscribable {
    private var subscribers: [AnyCancellable]?
    private let passThroughSubject = PassthroughSubject<T, Never>()

    func subscribe(callback: @escaping (T) -> Void) -> AnyCancellable {
        let subscriber = passThroughSubject.sink(receiveValue: { value in
            callback(value)
        })
        subscribers?.append(subscriber)
        return subscriber
    }
    
    func publish(data: T) {
        passThroughSubject.send(data)
    }
}

