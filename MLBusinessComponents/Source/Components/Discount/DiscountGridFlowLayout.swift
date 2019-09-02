import UIKit

class DiscountGridFlowLayout: UICollectionViewFlowLayout {
    let actionItemHeight: CGFloat = 108
    let maxItemsPerRow = 3
    let padding: CGFloat = 1

    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {
        minimumInteritemSpacing = padding
        minimumLineSpacing = padding
    }

    func shortcutItemWidth() -> CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let itemsCount = collectionView.numberOfItems(inSection: 0)

        var itemsInRow = maxItemsPerRow

        if itemsCount <= maxItemsPerRow {
            itemsInRow = itemsCount
        } else if itemsCount == 4 {
            itemsInRow = 2
        } else if itemsCount > 4 {
            itemsInRow = 3
        }

        // TODO: We use UIScreen because the frame of the CollectionView is zero when the view was offscreen.
        // TODO: Margin as constant.
        let collectionViewWidth = UIScreen.main.bounds.width - 16

        let availableWidth = collectionViewWidth - (padding * (CGFloat(itemsInRow) - CGFloat(1)))
        return availableWidth / CGFloat(itemsInRow)
    }

    override public var itemSize: CGSize {
        set {
            self.itemSize = CGSize(width: shortcutItemWidth(), height: actionItemHeight)
        }
        get {
            return CGSize(width: shortcutItemWidth(), height: actionItemHeight)
        }
    }

    override public var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return CGSize.zero }
        var size: CGSize = super.collectionViewContentSize
        let itemsCount = collectionView.numberOfItems(inSection: 0)
        size.height = itemsCount < 4 ? actionItemHeight : actionItemHeight * 2
        return size
    }

    override public func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return collectionView?.bounds != newBounds
    }
}
