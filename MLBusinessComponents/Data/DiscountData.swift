//
//  ExampleViewController+DiscountBoxData.swift
//  MLBusinessComponents
//
//  Created by Esteban Adrian Boffa on 29/08/2019.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit

class DiscountData: NSObject, MLBusinessDiscountBoxData {
    func getTitle() -> String {
        return "200 descuentos"
    }

    func getSubtitle() -> String {
        return "por ser nivel 3"
    }

    func getItems() -> [MLBusinessDiscountSingleItem] {
        let item1 = MLBusinessDiscountSingleItem(title: "Hasta", subtitle: "$ 200", iconImageUrl: "Starbucks-Logo")
        let item2 = MLBusinessDiscountSingleItem(title: "Hasta", subtitle: "$ 200", iconImageUrl: "Starbucks-Logo")
        let item3 = MLBusinessDiscountSingleItem(title: "Hasta", subtitle: "$ 200", iconImageUrl: "Starbucks-Logo")
        let item4 = MLBusinessDiscountSingleItem(title: "Hasta", subtitle: "$ 200", iconImageUrl: "Starbucks-Logo")
        let item5 = MLBusinessDiscountSingleItem(title: "Hasta", subtitle: "$ 200", iconImageUrl: "Starbucks-Logo")
        let item6 = MLBusinessDiscountSingleItem(title: "Hasta", subtitle: "$ 200", iconImageUrl: "Starbucks-Logo")
        var array: [MLBusinessDiscountSingleItem] = [MLBusinessDiscountSingleItem]()
        array.append(item1)
        array.append(item2)
        array.append(item3)
        array.append(item4)
        array.append(item5)
        array.append(item6)
        return array
    }
}
