import SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "map", title: NavigationLocation.Map.name(), color: .purple),
    BottomBarItem(icon: "house", title: NavigationLocation.Discover.name(), color: .orange),
    BottomBarItem(icon: "heart", title: NavigationLocation.Likes.name(), color: .pink),
    BottomBarItem(icon: "person", title: NavigationLocation.Profile.name(), color: .blue)
]


struct ContentView : View {
    @State private var selectedIndex: Int = 0

    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ContentPicker(which: NavigationLocation(rawValue: selectedItem.title) ?? NavigationLocation.Map)
                    
                    BottomBar(selectedIndex: $selectedIndex, items: items).background(Color.white)
                }
                GeometryReader {  geometry in
                    VStack {
                        Spacer()
                        Rectangle()
                        .fill(Color.white)
                        .frame(height: geometry.safeAreaInsets.bottom)
                    }.edgesIgnoringSafeArea(.bottom)
                }
            }
        }
    }
}

struct NavControl_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
