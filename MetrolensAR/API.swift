// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LocationListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LocationList($latitude: Float!, $longitude: Float!) {
      location(latitude: $latitude, longitude: $longitude) {
        __typename
        id
        name
        coordinates
        featuredImage
        firstBody
      }
    }
    """

  public let operationName: String = "LocationList"

  public var latitude: Double
  public var longitude: Double

  public init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }

  public var variables: GraphQLMap? {
    return ["latitude": latitude, "longitude": longitude]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("location", arguments: ["latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude")], type: .list(.object(Location.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(location: [Location?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "location": location.flatMap { (value: [Location?]) -> [ResultMap?] in value.map { (value: Location?) -> ResultMap? in value.flatMap { (value: Location) -> ResultMap in value.resultMap } } }])
    }

    public var location: [Location?]? {
      get {
        return (resultMap["location"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Location?] in value.map { (value: ResultMap?) -> Location? in value.flatMap { (value: ResultMap) -> Location in Location(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Location?]) -> [ResultMap?] in value.map { (value: Location?) -> ResultMap? in value.flatMap { (value: Location) -> ResultMap in value.resultMap } } }, forKey: "location")
      }
    }

    public struct Location: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Location"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("coordinates", type: .nonNull(.scalar(String.self))),
          GraphQLField("featuredImage", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstBody", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, coordinates: String, featuredImage: String, firstBody: String) {
        self.init(unsafeResultMap: ["__typename": "Location", "id": id, "name": name, "coordinates": coordinates, "featuredImage": featuredImage, "firstBody": firstBody])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// Coordinates as string
      public var coordinates: String {
        get {
          return resultMap["coordinates"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "coordinates")
        }
      }

      public var featuredImage: String {
        get {
          return resultMap["featuredImage"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "featuredImage")
        }
      }

      public var firstBody: String {
        get {
          return resultMap["firstBody"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstBody")
        }
      }
    }
  }
}
