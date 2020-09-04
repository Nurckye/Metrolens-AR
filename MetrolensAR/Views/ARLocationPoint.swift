//
//  ARLocationPoint.swift
//  ARLOCATION
//
//  Created by Radu Nitescu  on 12/08/2020.
//  Copyright © 2020 Radu Nitescu . All rights reserved.
//

import UIKit
import SnapKit

class ARLocationPoint: UIView {
    private static let backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.70)
    
    init (frame : CGRect, name: String) {
        super.init(frame : frame)
        let divisionFactor: CGFloat = 50
        let paddingValue: CGFloat = 20
        
        let informationContainer: UIView = {
            let uv = UIView(frame: CGRect(x: 0,
                                          y: 0,
                                          width: frame.width,
                                          height: frame.height * 0.7))
            uv.backgroundColor = ARLocationPoint.backgroundColor
            uv.layer.cornerRadius = 16
            return uv
        }()
        self.addSubview(informationContainer)
        
        let textLabel: UILabel = {
            let ulHeight: CGFloat = 24
            let ul = UILabel(frame: CGRect(x: informationContainer.frame.width / 3.5,
                                           y: informationContainer.frame.height / 2 - ulHeight / 2,
                                           width: 200,
                                           height: ulHeight))
            ul.textColor = UIColor.black
//            ul.text = "Palatul Parlamentului"
            ul.text = name
            return ul
        }()
        informationContainer.addSubview(textLabel)
        
        let locationTypeMarker: UIView = {
            let uvHeight: CGFloat = 21
            let uv = UIView(frame: CGRect(x: paddingValue,
                                          y: informationContainer.frame.height / 2 - uvHeight / 2,
                                          width: uvHeight,
                                          height: uvHeight))
            uv.backgroundColor = .red
            uv.layer.masksToBounds = true
            uv.layer.cornerRadius = CGFloat(uvHeight / 2)
            return uv
        }()
        informationContainer.addSubview(locationTypeMarker)
        
        
        let circleBubbleDimen = frame.width / divisionFactor * 2.5
        let circleBubble: UIView = {
            let uv = UIView(frame: CGRect(x: frame.width / 2 - circleBubbleDimen / 2,
                                          y: frame.height - circleBubbleDimen,
                                          width: circleBubbleDimen,
                                          height: circleBubbleDimen))
            uv.backgroundColor = ARLocationPoint.backgroundColor
            uv.layer.masksToBounds = true
            uv.layer.cornerRadius = CGFloat(circleBubbleDimen / 2)
            return uv
        }()
        self.addSubview(circleBubble)
        
        let holdingBar: UIView = {
            let uv = UIView(frame: CGRect(x: frame.width / 2 - frame.width / (divisionFactor * 2),
                                          y: informationContainer.frame.height,
                                          width: frame.width / divisionFactor,
                                          height: frame.height - informationContainer.frame.height - CGFloat(circleBubbleDimen) + 1))
            uv.backgroundColor = ARLocationPoint.backgroundColor
            return uv
        }()
        self.addSubview(holdingBar)
    }

    convenience init () {
        self.init(frame:CGRect.zero, name: "")
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
