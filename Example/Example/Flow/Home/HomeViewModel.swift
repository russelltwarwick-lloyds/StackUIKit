import UIKit

enum HomeItem {
    case accountHeader(AccountHeaderViewModel)
    case overview(AccountOverviewCellViewModel)
    case smallHeader(String)
    case card(CardModel)
    case transaction(TransactionModel)
}

final class HomeViewModel {
        
    // MARK: - Interface
    
    func cellItem(for indexPath: IndexPath) -> HomeItem {
        items[indexPath.row]
    }
    
    var numberOfRows: Int {
        items.count
    }
    
    var numberOfSections: Int {
        1
    }
}

extension HomeViewModel {
    
    // MARK: - Items
    
    private var items: [HomeItem] {
        var items: [HomeItem] = [.accountHeader(.init()), .overview(.init())]
        
        items.append(.smallHeader("Cards"))
        items.append(contentsOf: cardModels.map { .card($0) })
        
        items.append(.smallHeader("Transactions"))
        items.append(contentsOf: transactionModels.map { .transaction($0) })
        
        return items
    }
    
    // MARK: - Stub data
    
    private var cardModels: [CardModel] {
        [.init(title: "Stocks", balance: "£2,405.31", cardColor: .cardPurple),
         .init(title: "Main Card", balance: "£1,762.92", cardColor: .cardOrange)]
    }
    
    private var transactionModels: [TransactionModel] {
        [.init(name: "Github", received: false, date: "10 April 15:33", amount: "£122.71"),
         .init(name: "Dad", received: true, date: "10 April 15:27", amount: "£50.00"),
         .init(name: "Mum", received: true, date: "10 April 11:49", amount: "£50.00"),
         .init(name: "BP Garage", received: false, date: "9 April 04:31", amount: "£25.51"),
         .init(name: "M&S", received: false, date: "8 April 12:15", amount: "£7.24"),
         .init(name: "Massimo Dutti", received: false, date: "7 April 21:25", amount: "£49.99"),
         .init(name: "Zara", received: false, date: "7 April 19:18", amount: "£20.00"),
         .init(name: "Tesco", received: false, date: "7 April 17:42", amount: "£3.17"),
         .init(name: "Apple", received: true, date: "6 April 13:38", amount: "£1190.00"),
         .init(name: "Gather & Gather", received: false, date: "5 April 12:55", amount: "£5.22"),
         .init(name: "Pret", received: false, date: "5 April 09:26", amount: "£3.30"),
         .init(name: "TFL", received: false, date: "5 April 09:00", amount: "£6.00")]
    }
}
