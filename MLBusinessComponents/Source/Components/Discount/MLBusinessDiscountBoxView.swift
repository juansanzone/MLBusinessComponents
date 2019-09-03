//
//  MLBusinessDiscountBoxView.swift
//  MLBusinessComponents
//
//  Created by Juan sebastian Sanzone on 8/29/19.
//  Copyright © 2019 Juan Sanzone. All rights reserved.
//

import UIKit
import MLUI

@objc open class MLBusinessDiscountBoxView: UIView {
    let viewData: MLBusinessDiscountBoxData

    init(_ viewData: MLBusinessDiscountBoxData) {
        self.viewData = viewData
        super.init(frame: .zero)
        render()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLBusinessDiscountBoxView {
    private func render() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.white
        self.heightAnchor.constraint(equalToConstant: 340).isActive = true

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: DiscountGridFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        collectionView.register(MLBusinessDiscountSingleItemView.self, forCellWithReuseIdentifier: MLBusinessDiscountSingleItemView.cellIdentifier)

        self.addSubview(collectionView)
        var collectionViewTopConstraint: NSLayoutConstraint = collectionView.topAnchor.constraint(equalTo: self.topAnchor)

        if let title = viewData.getTitle?(), let subtitle = viewData.getSubtitle?() {
            let titleLabel = UILabel()
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(titleLabel)
            titleLabel.text = title
            titleLabel.font = UIFont.ml_boldSystemFont(ofSize: UI.FontSize.L_FONT)
            titleLabel.textAlignment = .center
            titleLabel.numberOfLines = 1 //TODO: Check UX
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
                titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UI.Margin.S_MARGIN),
                titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UI.Margin.S_MARGIN)
            ])

            let subtitleLabel = UILabel()
            subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(subtitleLabel)
            subtitleLabel.font = UIFont.ml_lightSystemFont(ofSize: UI.FontSize.S_FONT)
            subtitleLabel.text = subtitle
            subtitleLabel.textAlignment = .center
            subtitleLabel.numberOfLines = 1
            NSLayoutConstraint.activate([
                subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
                subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: UI.Margin.S_MARGIN),
                subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -UI.Margin.S_MARGIN)
            ])

            collectionViewTopConstraint = collectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: UI.Margin.L_MARGIN)
        }

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionViewTopConstraint
        ])
    }
}

extension MLBusinessDiscountBoxView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData.getItems().count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let itemData = viewData.getItems()[indexPath.item]

        if let dequeueCell = collectionView.dequeueReusableCell(withReuseIdentifier: MLBusinessDiscountSingleItemView.cellIdentifier, for: indexPath) as? MLBusinessDiscountSingleItemView {
            dequeueCell.setupCell(discountSingleItem: itemData)
            return dequeueCell
        }
        return UICollectionViewCell()
    }
}

