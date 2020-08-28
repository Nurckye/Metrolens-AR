enum NavigationLocation: String {
    case Map = "Map"
    case Discover = "Discover"
    case Likes = "Likes"
    case Search = "Search"
    case Profile = "Profile"
    
    func name() -> String {
        return self.rawValue
    }
}
