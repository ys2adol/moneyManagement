


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var button = UIButton()
        button.setTitle("スタート", forState: UIControlState.Normal)
        button.setTitleColor(UIColor(red: 0.39215, green: 0.35294, blue: 0.23529, alpha: 1.0), forState: UIControlState.Normal)
        button.setTitle("スタート", forState: UIControlState.Highlighted)
        button.setTitleColor(UIColor(red: 0.39215, green: 0.35294, blue: 0.23529, alpha: 1.0), forState: UIControlState.Highlighted)
        button.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        button.titleLabel?.font = UIFont.systemFontOfSize(20)
        button.frame = CGRectMake(30, 410, 120, 60)
        self.view!.addSubview(button)        
    }
    
    internal func onClickBtn(sender: UIButton){

        let mySecondViewController: HomeView = HomeView()
        mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        self.presentViewController(mySecondViewController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

