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
    var location: LocationEntry
    
    var body: some View {
        ZStack {
            VStack {
                LineView(
                    data: decodeBusyHours(value: location.busyHours ?? 0),
                    title: location.name,
                    legend: "Busy hours for today (9 AM to 7 PM)"
                )
                .padding(.bottom, 400).padding()
                
                
                
                VStack {
                    HStack {
                        Text("Entry fee")
                        Spacer()
                        Text(location.entryFee != nil ? "\(location.entryFee!) €" : "Free")
                    }
                    Divider()
                }
                .padding()
                VStack {
                    HStack {
                        Text("Landmark type")
                        Spacer()
                        Text(location.type.capitalizingFirstLetter())
                    }
                    Divider()
                }
                .padding()
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
                                UIApplication.shared.open(
                                            URL(
                                                string:
                                                    "comgooglemaps://?saddr=&daddr=\(location.coordinates.latitude),\(location.coordinates.longitude)&directionsmode=driving")!
                                        )
                            } else {
                                NSLog("Can't use comgooglemaps://");
                            }
                        }){
                            Text("See more on Google Maps")
                        }
                        Spacer()
                    }
                    Divider()
                }
                .padding()
            }
        
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8, blendDuration: 0)) {
                            StateManager.manager.publish(key: CHART_TOGGLE_EVENT, payload: false)
                        }
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.4))
                            .clipShape(Circle())
                    }
                }.padding()
                Spacer()
            }
        }
    }
}
