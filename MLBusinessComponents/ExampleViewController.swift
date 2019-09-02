//
//  ExampleViewController.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ExampleViewController {
    private func setupView() {
        setupDiscountView(bottomOf: setupRingView())
    }

    private func setupRingView() -> UIView {
        let ringView = MLBusinessLoyaltyRingView(LoyaltyRingData())
        view.addSubview(ringView)
        NSLayoutConstraint.activate([
            ringView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ringView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ringView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        return ringView
    }

    private func setupDiscountView(bottomOf targetView: UIView) {
        let discountView = MLBusinessDiscountBoxView(DiscountData())
        view.addSubview(discountView)
        NSLayoutConstraint.activate([
            discountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            discountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            discountView.topAnchor.constraint(equalTo: targetView.bottomAnchor, constant: 20)
        ])
    }
}
