import UIKit

public extension UIView {
    @discardableResult
    func ZStack(
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) -> UIStackView {
        let container = UIView()

        views().forEach { view in
            container.VStack { view }
        }

        return VStack(useSafeArea: useSafeArea) { container }
    }

    @discardableResult
    func VStack(
        spacing: CGFloat = .zero,
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) -> UIStackView {
        createStack(.vertical, views: views(), spacing: spacing, alignment: .fill, distribution: .fill, useSafeArea: useSafeArea)
    }

    @discardableResult
    func HStack(
        spacing: CGFloat = .zero,
        useSafeArea: Bool = true,
        @ResultBuilder<UIView> views: () -> [UIView]
    ) -> UIStackView {
        createStack(.horizontal, views: views(), spacing: spacing, alignment: .fill, distribution: .fill, useSafeArea: useSafeArea)
    }
}

// MARK: Class Variants

public final class ZStackView: UIStackView {
    public init(@ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(frame: .zero)
        let container = UIView()

        views().forEach { view in container.VStack { view } }

        addArrangedSubview(container)
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class VStackView: UIStackView {
    public init(spacing: CGFloat = .zero,
                @ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .vertical
        self.spacing = spacing
        addArrangedSubViews(views())
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

public final class HStackView: UIStackView {
    public init(spacing: CGFloat = .zero,
                @ResultBuilder<UIView> views: () -> [UIView]) {
        super.init(frame: .zero)
        self.axis = .horizontal
        self.spacing = spacing
        addArrangedSubViews(views())
    }

    @available(*, unavailable)
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
