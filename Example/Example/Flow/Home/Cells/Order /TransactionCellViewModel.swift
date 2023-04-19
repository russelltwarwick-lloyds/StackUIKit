import UIKit

struct TransactionCellViewModel {
    
    // MARK: - Dependenies
    
    let order: TransactionModel
    
    // MARK: - Interface
    
    var amountText: String {
        order.amount
    }

    var icon: String {
        order.received ? "arrow-down" : "arrow-up"
    }
    
    var amountLabelColor: UIColor {
        order.received ? .brand : .red
    }
    
    var dateText: String {
        order.date
    }
    
    var nameText: String {
        order.name
    }
}
