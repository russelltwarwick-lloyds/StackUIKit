import UIKit
import StackUIKit

final class CardCell: UITableViewCell {
    
    // MARK: - UI
    
    private let cardView = UIView()
        .cornerRadius(.cardCorner)
        .background(.surface)
    
    private let titleLabel = UILabel()
        .font(13, weight: .semibold)
        .textColor(.darkGray)
    
    private let balanceLabel = UILabel()
        .font(18, weight: .semibold)
    
    private let debitCard = CardUI()
                    
    // MARK: - Init
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - ViewModel
    
    var viewModel: CardCellViewModel? {
        didSet {
            guard let viewModel else { return }
            titleLabel.text = viewModel.titleText
            balanceLabel.text = viewModel.balanceText
            debitCard.update(viewModel.cardColor)
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
                debitCard
                
                Spacer(width: 10)
                VStack {
                    titleLabel
                    balanceLabel
                }
                Spacer()
                UIImageView()
                    .image(named: "chevron-right")
                    .contentMode(.scaleAspectFit)
            }
            .padding(12)
            .alignment(.center)
        }.padding(.horizontal(12), .bottom(12))
    }
}
