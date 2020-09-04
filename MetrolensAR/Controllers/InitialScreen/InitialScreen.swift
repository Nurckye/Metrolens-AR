import SwiftUI

struct InitialScreen: View, CallbackResultHandler {
    let locationServiceSingleton = LocationService.shared
    
    func onResultSuccess() {
        self.loaded = true
    }
    
    func onResultFailure() {
        print("FAILLLLL")
    }
    
    @State var loaded = false
    var body: some View {
        if (!self.loaded) {
            return AnyView(VStack {
                Text("LOADING...")
    //            LottieView(name: "placeloader", play: $play)
    //                .frame(width: 400, height: 400)
            }.padding(.horizontal).onAppear {
                GraphQLService.fetchLocationList(callbackDelegate: self)
            })
        } else {
            return AnyView(ContentView())
        }
    }
}

struct LoaderWrap_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreen()
    }
}
