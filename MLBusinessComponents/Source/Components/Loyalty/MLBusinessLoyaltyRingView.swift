//
//  MLBusinessLoyaltyRingView.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit
import MLUI

@objc open class MLBusinessLoyaltyRingView: UIView {
    let viewData: MLBusinessLoyaltyRingData
    private let fillPercentProgress: Bool
    private weak var ringView: UICircularProgressRing?

    private let viewHeight: CGFloat = 82
    private let ringSize: CGFloat = 50

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
        titleLabel.font = UIFont.ml_boldSystemFont(ofSize: UI.FontSize.S_FONT)
        self.addSubview(titleLabel)

        //change by meliui button
        let button = UIButton()
        button.setTitle(viewData.getButtonTitle(), for: .normal)
        button.titleLabel?.font = UIFont.ml_semiboldSystemFont(ofSize: UI.FontSize.XS_FONT)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        // TODO: Ver si lo cambiamos por el boton de meliui
        button.setTitleColor(MLStyleSheetManager.styleSheet.secondaryColor, for: .normal)
        self.addSubview(button)

        if let ring = RingFactory.create(number: viewData.getRingNumber(), hexaColor: viewData.getRingHexaColor(), percent: viewData.getRingPercentage(), fillPercentage: fillPercentProgress, innerCenterText: String(viewData.getRingNumber())) as? UICircularProgressRing {

            self.addSubview(ring)
            self.ringView = ring

            NSLayoutConstraint.activate([
                ring.topAnchor.constraint(equalTo: self.topAnchor, constant: UI.Margin.S_MARGIN),
                ring.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UI.Margin.S_MARGIN),
                ring.heightAnchor.constraint(equalToConstant: ringSize),
                ring.widthAnchor.constraint(equalToConstant: ringSize),

                titleLabel.leftAnchor.constraint(equalTo: ring.rightAnchor, constant: UI.Margin.XS_MARGIN),
                titleLabel.centerYAnchor.constraint(equalTo: ring.centerYAnchor, constant: -UI.Margin.XXS_MARGIN),
                titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UI.Margin.S_MARGIN),

                button.heightAnchor.constraint(equalToConstant: 20), //todo cambiar por meli ui
                button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),

                self.heightAnchor.constraint(equalToConstant: viewHeight)
            ])
        }
    }
}
