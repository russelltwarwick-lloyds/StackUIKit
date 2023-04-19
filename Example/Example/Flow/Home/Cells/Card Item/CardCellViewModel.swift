import UIKit

struct CardCellViewModel {
    
    let model: CardModel
    
    var titleText: String {
        model.title
    }
    
    var balanceText: String {
        model.balance
    }
    
    var cardColor: UIColor {
        model.cardColor
    }
}
