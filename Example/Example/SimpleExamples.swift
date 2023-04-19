import UIKit
import StackUIKit

final class ExamplesVC: UIViewController {
    
    private let label1 = UILabel()
        .font(16, weight: .semibold)
        .text("Examples")
    
    private let label2 = UILabel()
        .font(16, weight: .medium)
        .numberOfLines(0)
        .text("This is a long piece of text that might cross the screen")
    
    private let label3 = UILabel()
        .font(16, weight: .semibold)
        .text("Balance")
        .textColor(.white)
        .background(.black)

    private let label4 = UILabel()
        .font(16, weight: .semibold)
        .text("£10.00")
        .background(.green)
    
    
    private let label5 = UILabel()
        .font(16, weight: .semibold)
        .numberOfLines(1)
        .text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tristique pulvinar lectus vitae feugiat. Praesent malesuada tellus orci, id cursus orci malesuada ac. Duis eu odio et magna finibus pretium. Vestibulum malesuada in quam tincidunt porttitor. Suspendisse et laoreet justo, a dictum mi. Donec dignissim ultricies neque in consequat. Sed in augue eu neque accumsan vulputate in non augue. Integer porta fermentum hendrerit. Etiam blandit euismod sem, id dignissim justo faucibus et. Nullam commodo ipsum est, a viverra tortor elementum et. Nulla facilisi. Sed eget erat nulla. Aliquam volutpat ex magna, eu rhoncus eros porta sit amet. In malesuada erat eu dignissim mattis. Donec blandit erat a molestie semper. Vestibulum in mollis est. Donec ac odio leo. Phasellus vitae ullamcorper velit. Praesent sagittis dignissim pulvinar. Ut vehicula faucibus blandit. In hac habitasse platea dictumst. Vestibulum dapibus erat arcu, fringilla blandit dolor sodales vel. Phasellus pretium erat nibh, a iaculis ex suscipit quis. Mauris est diam, auctor eu fermentum nec, laoreet vitae turpis. Vestibulum at nisl id risus varius ultricies. Suspendisse varius feugiat lacus vitae faucibus. Nulla viverra lectus ut sagittis viverra. In a accumsan ante. Aenean euismod urna elit, a dictum orci venenatis et. Quisque eleifend libero at arcu facilisis, eu vestibulum leo consequat. Mauris suscipit ac libero non venenatis. Integer non enim quis nulla faucibus malesuada sed a neque. Phasellus neque nisi, interdum ac dapibus sed, auctor vitae libero. Maecenas gravida mattis felis a tincidunt. Aliquam erat volutpat. Nullam nulla eros, scelerisque sed congue sed, venenatis id nulla. Aliquam ultrices a tortor eget sagittis. Sed est metus, pulvinar et massa et, cursus blandit ante. Sed dignissim mollis arcu id consectetur. Donec a leo metus. Aenean ultricies nunc dictum, consequat metus eu, aliquet risus. Vestibulum auctor libero et ante pharetra maximus.")
        .background(.green)
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // simpleVStack()
        // simpleHStack()
        // advancedStacks()
        // scrollStacks()
        scrollStacks2()
    }
        
    // MARK: Examples
    
    private func simpleVStack() {
        view.VStack {
            label1
            label2
            Spacer()
        }
    }
    
    private func simpleHStack() {
        view.VStack {
            label1
            label2
        }
    }
    
    private func advancedStacks() {
        view.VStack {
            label1
            label2
            HStack {
                label3.frame(width: 40)
                Spacer()
            }
            Spacer()
        }
    }
    
    private func scrollStacks() {
        view.VScroll(useSafeArea: false) {
            label1
            label2
            Spacer(height: 50)
            HScroll {
                label3.frame(width: 40)
                label5.frame(height: 50)
            }
            .alwaysBounceHorizontal(true)
            .spacing(10)
            
            
            Spacer()
        }
        .alwaysBounceVertical(true)
        .padding(20)
    }
    
    private func scrollStacks2() {
        view.VScroll(useSafeArea: false) {
            label1
            label2
            Spacer(height: 50)
            HScroll {
                label3.frame(width: 40)
            }
            .alwaysBounceHorizontal(true)
            .spacing(10)
            
            label5.numberOfLines(0)
            Spacer()
        }
        .alwaysBounceVertical(true)
        .padding(20)
    }
}
