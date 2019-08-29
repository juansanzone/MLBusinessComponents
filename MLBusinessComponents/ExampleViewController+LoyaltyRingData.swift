//
//  ExampleViewController+RingData.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/28/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

extension ExampleViewController: MLBusinessLoyaltyRingData {
    func getRingNumber() -> Int {
        return 4
    }

    func getRingHexaColor() -> String {
        return "#43bc80"
    }

    func getRingPercentage() -> Float {
        return 0.45
    }

    func getTitle() -> String {
        return "Ganaste unos puntos hola a todos mis amigos como estan"
    }

    func getButtonTitle() -> String {
        return "Ir a los puntos"
    }

    func getButtonDeepLink() -> String {
        return "mercadopago://home"
    }
}
