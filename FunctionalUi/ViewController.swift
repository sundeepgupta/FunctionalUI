import UIKit

class ViewController: UIViewController {
    private dynamic var state = ["count": 0]
    private var label = MyLabel()
    private var button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.render()
    }
    
    func incrementCount() {
        let count = self.state["count"]!
        self.state["count"] = count + 1
        self.stateChanged()
    }
    
    
    
    // MARK: - Private
    private func stateChanged() {
        self.render()
    }
    
    private func render() {
        self.renderLabel()
        self.renderButton()
    }
    
    private func renderLabel() {
        let count = self.state["count"]
        let countString = "\(count!)"
        guard self.label.text != countString else { return }
        
        self.label.removeFromSuperview()
        
        let frame = CGRectMake(100, 100, 100, 100)
        let props: [String: Any] = ["text": countString]
        self.label = MyLabel(parent: self.view, frame: frame, props: props)
    }
    
    private func renderButton() {
        let buttonTitle = self.buttonTitle()
        guard buttonTitle != self.button.titleForState(.Normal) else { return }
        
        self.button.removeFromSuperview()
        
        let frame = CGRectMake(100, 200, 100, 100)
        let action = { self.incrementCount() }
        let props: [String: Any] = ["title": buttonTitle, "action": action]
        self.button = MyButton(parent: self.view, frame: frame, props: props)
    }
    
    private func buttonTitle() -> String {
        let count = self.state["count"]
        
        if count > 0 {
            return "Increment"
        }
        
        return "Start"
    }
}

