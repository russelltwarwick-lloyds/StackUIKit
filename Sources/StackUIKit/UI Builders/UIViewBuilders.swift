import UIKit

public extension UIView {
    @discardableResult
    func background(_ color: UIColor) -> Self {
        backgroundColor = color
        return self
    }
    
    @discardableResult
    func userInteractionEnabled(_ value: Bool) -> Self {
        isUserInteractionEnabled = value
        return self
    }
    
    @discardableResult
    func autoMaskConstraints(_ value: Bool) -> Self {
        translatesAutoresizingMaskIntoConstraints = value
        return self
    }
    
    @discardableResult
    func alpha(_ value: CGFloat) -> Self {
        alpha = value
        return self
    }
}

// MARK: Corners

public extension UIView {
    @discardableResult
    func cornerRadius(_ radius: CGFloat) -> Self {
        layer.cornerRadius = radius
        layer.maskedCorners =  .all
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func cornerRadius(_ radius: CGFloat?, corners: CACornerMask) -> Self {
        layer.cornerRadius = radius ?? .zero
        layer.maskedCorners = corners
        layer.masksToBounds = true
        return self
    }
    
    @discardableResult
    func applyShadow(radius: CGFloat = 2.0, alpha: Float = 0.1) -> Self {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .init(width: 0, height: 1)
        layer.shadowRadius = radius
        layer.shadowOpacity = alpha
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath.init(rect: bounds).cgPath
        return self
    }
}

public extension CACornerMask {
    static var topLeft: CACornerMask {
        .layerMinXMinYCorner
    }
    
    static var topRight: CACornerMask {
        .layerMaxXMinYCorner
    }
    
    static var bottomLeft: CACornerMask {
        .layerMinXMaxYCorner
    }
    
    static var bottomRight: CACornerMask {
        .layerMaxXMaxYCorner
    }
    
    static var all: CACornerMask {
        [topLeft,
         topRight,
         bottomLeft,
         bottomRight]
    }
}
