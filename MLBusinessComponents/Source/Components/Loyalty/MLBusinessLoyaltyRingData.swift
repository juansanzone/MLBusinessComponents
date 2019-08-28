//
//  MLBusinessLoyaltyRingData.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

@objc public protocol MLBusinessLoyaltyRingData: NSObjectProtocol {
    func getRingColor() -> UIColor // todo: cambiar por string hexa.
    func getRingNumber() -> Int
    func getRingPercentage() -> CGFloat
    func getTitle() -> String
    func getButtonTitle() -> String
    func getButtonDeepLink() -> String //todo: pasar un bloque/callback
}
