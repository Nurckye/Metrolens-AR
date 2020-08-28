import SwiftUI

struct InitialScreen: View {
    @State var play = 0
    let img = UIImage(named: "applogo")!
    var body: some View {
        VStack {
            LottieView(name: "placeloader", play: $play)
                .frame(width: 400, height: 400)
            Image(uiImage: img)

        }.padding(.horizontal)

    }
}

struct LoaderWrap_Previews: PreviewProvider {
    static var previews: some View {
        InitialScreen()
    }
}
