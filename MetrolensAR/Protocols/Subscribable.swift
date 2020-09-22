//
//  subscribable.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 23/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import Combine

protocol Subscribable {
    associatedtype T
    func subscribe(callback: @escaping (T) -> Void) -> AnyCancellable
}
