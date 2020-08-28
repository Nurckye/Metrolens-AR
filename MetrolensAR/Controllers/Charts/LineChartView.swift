//
//  LineChartView.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 22/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct PlaceChartView: View {
    @Binding var isChart: Bool
    var body: some View {
        ScrollView(.vertical) {
            ZStack {
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                self.isChart = false
                            }
                        }) {
                            Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .clipShape(Circle())
                        }
                    }
                    Spacer()
                }
                VStack {
                    LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen").padding(.bottom, 400).padding()
                  
                    
                }
            }
        }.padding(.leading).padding(.trailing)
    }
}

struct PlaceChartView_Previews: PreviewProvider {
    @State static var rc = false
    static var previews: some View {
        PlaceChartView(isChart: $rc)
    }
}
