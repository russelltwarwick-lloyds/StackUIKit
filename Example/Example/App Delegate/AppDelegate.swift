import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
         let root = UINavigationController(rootViewController: LoginViewController(viewModel: LoginViewModel()))
         //let root = UINavigationController(rootViewController: ExamplesVC())
         //let root = UINavigationController(rootViewController: NSLayoutConstraintExamples())
        
        root.isNavigationBarHidden = true
        self.window?.rootViewController = root
        self.window?.makeKeyAndVisible()
        return true
    }
}
