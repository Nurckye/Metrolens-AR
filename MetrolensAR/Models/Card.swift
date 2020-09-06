//
//  Card.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 22/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

struct Card: Identifiable {
    var id: String
    var image: URL
    var title: String
    var details: String
    var type: String
    var expand: Bool
    
    var isLiked: Bool {
        get {
            return LikesManager.manager.isLiked(id: self.id)
        }
        set (newValue) {
            if newValue {
                LikesManager.manager.addLike(id: self.id)
            } else {
                LikesManager.manager.removeLike(id : self.id)
            }
        }
    }
}
