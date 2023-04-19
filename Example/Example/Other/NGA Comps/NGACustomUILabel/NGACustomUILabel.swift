import UIKit

open class NGACustomUILabel: UILabel {

    private let textBoundingHeightPadding: CGFloat = 8

    /// Forces the text in the label to be drawn from top left of bounds. defauls to false
    public var drawInTopLeft: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }

    /// Returns the height of the label's height
    public var textHeight: CGFloat {
        return self.calculateTextHeight()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setup()
    }

    open override var text: String? {
        didSet {
            if let text = text {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.lineSpacing = 1.0
                paragraphStyle.alignment = textAlignment
                paragraphStyle.lineBreakMode = lineBreakMode

                attributedText = NSAttributedString(
                    string: text,
                    attributes: [
                        NSAttributedString.Key.paragraphStyle: paragraphStyle
                    ]
                )
            }
        }
    }

    override open func drawText(in rect: CGRect) {

        if drawInTopLeft {

            let topInset = (rect.height - textHeight)

            let insets = UIEdgeInsets(top: -topInset, left: 0, bottom: 0, right: 0)
            super.drawText(in: rect.inset(by: insets))
        } else {
            super.drawText(in: rect)
        }
    }

    private func setup() {
        font = .systemFont(ofSize: 18, weight: .medium)
        textColor = .gray
        adjustsFontForContentSizeCategory = true
    }

    private func calculateTextHeight() -> CGFloat {
        guard let text = text else { return 0.0 }

        let context = NSStringDrawingContext()
        let textBoundingHeight = (text as NSString).boundingRect(with: CGSize(width: bounds.width, height: CGFloat(Float.infinity)),
                                                                 options: .usesLineFragmentOrigin,
                                                                 attributes: [NSAttributedString.Key.font: font!],
                                                                 context: context).height

        return textBoundingHeight + textBoundingHeightPadding
    }
}

