import SwiftUI

struct InitialScreen: View, CallbackResultHandler {
    let locationServiceSingleton = LocationService.shared
    @State var play = 0
    @State var showingPopup = false
    @State var loaded = false
    @State var ready = false

    @Environment(\.colorScheme) var colorScheme

    func onResultSuccess() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.loaded = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                self.ready = true
            }
//        }
    }
    
    func onResultFailure() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            showingPopup = true
        }
    }
    
    var body: some View {
        ZStack {
           
            if (self.loaded){
                if colorScheme == .dark {
                    Color.black.edgesIgnoringSafeArea(.all)
                } else {
                    Color.white.edgesIgnoringSafeArea(.all)
                }
                ContentView()
            }
            
            if (!self.ready) {
                VStack {
                    ZStack {
                        if colorScheme == .dark {
                            Color.black.edgesIgnoringSafeArea(.all).zIndex(0)
                        } else {
                            Color.white.edgesIgnoringSafeArea(.all).zIndex(0)

                        }
                            
                        VStack {
                            Spacer()
                            Text("© Radu Nitescu").foregroundColor(.gray).font(.caption)
                            Text("2020").foregroundColor(.gray).font(.caption)
                        }
                        .padding()
                        .zIndex(1)
                     
                        ZStack {
                            LottieView(
                                name: "loader",
                                play: $play
                            )
                            .padding(.bottom, 100)
                            
                            Image("applogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.top, 100)
                        }
                        .padding(.horizontal)
                        .onAppear {
                            GraphQLService.fetchLocationList(callbackDelegate: self)
                        }
                        .popup(isPresented: $showingPopup) {
                            AlertNotification() {
                                GraphQLService.fetchLocationList(callbackDelegate: self)
                            }
                            .cornerRadius(16)
                        }
                    }
                }
                .transition(.asymmetric(insertion: .opacity, removal: AnyTransition.move(edge: .bottom)))
                .animation(.easeIn)
                .zIndex(1)

            }
        }
    }
}

struct LoaderWrap_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreen()
    }
}
