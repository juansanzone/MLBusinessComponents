//
//  MLBusinessLoyaltyRingView.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

@objc open class MLBusinessLoyaltyRingView: UIView {
    let viewData: MLBusinessLoyaltyRingData

    init(_ ringViewData: MLBusinessLoyaltyRingData) {
        self.viewData = ringViewData
        super.init(frame: .zero)
        render()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLBusinessLoyaltyRingView {
    private func render() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white //REMOVE

        let titleLabel = UILabel()
        titleLabel.numberOfLines = 2 //todo revisar
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = viewData.getTitle()
        self.addSubview(titleLabel)

        //change by meliui button
        let button = UIButton()
        button.setTitle(viewData.getButtonTitle(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(UIColor.blue, for: .normal)
        self.addSubview(button)

        let ring = UIView(frame: .zero)
        ring.backgroundColor = viewData.getRingHexaColor().hexaToUIColor()
        ring.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(ring)

        NSLayoutConstraint.activate([
            ring.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            ring.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            ring.heightAnchor.constraint(equalToConstant: 50),
            ring.widthAnchor.constraint(equalToConstant: 50),

            titleLabel.leftAnchor.constraint(equalTo: ring.rightAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: ring.centerYAnchor, constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),

            button.heightAnchor.constraint(equalToConstant: 20),
            button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),

            self.heightAnchor.constraint(equalToConstant: 82)
            ])
    }
}
