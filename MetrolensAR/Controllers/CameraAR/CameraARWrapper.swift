//
//  CameraARWrapper.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 22/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct CameraARWrapper: View {
    var body: some View {
        ZStack {
            
            CameraARView()
            VStack {
                  HStack {
                      Spacer()
                    NavigationLink(destination: ContentView()) {
                          Image(systemName: "xmark")
                              .foregroundColor(.white)
                              .padding()
                              .background(Color.black.opacity(0.4))
                              .clipShape(Circle())
                      }
                  }
                  Spacer()
            }.padding()
        }
    }
}

struct CameraARWrapper_Previews: PreviewProvider {
    static var previews: some View {
  
        CameraARWrapper()
    }
}
