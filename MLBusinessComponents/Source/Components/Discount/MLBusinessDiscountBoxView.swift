//
//  MLBusinessDiscountBoxView.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/29/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

@objc open class MLBusinessDiscountBoxView: UIView {
    let viewData: MLBusinessDiscountBoxData

    init(_ viewData: MLBusinessDiscountBoxData) {
        self.viewData = viewData
        super.init(frame: .zero)
        render()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLBusinessDiscountBoxView {
    private func render() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
