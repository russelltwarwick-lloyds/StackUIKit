import UIKit

public extension UITextField {
    
    @discardableResult
    func font(_ size: CGFloat, weight: UIFont.Weight) -> Self {
        font = .systemFont(ofSize: size, weight: weight)
        return self
    }
    
    @discardableResult
    func placeholder(_ value: String) -> Self {
        placeholder = value
        return self
    }
    
    @discardableResult
    func text(_ value: String) -> Self {
        text = value
        return self
    }
    
    @discardableResult
    func isSecureTextEntry(_ value: Bool) -> Self {
        isSecureTextEntry = value
        return self
    }
    
    @discardableResult
    func borderStyle(_ style: UITextField.BorderStyle) -> Self {
        borderStyle = style
        return self
    }
}
