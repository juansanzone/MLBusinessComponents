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
        setupRingView()
    }

    func setupRingView() {
        let ringView = MLBusinessLoyaltyRingView(self)

        view.addSubview(ringView)

        ringView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        ringView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        ringView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
    }
}
