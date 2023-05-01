import UIKit
import StackUIKit

final class AccountHeaderCell: UITableViewCell {
    
    // MARK: - UI
    
    private let titleLabel: NGACustomUILabel = {
        let label = NGACustomUILabel()
        label.numberOfLines = 4
        return label
    }()
    
    private let initialsLabel = UILabel()
        .font(16, weight: .bold)
        .textColor(.white)
        .alignment(.center)
    
    private let initialsView = UIView()
        .background(.brand)
        .cornerRadius(18)
    
    private let searchIcon = UIImageView()
        .image(named: "search-icon")
        .alpha(0.4)
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var viewModel: AccountHeaderViewModel? {
        didSet {
            titleLabel.text = viewModel?.titleText
            initialsLabel.text = viewModel?.initialsText
        }
    }
    
    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none

    }
    
    private func setConstraints(){
        initialsView.VStack {
            initialsLabel
        }
        
        contentView.HStack {
            ZStack {
                initialsView
                initialsLabel
            }.frame(square: 36)
            Spacer(width: 10)
            titleLabel
            Spacer()
            searchIcon.frame(square: 20)
        }.padding(.horizontal(12), .bottom(10))
        .alignment(.center)
    }
}
