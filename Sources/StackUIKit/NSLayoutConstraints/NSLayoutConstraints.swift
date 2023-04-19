import UIKit

public extension NSLayoutConstraint {
    /// Activate the layouts defined in the result builder parameter `constraints`.
    static func activate(@ResultBuilder<NSLayoutConstraint> constraints: () -> [NSLayoutConstraint]) {
        activate(constraints())
    }
}

public extension UIView {
    func addSubview(_ views: UIView..., @ResultBuilder<NSLayoutConstraint> constraints: () -> [NSLayoutConstraint]) {
        views.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        addSubviews(views)
        NSLayoutConstraint.activate(constraints())
    }
}

public extension UIStackView {
    func addArrangedSubViews(@ResultBuilder<UIView> views: () -> [UIView]) {
        views().forEach {
            addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

