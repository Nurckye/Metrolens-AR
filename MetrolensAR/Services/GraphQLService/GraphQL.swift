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
    
  private(set) lazy var apollo = ApolloClient(url: URL(string: "http://192.168.100.37:8000/graphql")!)
}

class GraphQLService {
    static func fetchLocationList(callbackDelegate: CallbackResultHandler) {
        Network.shared.apollo.fetch(query: LocationListQuery(latitude: 3.21, longitude: 5.29)) { result in
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
            
            for rawEntry in location {
                guard let entry = rawEntry, let featuredImage = URL(string: entry.featuredImage) else {
                    continue
                }
                
                print(entry.coordinates)
                
                
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


