import UIKit
import StackUIKit

final class AccountOverviewCell: UITableViewCell {
    
    // MARK: - UI
    
    private let card = UIView()
        .background(.surface)
        .cornerRadius(.cardCorner)
    
    private let titleLabel = UILabel()
        .font(16, weight: .medium)
        .textColor(.gray)
    
    private let balanceLabel = UILabel()
        .font(29, weight: .semibold)
    
    private let requestsLabel = UILabel()
        .font(13, weight: .medium)
    
    private let notificationsLabel = UILabel()
        .font(13, weight: .medium)
    
    private let moreButton = UIButton()
        .text("More")
        .font(14, weight: .bold)
        .textColor(.brand)
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var viewModel: AccountOverviewCellViewModel? {
        didSet {
            titleLabel.text = viewModel?.titleText
            balanceLabel.text = viewModel?.balanceText
            requestsLabel.text = viewModel?.requestsText
            notificationsLabel.text = viewModel?.notificationsText
        }
    }
    
    // MARK: - Configure
    
    private func configure(){
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    }
    
    private func setConstraints(){
        contentView.ZStack {
            card
            VStack {
                titleLabel
                Spacer(height: 5)
                balanceLabel
                HStack(spacing: 10) {
                    requestsLabel
                    notificationsLabel
                    Spacer()
                    moreButton
                }.frame(height: 24)
            }.padding(12)
        }.padding(.horizontal(12), .bottom(12))
    }
}
