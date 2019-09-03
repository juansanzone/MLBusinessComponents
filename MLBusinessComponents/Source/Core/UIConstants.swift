//
//  UIConstants.swift
//  MLBusinessComponents
//
//  Created by Esteban Adrian Boffa on 02/09/2019.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import Foundation
import UIKit

struct UI {

    struct Margin {
        static let XXS_MARGIN: CGFloat = 10
        static let XS_MARGIN: CGFloat = 12
        static let S_MARGIN: CGFloat = 16
        static let M_MARGIN: CGFloat = 20
        static let L_MARGIN: CGFloat = 24
    }

    struct FontSize {
        static let XS_FONT: CGFloat = 14
        static let S_FONT: CGFloat = 16
        static let M_FONT: CGFloat = 20
        static let L_FONT: CGFloat = 25
    }

    struct Colors {
        static let placeHolderColor: UIColor = "efefef".hexaToUIColor()
    }
}
