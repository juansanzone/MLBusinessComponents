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

class MLBusinessDiscountTableViewCell: UITableViewCell {

    static let cellIdentifier: String = "discountTableViewCell"
    private let stackView = UIStackView(frame: .zero)
    private var itemViews: [MLBusinessDiscountSingleItemView] = [MLBusinessDiscountSingleItemView]()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        clearStackView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MLBusinessDiscountTableViewCell {

    func setupCell(discountItems: [MLBusinessDiscountSingleItem]) {
        updateStackView(discountItems)
    }
}

// MARK: StackView Privates
extension MLBusinessDiscountTableViewCell {

    private func setupStackView() {
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 5
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

    private func updateStackView(_ items: [MLBusinessDiscountSingleItem]) {
        for item in items {
            let itemView = MLBusinessDiscountSingleItemView(discountSingleItem: item)
            itemViews.append(itemView)
            stackView.addArrangedSubview(itemView)
        }
    }

    private func clearStackView() {
        for itemView in itemViews {
            stackView.removeArrangedSubview(itemView)
        }
        itemViews.removeAll()
    }
}
