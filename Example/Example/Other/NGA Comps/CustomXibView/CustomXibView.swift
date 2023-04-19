import UIKit

final class CustomXibView: UIView {
    static let identifier = "CustomXibView"

    @IBOutlet var mainView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    
    init() {
        super.init(frame: .zero)
        initSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    func initSubviews() {

        guard let view = UINib(nibName: CustomXibView.identifier, bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Unable to convert nib")
        }

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    func configureTitleAndSubtitle(title: String, subtitle: String){
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}
