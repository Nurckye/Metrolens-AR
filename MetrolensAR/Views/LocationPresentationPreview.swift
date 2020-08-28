//
//  SwiftUIView.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 14/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct CustomShape: Shape {
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let tl = CGPoint(x: rect.minX, y: rect.minY)
        let tr = CGPoint(x: rect.maxX, y: rect.minY)
        let brs = CGPoint(x: rect.maxX, y: rect.maxY - radius)
        let brc = CGPoint(x: rect.maxX - radius, y: rect.maxY - radius)
        let bls = CGPoint(x: rect.minX + radius, y: rect.maxY)
        let blc = CGPoint(x: rect.minX + radius, y: rect.maxY - radius)
        let tls = CGPoint(x: rect.minX, y: rect.minY + radius)
        let tlc = CGPoint(x: rect.minX + radius, y: rect.minY + radius)
        
        path.move(to: tl)
        path.addLine(to: tr)
        
        path.addLine(to: brs)
        path.addRelativeArc(center: brc, radius: radius,
          startAngle: Angle.degrees(0), delta: Angle.degrees(90))
        path.addLine(to: bls)
        path.addRelativeArc(center: blc, radius: radius,
          startAngle: Angle.degrees(90), delta: Angle.degrees(90))
        
        path.addLine(to: tls)
        path.addRelativeArc(center: tlc, radius: radius,
          startAngle: Angle.degrees(90), delta: Angle.degrees(180))
        
        return path
    }
}


struct LocationPresentationPreview: View {
    let textHeader = "Intercontinental"
    let textPreview = "Lorem ipsum vad aurelius navi cashasa ipsum vad aurelius ipsum vad aurelius"
    let img = UIImage(named: "intercontinental")!
    let arrowImage = UIImage(named: "arrow")!
    let cornerRadiusValue:CGFloat = 40
    @State var didTap = false

    var body: some View {
        Button(action: {
               self.didTap = true
            }){
            ZStack {
                VStack {
                    ZStack {
                        Image(uiImage: img).resizable()
                        Text(textHeader).font(.largeTitle).fontWeight(.medium).foregroundColor(Color.white).padding(.horizontal)
                    }
                }.cornerRadius(cornerRadiusValue).frame(height: 300)
                VStack {
                    Spacer().frame(height: 230)
                    HStack {
                        Spacer().frame(minWidth: 20, maxWidth: 30)
                        Spacer()
                        HStack {
                            Text(textPreview).frame(height: 100).padding(.horizontal).foregroundColor(Color.gray)
                            Image(uiImage: arrowImage).padding(.trailing)
                            
                        }.background(Color.white).frame( maxHeight: 100).mask(CustomShape(radius: 25)).shadow(radius: 5, x: -2, y: 2)
                    }
                }
            }.background(Color.white).padding(self.didTap ? 10 : 0)
        }.buttonStyle(PlainButtonStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPresentationPreview()
    }
}
