//
//  ExampleViewController.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    private weak var ringView: MLBusinessLoyaltyRingView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateRing()
    }
}

// MARK: Setups
extension ExampleViewController {
    private func setupView() {
        let newRingView = setupRingView()
        self.ringView = newRingView
        setupDiscountView(bottomOf: newRingView)
    }

    private func setupRingView() -> MLBusinessLoyaltyRingView {
        let ringView = MLBusinessLoyaltyRingView(LoyaltyRingData(), fillPercentProgress: false)
        view.addSubview(ringView)
        NSLayoutConstraint.activate([
            ringView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UI.Margin.S_MARGIN),
            ringView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UI.Margin.S_MARGIN),
            ringView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])

        ringView.addTapAction { deepLink in
            print(deepLink)
        }
        
        return ringView
    }

    private func setupDiscountView(bottomOf targetView: UIView) {
        let discountView = MLBusinessDiscountBoxView(DiscountData())
        view.addSubview(discountView)
        NSLayoutConstraint.activate([
            discountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UI.Margin.S_MARGIN),
            discountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -UI.Margin.S_MARGIN),
            discountView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: UI.Margin.XM_MARGIN)
        ])

        discountView.addTapAction { (deepLink, trackId) in
            // print(deepLink, trackId)
        }
    }
}

extension ExampleViewController {
    private func animateRing() {
        ringView?.fillPercentProgressWithAnimation()
    }
}
