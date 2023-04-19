import UIKit
import StackUIKit

final class HomeViewController: UIViewController {
    
    // MARK: UI
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CardCell.self, forCellReuseIdentifier: "CardCell")
        tableView.register(TransactionCell.self, forCellReuseIdentifier: "TransactionCell")
        tableView.register(AccountOverviewCell.self, forCellReuseIdentifier: "AccountOverviewCell")
        tableView.register(AccountHeaderCell.self, forCellReuseIdentifier: "AccountHeaderCell")
        tableView.register(SmallHeaderCell.self, forCellReuseIdentifier: "SmallHeaderCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: Dependencies
    
    private let viewModel: HomeViewModel
    
    // MARK: Init
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        setConstraints()
    }
    
    // MARK: Set up
    
    private func styleView() {
        view.backgroundColor = .background
    }
    
    private func setConstraints() {
        view.VStack(useSafeArea: false) {
            tableView
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        switch viewModel.cellItem(for: indexPath) {
        case .accountHeader(let vm):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountHeaderCell", for: indexPath) as! AccountHeaderCell
            cell.viewModel = vm
            return cell
            
        case .smallHeader(let value):
            let cell = tableView.dequeueReusableCell(withIdentifier: "SmallHeaderCell", for: indexPath) as! SmallHeaderCell
            cell.text = value
            return cell
            
        case .overview(let vm):
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccountOverviewCell", for: indexPath) as! AccountOverviewCell
            cell.viewModel = vm
            return cell
            
        case .card(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
            cell.viewModel = .init(model: model)
            return cell
            
        case .transaction(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
            cell.viewModel = .init(order: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows
    }
}
