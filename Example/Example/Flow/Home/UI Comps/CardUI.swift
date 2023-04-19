import UIKit
import StackUIKit

final class CardUI: UIView {
    
    // MARK: UI
    
    private let debitCard = UIView()
        .background(.brand)
        .cornerRadius(6)
    
    private let visaLogo = UIImageView()
        .image(named: "visa")
        .contentMode(.scaleAspectFit)
        .autoMaskConstraints(true)
    
    // MARK: Init
    
    init() {
        super.init(frame: .zero)
        setConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func update(_ color: UIColor) {
        debitCard.backgroundColor = color
    }
    
    // MARK:
    
    private func setConstraints() {
        ZStack {
            debitCard.frame(width: 65, height: 40)
            VStack {
                HStack {
                    visaLogo.frame(width: 28, height: 15)
                }.alignment(.bottom)
            }.alignment(.trailing)
            .padding(4)
        }.frame(width: 65, height: 40)
    }
}
