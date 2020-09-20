// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// An enumeration.
public enum LocationModelType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Monument
  case monument
  /// Castle
  case castle
  /// Passage
  case passage
  /// Church
  case church
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "MONUMENT": self = .monument
      case "CASTLE": self = .castle
      case "PASSAGE": self = .passage
      case "CHURCH": self = .church
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .monument: return "MONUMENT"
      case .castle: return "CASTLE"
      case .passage: return "PASSAGE"
      case .church: return "CHURCH"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LocationModelType, rhs: LocationModelType) -> Bool {
    switch (lhs, rhs) {
      case (.monument, .monument): return true
      case (.castle, .castle): return true
      case (.passage, .passage): return true
      case (.church, .church): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [LocationModelType] {
    return [
      .monument,
      .castle,
      .passage,
      .church,
    ]
  }
}

public final class LocationByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LocationById($id: Int!) {
      location(id: $id) {
        __typename
        articleBodyImage
        lastBody
        entryFee
        busyHours
      }
    }
    """

  public let operationName: String = "LocationById"

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("location", arguments: ["id": GraphQLVariable("id")], type: .object(Location.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(location: Location? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
    }

    public var location: Location? {
      get {
        return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "location")
      }
    }

    public struct Location: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Location"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("articleBodyImage", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastBody", type: .nonNull(.scalar(String.self))),
          GraphQLField("entryFee", type: .scalar(Int.self)),
          GraphQLField("busyHours", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(articleBodyImage: String, lastBody: String, entryFee: Int? = nil, busyHours: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "Location", "articleBodyImage": articleBodyImage, "lastBody": lastBody, "entryFee": entryFee, "busyHours": busyHours])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var articleBodyImage: String {
        get {
          return resultMap["articleBodyImage"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "articleBodyImage")
        }
      }

      public var lastBody: String {
        get {
          return resultMap["lastBody"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastBody")
        }
      }

      public var entryFee: Int? {
        get {
          return resultMap["entryFee"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "entryFee")
        }
      }

      public var busyHours: Int? {
        get {
          return resultMap["busyHours"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "busyHours")
        }
      }
    }
  }
}

public final class LocationListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LocationList($latitude: Float!, $longitude: Float!) {
      locations(latitude: $latitude, longitude: $longitude) {
        __typename
        id
        name
        coordinates
        featuredImage
        firstBody
        type
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
        GraphQLField("locations", arguments: ["latitude": GraphQLVariable("latitude"), "longitude": GraphQLVariable("longitude")], type: .list(.object(Location.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(locations: [Location?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "locations": locations.flatMap { (value: [Location?]) -> [ResultMap?] in value.map { (value: Location?) -> ResultMap? in value.flatMap { (value: Location) -> ResultMap in value.resultMap } } }])
    }

    public var locations: [Location?]? {
      get {
        return (resultMap["locations"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Location?] in value.map { (value: ResultMap?) -> Location? in value.flatMap { (value: ResultMap) -> Location in Location(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [Location?]) -> [ResultMap?] in value.map { (value: Location?) -> ResultMap? in value.flatMap { (value: Location) -> ResultMap in value.resultMap } } }, forKey: "locations")
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
          GraphQLField("type", type: .nonNull(.scalar(LocationModelType.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, coordinates: String, featuredImage: String, firstBody: String, type: LocationModelType) {
        self.init(unsafeResultMap: ["__typename": "Location", "id": id, "name": name, "coordinates": coordinates, "featuredImage": featuredImage, "firstBody": firstBody, "type": type])
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

      public var type: LocationModelType {
        get {
          return resultMap["type"]! as! LocationModelType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}
