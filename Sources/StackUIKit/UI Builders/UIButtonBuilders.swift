import UIKit
import Foundation

public extension UIButton {
    @discardableResult
    func text(_ value: String, state: UIControl.State = .normal) -> Self {
        setTitle(value, for: state)
        return self
    }
    
    @discardableResult
    func textColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        setTitleColor(color, for: state)
        return self
    }
    
    @discardableResult
    func font(_ size: CGFloat, weight: UIFont.Weight) -> Self {
        titleLabel?.font = .systemFont(ofSize: size, weight: weight)
        return self
    }
    
    @discardableResult
    func image(named: String) -> Self {
        setImage(UIImage(named: named), for: .normal)
        return self
    }
    
    @discardableResult
    func image(_ image: UIImage) -> Self {
        setImage(image, for: .normal)
        return self
    }
}
