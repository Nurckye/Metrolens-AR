import SwiftUI
import URLImage

struct DiscoverView : View {
    @Binding var isChart: Bool

    
    @State var data = MemStorage.locations.map { location in
        return Card(
            id: location.id,
            image: location.featuredImage,
            title: location.name,
            details: location.firstBody,
            type: location.type,
            expand: false
        )
    }
    
    @State var hero = false
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    HStack {
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Friday, August 2020")
                            Text("Discover")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                        }
                        Spacer()
                        Image("pic")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .clipShape(Capsule())
                    }
                    .padding()
                    
                    VStack(spacing: 65) {
                        ForEach(0..<self.data.count) { i in
                            GeometryReader { g in
                                CardView(data: self.$data[i], hero: self.$hero, isChart: self.$isChart).offset(y: self.data[i].expand ? -g.frame(in: .global).minY : 0)
                                    
                                // going to hide all other views when a view is expanded...
                                .opacity(self.hero ? (self.data[i].expand ? 1 : 0) : 1)
                                // you can see still scrollview is working so were going to disable it...
                                // follow me...
                                    
                                .onTapGesture {
                                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                                        
                                        if !self.data[i].expand{
                                            
                                            // opening only one time then close button will work...
                                            self.hero.toggle()
                                            self.data[i].expand.toggle()
                                        }
                                    }
    
                                }
                                
                            }
                            .frame(height: self.data[i].expand ? UIScreen.main.bounds.height : 250)
                                
                            // 500 for disabling the drag for scrollview...
                            .simultaneousGesture(DragGesture(minimumDistance: self.data[i].expand ? 0 : 500).onChanged({ (_) in
                                    
                                    print("dragging")
                            }))
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
            VStack {
                ZStack {
                    VStack {
                        URLImage(self.data.image) { proxy in
                            proxy.image.resizable()
                        }
                        .frame(height: self.data.expand ? 350 : 250)
                        
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
                if self.data.expand {
                    HStack(spacing: 32) {
                        SmallAction(action: {}, isPressed: false, icon: "location", title: "Locate")
                        SmallAction(action: {
                            withAnimation { self.isChart = true }
                        }, isPressed: false, icon: "chart.bar", title: "Stats")
                        SmallAction(action: {
                            self.data.isLiked = !self.data.isLiked
                        }, isPressed: self.data.isLiked, icon: "heart", title: "Like ")
                    }.padding()
                    
                    Text(self.data.details).padding(.horizontal)
                 
                }
            }
            .padding(.horizontal, self.data.expand ? 0 : 20).contentShape(Rectangle())
            
            if self.data.expand {
                Button(action: {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)){
                        
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
    @State static var rc = false
    static var previews: some View {
        DiscoverView(isChart: $rc)
    }
}
