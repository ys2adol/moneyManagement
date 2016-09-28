

import Foundation
import UIKit

class sinkiTourokuView: UIViewController ,UITextFieldDelegate{
    
    var titleField:UITextField!
    var kingakuField:UITextField!
    var dateField:UITextField!
    var allDelBtn:UIButton = UIButton()
    var tourokuBtn:UIButton = UIButton()
    var tourokuView = tourokuForm()
    var titleTextField = customTextField(frame: CGRectMake(0, 0, 0, 0), labelTitle: "タイトル")
    var kingakuTextField = customTextField(frame: CGRectMake(0, 0, 0, 0), labelTitle: "金額")
    var dateTextField = customTextField(frame: CGRectMake(0, 0, 0, 0), labelTitle: "日付")
    var memoTextField = customTextField(frame: CGRectMake(0, 0, 0, 0), labelTitle: "メモ")
    var mode = 0
    
    var kingakuArr :[String] = []
    var defaults = NSUserDefaults.standardUserDefaults()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        kingakuArr = getUserDefault(1) as! Array

        
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        //共通部品トップバー
        let topBar = commonTopBar(frame: CGRectMake(0, 40, 320, 30), targetView: self,isCustom:true)
        self.view.addSubview(topBar)

        let textView = UILabel(frame:CGRectMake(0,80,320,40))
        textView.textAlignment = NSTextAlignment.Center
        textView.text = convertMode(mode) + "新規登録"
        self.view.addSubview(textView)
        
        //xibファイルで実装
        tourokuView.frame = CGRectMake(0, 110, 320, 374)
        self.view.addSubview(tourokuView)

        tourokuView.printAAA()
        
        allDelBtn.setTitle("全消去", forState: UIControlState.Normal)
        allDelBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        allDelBtn.addTarget(self, action: "onClickbtn:", forControlEvents: .TouchUpInside)
        allDelBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        allDelBtn.tag = 1
        allDelBtn.frame = CGRectMake(60, 500, 80, 30)
        allDelBtn.layer.masksToBounds = true
        self.view.addSubview(allDelBtn)


        tourokuBtn.setTitle("登録", forState: UIControlState.Normal)
        tourokuBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        tourokuBtn.addTarget(self, action: "onClickbtn:", forControlEvents: .TouchUpInside)
        tourokuBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        tourokuBtn.tag = 2
        tourokuBtn.frame = CGRectMake(180, 500, 80, 30)
        tourokuBtn.layer.masksToBounds = true
        self.view.addSubview(tourokuBtn)

    }
    
    internal func onClickbtn(sender: UIButton){

        
        tourokuView.printAAA()

        switch sender.tag {
        case 1:
            print(1)
            break
        case 2:

            kingakuArr.append(tourokuView.getText())
            setArray()
            print(kingakuArr.count)
            for(var i=0; i<kingakuArr.count; i++){
                print(kingakuArr[i])
            }
            break
        default:
            break
        }
        
        
        
        /*
        let text = titleTextField.getText() + "," +
                   kingakuTextField.getText() + "," +
                   dateTextField.getText() + "," +
                   memoTextField.getText()
        
        print(text)
*/
        /*
        var alertController = UIAlertController(title: "UIAlertControllerStyle.Alert", message: "iOS8", preferredStyle: .Alert)
        
        let otherAction = UIAlertAction(title: "はい", style: .Default) {
            action in
            print("\(self.titleField.text)")
            print("\(self.kingakuField.text)")
            print("\(self.dateField.text)")

        }
        let cancelAction = UIAlertAction(title: "いいえ", style: .Cancel) {
            action in NSLog("いいえボタンが押されました")
        }
        
        // addActionした順に左から右にボタンが配置されます
        alertController.addAction(otherAction)
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
*/

    }
    
    func convertMode(mode:Int) ->String{
        
        var str = ""
        switch mode {
        case 1: str = "入金"; break
        case 2: str = "出金"; break
        case 3: str = "経費"; break
        case 4: str = "残金"; break
            
        default:  break
        }
        return str
    }
    
    func getUserDefault(tag:Int) -> NSArray{
        
        var userDatas: [String] = []
        
        if((defaults.objectForKey("nyukinData")) != nil){
            let objects = defaults.objectForKey("nyukinData") as? NSArray
            for nameString in objects!{
                userDatas.append(nameString as! String)
            }
        }
        
        return userDatas
        
    }
    /*
    //ボタンクリックイベント
    func onClickBtn(sender: UIButton){
        
        kingakuArr.append("aaaaaaa")
        setArray()
        print(kingakuArr.count)
    }
    */
    
    //userDefault に保存
    func setArray(){
        
        defaults.setObject(kingakuArr, forKey:"nyukinData")
        // シンクロを入れないとうまく動作しないときがあります
        defaults.synchronize()
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
