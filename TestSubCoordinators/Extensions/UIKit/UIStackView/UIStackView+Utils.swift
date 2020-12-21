import UIKit

extension UIStackView {
    // swiftlint:disable using_stackview_removearrangedsubview
    public func removeArrangedSubviewFromSuperview(_ arrangedSubview: UIView) {
        guard arrangedSubviews.contains(arrangedSubview) else { return }
        removeArrangedSubview(arrangedSubview)
        arrangedSubview.removeFromSuperview()
    }

    public func removeAllArrangedSubviews() {
        arrangedSubviews.forEach { removeArrangedSubviewFromSuperview($0) }
    }

    // swiftlint:enable using_stackview_removearrangedsubview
    
    public func addArrangedSubview(_ arrangedSubview: UIView, after alreadyArrangedSubview: UIView) {
        guard let index = arrangedSubviews.firstIndex(of: alreadyArrangedSubview) else { return }
        let afterIndex = index + 1
        let afterIndexIsContainedBetweenCurrentViews = (0..<arrangedSubviews.count).contains(afterIndex)
        let afterIndexIsBeyondCurrentViews = afterIndex >= arrangedSubviews.count
        
        if afterIndexIsContainedBetweenCurrentViews {
            insertArrangedSubview(arrangedSubview, at: afterIndex)
        } else if afterIndexIsBeyondCurrentViews {
            addArrangedSubview(arrangedSubview)
        }
    }
}
