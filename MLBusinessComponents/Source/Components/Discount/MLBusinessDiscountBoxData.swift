//
//  MLBusinessDiscountBoxData.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/29/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import Foundation

@objc public protocol MLBusinessDiscountBoxData: NSObjectProtocol {
    func getTitle() -> String
    func getSubtitle() -> String

    func getItems() -> [MLBusinessDiscountSingleItem]

    func getButtonTitle() -> String
    func getButtonDeepLink() -> String

    func shouldShowDownloadAppBadge() -> Bool
}
