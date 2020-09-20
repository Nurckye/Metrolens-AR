//
//  Details.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 19/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import ActivityIndicatorView

struct Details: View, CallbackResultHandler {
    var id: Int
    @State var locationIndex = -1
    @State var loading = true

    func onResultSuccess() {
        loading = false
    }
    
    func onResultFailure() {
        loading = false // TODO: alerta??
    }
    
    
    func handleDataRequest() {
        let stringId = "\(id)"
        
        for ix in 0..<MemStorage.locations.count {
            if MemStorage.locations[ix].id == stringId {
                locationIndex = ix
                break
            }
        }
        
        if locationIndex == -1 {
            self.onResultFailure()
        } else {
            if MemStorage.locations[locationIndex].isComplete() {
                self.onResultSuccess()
            } else {
                GraphQLService.fetchLocationById(
                    id: id,
                    index: locationIndex,
                    callbackDelegate: self
                )
            }
        }
    }
    
    
    init(id: Int) {
        self.id = id


    }
    
    var body: some View {
        VStack {
            if (self.loading) {
                ActivityIndicatorView(isVisible: $loading,
                                      type: .scalingDots)
                     .frame(width: 50.0,
                            height: 50.0)
                    .foregroundColor(.gray).onAppear {
                        handleDataRequest()
                    }
            } else {
                ContentFragment(
                    topText: MemStorage.locations[locationIndex].firstBody,
                    bottomText: MemStorage.locations[locationIndex].lastBody!,
                    imageUrl: MemStorage.locations[locationIndex].articleBodyImage!)
            }
        }
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details(id: 4)
    }
}
