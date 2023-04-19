import UIKit

public extension ScrollViewBuilder {
    @discardableResult
    func spacing(_ spacing: CGFloat) -> Self {
        stackView.spacing = spacing
        return self
    }

    @discardableResult
    func alignment(_ alignment: UIStackView.Alignment) -> Self {
        stackView.alignment = alignment
        return self
    }

    @discardableResult
    func showsHorizontalIndicator(_ value: Bool) -> Self {
        scrollView.showsHorizontalScrollIndicator = value
        return self
    }
    
    @discardableResult
    func showsVerticalIndicator(_ value: Bool) -> Self {
        scrollView.showsVerticalScrollIndicator = value
        return self
    }

    @discardableResult
    func alwaysBounceHorizontal(_ value: Bool) -> Self {
        scrollView.alwaysBounceHorizontal = value
        return self
    }

    @discardableResult
    func alwaysBounceVertical(_ value: Bool) -> Self {
        scrollView.alwaysBounceVertical = value
        return self
    }

    @discardableResult
    func scrollDelegate(_ delegate: UIScrollViewDelegate) -> Self {
        scrollView.delegate = delegate
        return self
    }

    // MARK: Padding

    @discardableResult
    func padding(_ edges: PaddingEdges...) -> Self {
        stackView.padding(edges)
        return self
    }
    
    @discardableResult
    func padding(_ length: CGFloat) -> Self {
        stackView.padding(.all(length))
        return self
    }
}
