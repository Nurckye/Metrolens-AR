//
//  DiscoverWrapper.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 22/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct DiscoverWrapper: View {
    @State var data = DiscoverView.getLocationsToDisplay(showLikes: false)
    
    var body: some View {
        ZStack {
            DiscoverView(
                data: $data,
                title: "Discover"
            )
        }
    }
}

struct DiscoverWrapper_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverWrapper()
    }
}
