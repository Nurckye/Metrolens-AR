//
//  LikesView.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 23/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct LikesView: View {
    @State var isChart = false
    @State var data = DiscoverView.getLocationsToDisplay(showLikes: true)

    var body: some View {
        ZStack {
            if isChart {
                PlaceChartView(isChart: $isChart)
                    .transition(.asymmetric(insertion: .opacity, removal: .move(edge: .bottom)))
            } else {
                DiscoverView(
                    isChart: $isChart,
                    data: $data,
                    title: "Likes"
                ).transition(.asymmetric(insertion: .slide, removal: .opacity))
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView()
    }
}
