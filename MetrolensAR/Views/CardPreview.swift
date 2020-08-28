import SwiftUI

struct CardPreview: View {
    static let screenWidth = UIScreen.main.bounds.size.width

    let img = UIImage(named: "intercontinental")!
    
    var body: some View {
        VStack {
            Image(uiImage: img).resizable()
            HStack {
                VStack(alignment: .leading) {
                    Text("Intercontinental").font(.headline)
                    Text("General magheru 28").font(.subheadline).foregroundColor(Color.gray)
                }
                Spacer()
                HStack {
                    Text("25 m").font(.headline)
                    Image(systemName: "location")
                }
            }.padding(.leading).padding(.trailing)
        }.frame(minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 300,
                alignment: .topLeading
            ).cornerRadius(25)
    }
}

struct CardPreview_Previews: PreviewProvider {
    static var previews: some View {
        CardPreview()
    }
}
