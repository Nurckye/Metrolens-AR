import SwiftUI
import URLImage


struct DiscoverView : View {
    @Binding var isChart: Bool
    @Binding var data: [Card]
    @State var shouldScroll: Bool = true
    @State var hero = false
    var title: String
    
    static func getLocationsToDisplay(showLikes: Bool) -> [Card] {
        var data = Array<LocationEntry>()
        if (!showLikes) {
            data = MemStorage.locations
        } else {
            data = MemStorage.locations.filter { location in
                return LikesManager.manager.isLiked(id: location.id)
            }
        }
        
        return data.map { location in
            return Card(
                id: location.id,
                image: location.featuredImage,
                title: location.name,
                details: location.firstBody,
                type: location.type,
                expand: false
            )
        }
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollViewReader { sValue in
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(getCurrentDateFormatted())
                                Text(self.title)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                            }.opacity(hero ? 0 : 1)
                            Spacer()
                            Image("pic")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Capsule())
                        }
                        .padding()
                        StoriesSmall(data: data).padding(.bottom, 32).opacity(hero ? 0 : 1) 
                        VStack(spacing: 65) {
                            ForEach(0..<self.data.count) { i in
                                
                                    GeometryReader { g in
                                        CardView(data: self.$data[i], hero: self.$hero, isChart: self.$isChart)
                                            .offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0) // se duce la 0 (adica sus) cand e expanded
                                            .opacity(self.hero ? (self.data[i].expand ? 1 : 0) : 1)
                                            .onTapGesture {
                                                withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                                if !self.data[i].expand {
                                                    self.hero.toggle()
                                                    self.data[i].expand.toggle()
                                                }
                                            }
                                        }
                                    }
                                    .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : 300)
                            }
                        }
                    }
                }
            }
        }
    }
}



struct CardView: View {
    @Binding var data: Card
    @Binding var hero: Bool
    @Binding var isChart: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView(.vertical, showsIndicators: false) {
                ZStack {
                    VStack {
                        URLImage(self.data.image) { proxy in
                            proxy.image.resizable()
                        }
                        .frame(height: self.data.expand ? 300 : 250)
                        
                        HStack {
                           VStack(alignment: .leading) {
                            Text(self.data.title).font(.headline)
                            Text(self.data.type.capitalizingFirstLetter()).font(.subheadline).foregroundColor(Color.gray)
                           }
                           Spacer()
                           HStack {
                               Text("25 m").font(.headline)
                               Image(systemName: "location")
                           }
                       }.padding(.leading).padding(.trailing)
                    }.cornerRadius(self.data.expand ? 0 : 25)
                }
    
                // lista de like navigate stats
                if self.data.expand {
                    VStack {
                        HStack(spacing: 32) {
                            SmallAction(action: {}, isPressed: false, icon: "location", title: "Locate")
                            SmallAction(action: {
                                withAnimation { self.isChart = true }
                            }, isPressed: false, icon: "chart.bar", title: "Stats")
                            SmallAction(action: {
                                self.data.isLiked = !self.data.isLiked
                            }, isPressed: self.data.isLiked, icon: "heart", title: "Like ")
                        }.padding()
                        Details(id: Int(self.data.id) ?? -1)
                    }
                }
            }
            .padding(.horizontal, self.data.expand ? 0 : 20).contentShape(Rectangle())
            
            // butonul cu x facut de mine
            if self.data.expand {
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                        self.data.expand.toggle()
                        self.hero.toggle()
                    }
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.4))
                        .clipShape(Circle())
                    
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding(.trailing,10)
            }
        }
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
