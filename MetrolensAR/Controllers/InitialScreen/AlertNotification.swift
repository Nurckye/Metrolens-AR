//
//  AlertNotification.swift
//  MetrolensAR
//
//  Created by Radu Nitescu  on 22/09/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import SwiftUI

struct AlertNotification: View {
    var action: () -> Void
    
    var body: some View {
        VStack {
            VStack {
                Text("Oops, there was an error...")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(28)

            }
            .background(Color.red)
            .frame(maxWidth: .infinity)
            

            
            Text("There was a problem connecting to our servers.")
                .foregroundColor(.black)
                .padding(.top, 16)
                .padding(.bottom, 16)
                .padding()
                .font(.callout)

            Divider()
            Button(action: {
                self.action()
            }) {
                HStack {
                    Text("Retry")
                        .fontWeight(.semibold)
                }
                .frame(minWidth: 0, maxWidth: 150)
                .padding()
                .foregroundColor(Color.red)
                .background(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.red, lineWidth: 1)
                )
                .padding(.horizontal, 20)
            }
            .padding()
            .padding(.bottom, 8)

        }
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
        

        
    }
}

struct AlertNotification_Previews: PreviewProvider {
    static var previews: some View {
        AlertNotification() {
            
        }
    }
}
