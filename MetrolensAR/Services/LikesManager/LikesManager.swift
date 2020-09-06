//
//  LikesManager.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 06/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation

class LikesManager {
    static let manager = LikesManager()
    fileprivate static var cachedLikes: Set<String>? = nil
    
    private init() { }
    
    var likes: Set<String> {
        get {
            if let res = LikesManager.cachedLikes { return res }
            let userDefaults = UserDefaults.standard
            let udef = userDefaults.object(forKey: "likes") as? [String] ?? [String]()
            LikesManager.cachedLikes = Set(udef)
            return LikesManager.cachedLikes!
        }
        set(newValue) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(Array(newValue), forKey: "likes")
            LikesManager.cachedLikes = nil
        }
    }
    
    func addLike(id: String) {
        var likesSet = self.likes
        likesSet.insert(id)
        self.likes = likesSet
    }
    
    func removeLike(id: String) {
        var likesSet = self.likes
        
        if likesSet.remove(id) != nil {
            self.likes = likesSet
        }
    }
    
    func isLiked(id: String) -> Bool {
        print(self.likes.contains(id))
        return self.likes.contains(id)
    }
}
