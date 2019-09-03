//
//  MLBusinessDiscountSingleItemView.swift
//  MLBusinessComponents
//
//  Created by Esteban Adrian Boffa on 29/08/2019.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import Foundation
import UIKit
import MLUI

class MLBusinessDiscountSingleItemView: UICollectionViewCell {
    static let cellIdentifier: String = "discountSingleItemCell"
}

extension MLBusinessDiscountSingleItemView {

    func setupCell(discountSingleItem: MLBusinessDiscountSingleItem) {
        self.backgroundColor = .white
        let icon = CustomUIImageView()
        icon.loadImage(url: discountSingleItem.iconImageUrl, placeholder: nil, placeHolderRadius: UI.Size.M_SIZE/2)
        icon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(icon)
        icon.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: UI.Size.M_SIZE),
            icon.widthAnchor.constraint(equalToConstant: UI.Size.M_SIZE),
            icon.topAnchor.constraint(equalTo: self.topAnchor),
            icon.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        let itemTitle = UILabel()
        itemTitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemTitle)
        itemTitle.font = UIFont.ml_lightSystemFont(ofSize: UI.FontSize.XS_FONT)
        itemTitle.text = discountSingleItem.title
        itemTitle.textAlignment = .center
        itemTitle.numberOfLines = 1
        NSLayoutConstraint.activate([
            itemTitle.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: UI.Margin.S_MARGIN),
            itemTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            itemTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

        let itemSubtitle = UILabel()
        itemSubtitle.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(itemSubtitle)
        itemSubtitle.font = UIFont.ml_boldSystemFont(ofSize: UI.FontSize.M_FONT)
        itemSubtitle.text = discountSingleItem.subtitle
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
