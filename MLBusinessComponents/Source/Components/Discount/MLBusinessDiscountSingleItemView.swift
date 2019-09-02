//
//  MLBusinessDiscountSingleItemView.swift
//  MLBusinessComponents
//
//  Created by Esteban Adrian Boffa on 29/08/2019.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import Foundation
import UIKit

class MLBusinessDiscountSingleItemView: UICollectionViewCell {

}

extension MLBusinessDiscountSingleItemView {
    func setupCell(discountSingleItem: MLBusinessDiscountSingleItem) {
        let icon: UIImageView = UIImageView(image: UIImage(named: "Starbucks-Logo"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(icon)
        icon.contentMode = .scaleAspectFill
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 60),
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.topAnchor.constraint(equalTo: self.topAnchor),
            icon.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        let itemTitle = UILabel()
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemTitle)
        itemTitle.text = discountSingleItem.title
        itemTitle.textAlignment = .center
        itemTitle.numberOfLines = 1
        NSLayoutConstraint.activate([
            itemTitle.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 16),
            itemTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        let itemSubtitle = UILabel()
        itemSubtitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemSubtitle)
        itemSubtitle.text = discountSingleItem.subtitle
        itemSubtitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        itemSubtitle.textAlignment = .center
        itemSubtitle.numberOfLines = 1
        NSLayoutConstraint.activate([
            itemSubtitle.topAnchor.constraint(equalTo: itemTitle.bottomAnchor),
            itemSubtitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemSubtitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            itemSubtitle.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
