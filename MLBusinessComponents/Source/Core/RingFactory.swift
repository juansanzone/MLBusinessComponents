//
//  RingFactory.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/29/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

struct RingFactory {
    static func create(number: Int, hexaColor: String, percent: Float) -> UIView {
        let ring = UICircularProgressRing()
        ring.maxValue = 1
        ring.minValue = 0
        ring.style = .ontop
        ring.startAngle = 270
        ring.outerRingWidth = 5
        ring.innerRingWidth = 5
        ring.outerRingColor = "efefef".hexaToUIColor()
        ring.innerCapStyle = .round
        ring.gradientOptions = UICircularRingGradientOptions(startPosition: .left, endPosition: .right, colors: [hexaColor.hexaToUIColor(), hexaColor.hexaToUIColor()], colorLocations: [0.5])
        ring.startProgress(to: CGFloat(percent), duration: 1.0)
        ring.shouldShowValueText = false
        ring.translatesAutoresizingMaskIntoConstraints = false
        return ring
    }
}
