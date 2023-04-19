import UIKit

// MARK: UIView Extension Variants

public extension UIView {
    // Note here. We can return the ScrollViewBuilder here because this is an extension of UIView.
    // Therefore the return type wont be added to the stack.
    
    @discardableResult
    func VScroll(
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]) -> ScrollViewBuilder {
            
        let scrollView = ScrollViewBuilder(axis: .vertical, views: views)
        VStack(useSafeArea: useSafeArea) { scrollView }
        return scrollView
    }

    @discardableResult
    func HScroll(
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]) -> ScrollViewBuilder {
            
        let scrollView = ScrollViewBuilder(axis: .horizontal, views: views)
        VStack(useSafeArea: useSafeArea) { scrollView }
        return scrollView
    }
}

// MARK: Class Variants

public final class HScroll: ScrollViewBuilder {
    public init(@ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(axis: .horizontal, views: views)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class VScroll: ScrollViewBuilder {
    public init(@ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(axis: .vertical, views: views)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
