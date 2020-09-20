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
    @State var data = DiscoverView.getLocationsToDisplay(showLikes: false)
    
    var body: some View {
        ZStack {
            DiscoverView(
                isChart: $isChart,
                data: $data,
                title: "Discover"
            ).sheet(isPresented: $isChart) {
                PlaceChartView(isChart: self.$isChart)
            }
        }
    }
}

struct DiscoverWrapper_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverWrapper()
    }
}
