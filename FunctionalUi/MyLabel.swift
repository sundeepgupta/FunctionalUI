import UIKit

class MyLabel: UILabel {
    var parent = UIView()
    var props = [String: Any]()
    
    convenience init (parent: UIView, frame: CGRect, props: [String: Any]) {
        self.init(frame: frame)
        
        self.props = props
        self.parent = parent
        
        self.render()
    }
    
    override init (frame : CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func render() {
        self.text = (self.props["text"] as! String)
        
        self.parent.addSubview(self)
    }
}

class MyButton: UIButton {
    var parent = UIView()
    var props = [String: Any]()
    
    convenience init (parent: UIView, frame: CGRect, props: [String: Any]) {
        self.init(frame: frame)
        
        self.props = props
        self.parent = parent
        
        self.render()
    }
    
    override init (frame : CGRect) {
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    
    func render() {
        self.setTitle((self.props["title"] as! String), forState: .Normal)
        self.backgroundColor = UIColor.blackColor()
        self.addTarget(self, action: "onChange", forControlEvents: .TouchUpInside)
        
        self.parent.addSubview(self)
    }
    
    func onChange() {
        let action = self.props["action"] as! () -> ()
        action()
    }
}

