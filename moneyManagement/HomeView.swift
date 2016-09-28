


import Foundation
import UIKit

class HomeView: UIViewController {
    
    var selectedViewID = 1 //今選ばれているView番号
    var mainView = customTabView(frame: CGRectMake(0, 200, 320, 368), tag: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(mainView)
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("aaaaaaaaaaaa")
        
    }
    internal func onClickBtn(sender: UIButton){
        
        
        switch sender.tag{

        case 0...4:
            mainView.viewSelect(sender.tag)
            selectedViewID = sender.tag
            break

        case 5:
            let mySecondViewController: sinkiTourokuView = sinkiTourokuView()
            mySecondViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            //遷移先のViewに値を渡す
            mySecondViewController.mode = selectedViewID
            self.presentViewController(mySecondViewController, animated: true, completion: nil)
            break
            
        default:
            break
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
