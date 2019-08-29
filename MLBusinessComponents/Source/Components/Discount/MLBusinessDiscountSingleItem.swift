//
//  MLBusinessDiscountSingleItem.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/29/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import Foundation

@objc open class MLBusinessDiscountSingleItem: NSObject {
    let title: String
    let subtitle: String
    let iconImageUrl: String

    init(title: String, subtitle: String, iconImageUrl: String) {
        self.title = title
        self.subtitle = subtitle
        self.iconImageUrl = iconImageUrl
    }
}
