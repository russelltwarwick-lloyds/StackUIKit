import UIKit
import StackUIKit

final class SignUpViewController: UIViewController {
    
    // MARK: UI
    
    private let headerLabel = UILabel()
        .font(16, weight: .medium)
        .textColor(.gray)
        .text("Welcome")
    
    private let titleLabel = UILabel()
        .font(26, weight: .semibold)
        .text("Create your account")
    
    private let emailField = UITextField()
        .placeholder("adam.sandler@gmail.com")
        .borderStyle(.roundedRect)
    
    private let nameField = UITextField()
        .placeholder("Adam Sandler")
        .borderStyle(.roundedRect)
    
    private let passwordField = UITextField()
        .isSecureTextEntry(true)
        .placeholder("Password")
        .borderStyle(.roundedRect)
    
    private let passwordReEntryField = UITextField()
        .isSecureTextEntry(true)
        .placeholder("Password")
        .borderStyle(.roundedRect)
    
    private let signUpButton = UIButton()
        .font(16, weight: .semibold)
        .textColor(.white)
        .background(.brand)
        .text("Sign Up")
        .cornerRadius(6)
    
    // MARK: Init
    
    init() {
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
        view.backgroundColor = .white
    }
    
    private func setConstraints() {
        view.VStack {
            Spacer(height: 50)
            headerLabel
            titleLabel
            Spacer(height: 25)
            
            VStackView(spacing: 10) {
                emailField
                nameField
                passwordField
                passwordReEntryField
            }.padding(.bottom(25))
            
            signUpButton.frame(height: 44)
 
            Spacer()
        }
        .padding(15)
    }
}
