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

    private let viewHeight: CGFloat = 55
    private let ringSize: CGFloat = 46
    private let fillPercentProgress: Bool
    private weak var ringView: UICircularProgressRing?
    private var tapAction: ((_ deepLink: String) -> Void)?

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

        let buttonHeight: CGFloat = 20
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 2 //TODO: revisar con ux
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = viewData.getTitle()
        titleLabel.font = UIFont.ml_semiboldSystemFont(ofSize: UI.FontSize.S_FONT)
        //TODO: Revisa con UX
        //titleLabel.adjustsFontSizeToFitWidth = true
        //titleLabel.minimumScaleFactor = 0.80
        titleLabel.applyBusinessLabelStyle()
        self.addSubview(titleLabel)

        let button = UIButton()
        button.setTitle(viewData.getButtonTitle(), for: .normal)
        button.titleLabel?.font = UIFont.ml_semiboldSystemFont(ofSize: UI.FontSize.XS_FONT)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitleColor(MLStyleSheetManager.styleSheet.secondaryColor, for: .normal)
        button.addTarget(self, action:  #selector(self.didTapOnButton), for: .touchUpInside)
        self.addSubview(button)

        if let ring = RingFactory.create(number: viewData.getRingNumber(), hexaColor: viewData.getRingHexaColor(), percent: viewData.getRingPercentage(), fillPercentage: fillPercentProgress, innerCenterText: String(viewData.getRingNumber())) as? UICircularProgressRing {

            self.addSubview(ring)
            self.ringView = ring

            NSLayoutConstraint.activate([
                ring.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                ring.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UI.Margin.S_MARGIN),
                ring.heightAnchor.constraint(equalToConstant: ringSize),
                ring.widthAnchor.constraint(equalToConstant: ringSize),
                titleLabel.leftAnchor.constraint(equalTo: ring.rightAnchor, constant: UI.Margin.M_MARGIN),
                titleLabel.centerYAnchor.constraint(equalTo: ring.centerYAnchor, constant: -UI.Margin.XXS_MARGIN),
                titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UI.Margin.S_MARGIN),
                button.heightAnchor.constraint(equalToConstant: buttonHeight),
                button.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                self.heightAnchor.constraint(equalToConstant: viewHeight)
            ])
        }
    }

    // MARK: Tap Selector
    @objc private func didTapOnButton() {
        tapAction?(viewData.getButtonDeepLink())
    }
}

// MARK: Public
extension MLBusinessLoyaltyRingView {
    @objc open func addTapAction(_ action: @escaping ((_ deepLink: String) -> Void)) {
        self.tapAction = action
    }
}
