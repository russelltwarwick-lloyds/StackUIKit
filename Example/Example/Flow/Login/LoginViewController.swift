import UIKit
import StackUIKit

final class LoginViewController: UIViewController {
    
    // MARK: UI
        
    private let headerLabel = NGACustomUILabel()
    
    private let customView = CustomXibView()
    
    private let titleLabel = UILabel()
        .textColor(.black)
        .font(26, weight: .semibold)
    
    private let emailField = UITextField()
        .placeholder("adam.sandler@gmail.com")
        .borderStyle(.roundedRect)
    
    private let passwordField = UITextField()
        .isSecureTextEntry(true)
        .placeholder("Password")
        .borderStyle(.roundedRect)
    
    private let loginButton = UIButton()
        .font(16, weight: .semibold)
        .textColor(.white)
        .background(.black)
        .text("Login")
        .cornerRadius(6)
    
    private let googleLoginButton = UIButton()
        .font(16, weight: .semibold)
        .textColor(.white)
        .background(.brand)
        .text("Login with Google")
        .cornerRadius(6)

    private let signUpButton = UIButton()
        .font(12, weight: .semibold)
        .textColor(.brand)
        .text("No account? Create account")
    
    // MARK: Dependencies
    
    private let viewModel: LoginViewModel
    
    // MARK: Init
    
    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        styleView()
        setConstraints()
        bindViewModel()
        bindUIActions()
    }
    
    // MARK: Set up
    
    private func styleView() {
        view.backgroundColor = .white
    }
    
    private func setConstraints() {
        view.VStack {
            headerLabel.frame(height: 30)
            titleLabel
            Spacer(height: 25)
            
            VStackView(spacing: 10) {
                emailField
                passwordField
            }.padding(.bottom(25))
            
            VStackView(spacing: 10) {
                loginButton.frame(height: 44)
                
                if viewModel.googleSignInFeatureFlag {
                    googleLoginButton.frame(height: 44)
                }
            }
            
            signUpButton
            Spacer()
        }
        .padding(15)
    }
    
    // MARK: Bind
    
    private func bindViewModel() {
        headerLabel.text = viewModel.headerText
        titleLabel.text = viewModel.titleText
    }
    
    private func bindUIActions() {
        loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        googleLoginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    
    // MARK: Actions
    
    @objc private func didTapLogin() {
        navigationController?.show(HomeViewController(viewModel: HomeViewModel()), sender: self)
    }
    
    @objc private func didTapSignUp() {
        present(SignUpViewController(), animated: true)
    }
}
