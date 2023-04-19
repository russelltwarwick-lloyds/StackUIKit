import UIKit

public enum PaddingEdges {
    case top(CGFloat)
    case bottom(CGFloat)
    case left(CGFloat)
    case right(CGFloat)
    case all(CGFloat)
    case vertical(CGFloat)
    case horizontal(CGFloat)
}

public struct PaddingEdgesCalculator {
    let edges: [PaddingEdges]

    var edgeInset: UIEdgeInsets {
        var top: CGFloat = .zero
        var bottom: CGFloat = .zero
        var left: CGFloat = .zero
        var right: CGFloat = .zero

        edges.forEach { edge in
            switch edge {
            case let .top(value):
                top = value
            case let .bottom(value):
                bottom = value
            case let .left(value):
                left = value
            case let .right(value):
                right = value
            case let .all(value):
                top = value
                bottom = value
                left = value
                right = value
            case let .vertical(value):
                top = value
                bottom = value
            case let .horizontal(value):
                left = value
                right = value
            }
        }

        return .init(top: top, left: left, bottom: bottom, right: right)
    }
}

public extension UIStackView {
    @discardableResult
    func padding(_ length: CGFloat) -> Self {
        padding(.all(length))
        return self
    }
    
    @discardableResult
    func padding(_ edges: PaddingEdges...) -> Self {
        layoutMargins = PaddingEdgesCalculator(edges: edges).edgeInset
        isLayoutMarginsRelativeArrangement = true
        return self
    }
    
    @discardableResult
    func padding(_ edges: [PaddingEdges]) -> Self {
        layoutMargins = PaddingEdgesCalculator(edges: edges).edgeInset
        isLayoutMarginsRelativeArrangement = true
        return self
    }
}
