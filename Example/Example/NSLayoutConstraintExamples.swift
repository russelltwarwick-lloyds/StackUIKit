import UIKit

final class NSLayoutConstraintExamples: UIViewController {
    
    private let label1:  UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "This is in a vertical stack"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .blue
        label.text = "Option 1"
        return label
    }()
    
    private let label3:  UILabel = {
        let label = UILabel()
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Option 2"
        return label
    }()
    
    private let label4:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .purple
        label.tintColor = .white
        label.text = "Take the full height"
        return label
    }()
    
    private let label5:  UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .red
        label.text = "This is in a vertical stack"
        return label
    }()

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    var test = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.axis = .vertical
        
        let stackView2 = UIStackView()
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.spacing = 10
        stackView2.axis = .horizontal
        
        let stackView3 = UIStackView()
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        stackView3.spacing = 5
        stackView3.axis = .vertical
        
        
        // Pin first stack view to superview
        
        let topSpacing = UIView()
        topSpacing.translatesAutoresizingMaskIntoConstraints = false
        topSpacing.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        stackView.fill(view: view)
        stackView.addArrangedSubViews {
            topSpacing
            label1
        }
        
        stackView.addArrangedSubViews {
            stackView2
            UIView()
        }
        
        
        stackView2.addArrangedSubViews {
            stackView3
            label4
        }
        
        stackView3.addArrangedSubViews {
            label2
            label3
        }
        
 
    }
    
}

public extension UIView {
    func fill(view: UIView) {
        view.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
