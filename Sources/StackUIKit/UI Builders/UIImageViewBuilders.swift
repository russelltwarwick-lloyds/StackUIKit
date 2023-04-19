import UIKit

public extension UIImageView {
    @discardableResult
    func image(_ value: UIImage) -> Self {
        image = value
        return self
    }
    
    @discardableResult
    func image(named: String) -> Self {
        image = UIImage(named: named)
        return self
    }

    @discardableResult
    func contentMode(_ mode: UIView.ContentMode) -> Self {
        contentMode = mode
        return self
    }
}

