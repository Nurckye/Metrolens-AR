//
//  PersistentStateEntry.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 23/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import Combine

class LatestStateEntry<T>: Subscribable {
    private var subscribers: [AnyCancellable]?
    private let currentValueSubject = CurrentValueSubject<T?, Never>(nil)

    func subscribe(callback: @escaping (T?) -> Void) -> AnyCancellable {
        let subscriber = currentValueSubject.sink(receiveValue: { value in
            callback(value)
        })
        subscribers?.append(subscriber)
        return subscriber
    }
    
    func publish(data: T) {
        currentValueSubject.send(data)
    }
}

