//
//  GraphQL.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 29/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://172.104.235.192/graphql")!)
}

class GraphQLService {
    static func fetchLocationById(id: Int, index: Int, callbackDelegate: CallbackResultHandler) {
        Network.shared.apollo.fetch(query: LocationByIdQuery(id: id)) { result in
            switch result {
            case .success(let graphQLResult):
                guard let data = graphQLResult.data else {
                    callbackDelegate.onResultFailure()
                    return
                }
                guard let location = data.location else {
                    callbackDelegate.onResultFailure()
                    return
                }
              
                MemStorage.locations[index].entryFee = location.entryFee
                MemStorage.locations[index].busyHours = location.busyHours
                MemStorage.locations[index].articleBodyImage = URL(string: location.articleBodyImage)
                MemStorage.locations[index].lastBody = location.lastBody
                callbackDelegate.onResultSuccess()
                
            case .failure(let error):
              callbackDelegate.onResultFailure()
              print("Failure! Error: \(error)")
            }
        }
    }
    
    
    static func fetchLocationList(callbackDelegate: CallbackResultHandler) {
        Network.shared.apollo.fetch(query: LocationListQuery(latitude: 3.21, longitude: 5.29)) { result in
          switch result {
          case .success(let graphQLResult):
            guard let data = graphQLResult.data else {
                callbackDelegate.onResultFailure()
                return
            }
            guard let locations = data.locations else {
                callbackDelegate.onResultFailure()
                return
            }
            
            for rawEntry in locations {
                guard let entry = rawEntry, let featuredImage = URL(string: entry.featuredImage) else {
                    continue
                }
                                
                
                let newEntry = LocationEntry(
                    id: entry.id,
                    name: entry.name,
                    coordinates: parseCoordinates(str: entry.coordinates),
                    featuredImage: featuredImage,
                    firstBody: entry.firstBody,
                    type: entry.type.rawValue
                )
                MemStorage.locations.append(newEntry)
            }
            callbackDelegate.onResultSuccess()
            
          case .failure(let error):
            callbackDelegate.onResultFailure()
            print("Failure! Error: \(error)")
          }
        }
    }
}


