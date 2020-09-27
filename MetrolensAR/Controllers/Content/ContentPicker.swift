//
//  ContentPicker.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 16/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import Combine

struct ContentPicker: View {
    @State var isChart = false
    @State var subscriber: AnyCancellable?
    @State var chartViewOnSubscriber: AnyCancellable?
    @State var selectedChartLocation: LocationEntry? = nil

    var which: NavigationLocation
    
    var body: some View {
        ZStack {
            MapWrapper().isHidden(which != NavigationLocation.Map || isChart)
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .edgesIgnoringSafeArea(.top)
            
            DiscoverWrapper().isHidden(which != NavigationLocation.Discover || isChart)
            
            LikesView().isHidden(which != NavigationLocation.Likes || isChart)
            AboutScreen().isHidden(which != NavigationLocation.Profile || isChart)

            if isChart {
                PlaceChartView(location: selectedChartLocation!)
                    .transition( AnyTransition.opacity)
                    .animation(.easeInOut)
            }
        }
        .onAppear {
            subscriber = StateManager.manager.subscribe(key: CHART_SELECTED_EVENT) { (value: String) in
                selectedChartLocation = MemStorage.getLocationById(id: value)
                isChart = true
            }
            
            chartViewOnSubscriber = StateManager.manager.subscribe(key: CHART_TOGGLE_EVENT) { (value: Bool) in
                isChart = value
            }
        }
    }
}

struct ContentPicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentPicker(which: NavigationLocation.Map)
    }
}
