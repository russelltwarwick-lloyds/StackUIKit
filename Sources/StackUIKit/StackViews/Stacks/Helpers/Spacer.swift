import UIKit

public final class Spacer: UIView {

    public init() {
        super.init(frame: .zero)
    }

    public init(width: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }

    public init(height: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    public init(square: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: square).isActive = true
        heightAnchor.constraint(equalToConstant: square).isActive = true
    }
    
    public init(width: CGFloat, height: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: width).isActive = true
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    @discardableResult
    public func color(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    public func interactionEnabled(_ value: Bool) -> Self {
        isUserInteractionEnabled = value
        return self
    }
}
