//
//  CallbackResultHandler.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 31/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

protocol CallbackResultHandler {
    func onResultSuccess() -> Void
    func onResultFailure() -> Void
}
