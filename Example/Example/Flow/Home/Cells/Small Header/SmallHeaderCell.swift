import UIKit
import StackUIKit

final class SmallHeaderCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel = UILabel()
        .font(15, weight: .semibold)
        .textColor(.darkGray)
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var text: String? {
        didSet {
            titleLabel.text = text
        }
    }
    
    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setConstraints(){
        contentView.VStack {
            titleLabel
        }.padding(.horizontal(12), .bottom(10))
    }
}
