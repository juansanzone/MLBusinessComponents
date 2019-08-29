//
//  MLBusinessLoyaltyRingData.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

@objc public protocol MLBusinessLoyaltyRingData: NSObjectProtocol {
    func getRingHexaColor() -> String
    func getRingNumber() -> Int
    func getRingPercentage() -> Float
    func getTitle() -> String
    func getButtonTitle() -> String
    func getButtonDeepLink() -> String
}
