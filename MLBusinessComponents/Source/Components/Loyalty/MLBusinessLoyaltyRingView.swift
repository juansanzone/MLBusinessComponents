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
    private let fillPercentProgress: Bool
    private weak var ringView: UICircularProgressRing?

    init(_ ringViewData: MLBusinessLoyaltyRingData, fillPercentProgress: Bool = true) {
        self.viewData = ringViewData
        self.fillPercentProgress = fillPercentProgress
        super.init(frame: .zero)
        render()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fillPercentProgressWithAnimation(_ duration: TimeInterval = 1.0) {
        ringView?.startProgress(to: CGFloat(viewData.getRingPercentage()), duration: duration)
    }
}

// MARK: Privates
extension MLBusinessLoyaltyRingView {
    private func render() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white

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

        if let ring = RingFactory.create(number: viewData.getRingNumber(), hexaColor: viewData.getRingHexaColor(), percent: viewData.getRingPercentage(), fillPercentage: fillPercentProgress, innerCenterText: String(viewData.getRingNumber())) as? UICircularProgressRing {

            self.addSubview(ring)
            self.ringView = ring

            NSLayoutConstraint.activate([
                ring.topAnchor.constraint(equalTo: self.topAnchor, constant: UI.Margin.S_MARGIN),
                ring.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UI.Margin.S_MARGIN),
                ring.heightAnchor.constraint(equalToConstant: UI.Size.XM_SIZE),
                ring.widthAnchor.constraint(equalToConstant: UI.Size.XM_SIZE),

                titleLabel.leftAnchor.constraint(equalTo: ring.rightAnchor, constant: UI.Margin.XS_MARGIN),
                titleLabel.centerYAnchor.constraint(equalTo: ring.centerYAnchor, constant: -UI.Margin.XXS_MARGIN),
                titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UI.Margin.S_MARGIN),

                button.heightAnchor.constraint(equalToConstant: UI.Size.S_SIZE),
                button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),

                self.heightAnchor.constraint(equalToConstant: UI.Size.L_SIZE)
            ])
        }
    }
}
