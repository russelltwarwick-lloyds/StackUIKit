import UIKit
import StackUIKit

final class TransactionCell: UITableViewCell {
    
    // MARK: - UI
    
    private let cardView = UIView()
        .cornerRadius(.cardCorner)
        .background(.surface)
    
    private let iconImage = UIImageView()
        .image(named: "arrow-down")
        .contentMode(.scaleAspectFit)
        .alpha(0.3)
    
    private let amountLabel = UILabel()
        .font(16, weight: .bold)
        .alignment(.right)
    
    private let dateLabel = UILabel()
        .font(13, weight: .medium)
        .textColor(.gray)
    
    private let nameLabel = UILabel()
        .font(16, weight: .semibold)
    
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var viewModel: TransactionCellViewModel? {
        didSet {
            amountLabel.text = viewModel?.amountText
            amountLabel.textColor(viewModel?.amountLabelColor ?? .black)
            iconImage.image = .init(named: viewModel?.icon ?? "")
            dateLabel.text = viewModel?.dateText
            nameLabel.text = viewModel?.nameText
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
            cardView
            HStack {
                iconImage
                Spacer(width: 10)
                VStack(spacing: 3) {
                    nameLabel
                    dateLabel
                }
                Spacer()
                amountLabel
            }.alignment(.center)
            .padding(12)
        }.padding(.horizontal(12), .bottom(12))
    }
}
