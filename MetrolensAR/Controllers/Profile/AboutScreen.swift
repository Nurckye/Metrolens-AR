//
//  About.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 27/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct AboutScreen: View {
    var body: some View {
        VStack {
            HStack {
                Text("Metrolens AR")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.bottom, 32)
            
            Text("Metrolens AR is an IOS application that aims to help people discover new and interesting landmarks by hanessing the native power of ARKit and CoreLocation, using a simple and intuitive layout.")
                .padding(.bottom, 24)

            Text("Created between august and september 2020 for the AlgoExpert contest")
                .foregroundColor(.gray)

            Spacer()
            HStack {
                Text("Radu Nitescu - Bucharest")
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .padding()
    }
}
