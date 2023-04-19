import UIKit

// MARK: Frame

public extension UIView {
    @discardableResult
    func frame(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority) -> Self {
        setSize(width: width, height: height, priority: priority)
    }
    
    @discardableResult
    func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        setSize(width: width, height: height)
    }

    @discardableResult
    func frame(square: CGFloat) -> Self {
        setSize(width: square, height: square)
    }

    @discardableResult
    func frame(square: CGFloat, priority: UILayoutPriority) -> Self {
        setSize(width: square, height: square, priority: priority)
    }
}

// MARK: Aspect Ratio

public extension UIView {
    @discardableResult
    func aspectRatio(width: CGFloat, height: CGFloat, priority: UILayoutPriority = .required) -> Self {
        //assert(height == .zero || width == .zero, "Aspect ratio can't divide with zero")
        let value = height / width
        translatesAutoresizingMaskIntoConstraints = false
        let anchor = widthAnchor.constraint(equalTo: heightAnchor, multiplier: value)
        anchor.priority = priority
        anchor.isActive = true
        return self
    }
}

// MARK: Private Helper Methods

private extension UIView {
    @discardableResult
    func setGreaterThan(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            width.flatMap { widthAnchor.constraint(greaterThanOrEqualToConstant: $0) },
            height.flatMap { heightAnchor.constraint(greaterThanOrEqualToConstant: $0) }
        ].compactMap {
            $0?.priority = priority
            return $0
        })
        
        return self
    }

    @discardableResult
    func setLessThan(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            width.flatMap { widthAnchor.constraint(lessThanOrEqualToConstant: $0) },
            height.flatMap { heightAnchor.constraint(lessThanOrEqualToConstant: $0) }
        ].compactMap {
            $0?.priority = priority
            return $0
        })
        
        return self
    }
}

// MARK: Center

public extension UIView {
    func center(_ view: UIView, offset: CGPoint = .zero, priority: UILayoutPriority = .required) {
        translatesAutoresizingMaskIntoConstraints = false
        centerX(view, offset: offset.x, priority: priority)
        centerY(view, offset: offset.y, priority: priority)
    }
    
    @discardableResult
    func centerX(_ view: UIView, offset: CGFloat = .zero, priority: UILayoutPriority = .required) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
    
    @discardableResult
    func centerY(_ view: UIView, offset: CGFloat = .zero, priority: UILayoutPriority = .required) -> NSLayoutConstraint? {
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset)
        constraint.priority = priority
        constraint.isActive = true
        return constraint
    }
}

// MARK: Center
// Only for certain scenarios. We can just use a stack
public extension UIView {
    func fill(view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

public extension UIView {
    // Private
    @discardableResult
    private func setSize(width: CGFloat? = nil, height: CGFloat? = nil, priority: UILayoutPriority = .required) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            width.flatMap { widthAnchor.constraint(equalToConstant: $0) },
            height.flatMap { heightAnchor.constraint(equalToConstant: $0) }
        ].compactMap {
            $0?.priority = priority
            return $0
        })
        return self
    }
}
