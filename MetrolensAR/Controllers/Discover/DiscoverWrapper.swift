//
//  DiscoverWrapper.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 22/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct DiscoverWrapper: View {
    @State var isChart = false
    
    var body: some View {
        ZStack {
            if isChart {
                PlaceChartView(isChart: $isChart)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .bottom)))
            } else {
                DiscoverView(isChart: $isChart).transition(.asymmetric(insertion: .slide, removal: .opacity))
            }
        }
        
    }
}

struct DiscoverWrapper_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverWrapper()
    }
}
