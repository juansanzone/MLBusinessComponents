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
        view.backgroundColor = UIColor.black
        setupRingView()
//        setupDiscountView()
    }

    func setupRingView() {
        let ringView = MLBusinessLoyaltyRingView(LoyaltyRingData())
        view.addSubview(ringView)
        NSLayoutConstraint.activate([
            ringView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            ringView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            ringView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
    }

    func setupDiscountView() {
        let discountView = MLBusinessDiscountBoxView(DiscountData())
        view.addSubview(discountView)
        NSLayoutConstraint.activate([
            discountView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            discountView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            discountView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60)
        ])
    }
}
