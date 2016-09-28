

import Foundation
import UIKit

class commonTopBar : UIView{
    
    var backBtn = UIButton()
    var backBtnName = ""
    var isCustom = false
    var targetView = UIViewController()
    
    init(frame: CGRect, targetView:UIViewController, backBtnName:String = "戻る", isCustom:Bool = false){
        super.init(frame: frame)
        self.isCustom = isCustom
        self.targetView = targetView
        
        self.backgroundColor = UIColor.grayColor()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        
        let width:CGFloat = self.bounds.width;
        let height:CGFloat = self.bounds.height
        
        
        backBtn = UIButton()
        backBtn.setTitle("戻る", forState: UIControlState.Normal)
        backBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        backBtn.backgroundColor = UIColor.blueColor()
        backBtn.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        backBtn.frame = CGRectMake(0,0,width/4,height)
        self.addSubview(backBtn)
        
        
        //戻るボタン以外に何か追加する場合
        if(isCustom){
            
            let now = NSDate() // 現在日時の取得
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale(localeIdentifier: "en_US") // ロケールの設定
            dateFormatter.dateFormat = "yy/MM/dd HH:mm" // 日付フォーマットの設定

            let date = UILabel()
            date.text = dateFormatter.stringFromDate(now)
            date.frame = CGRectMake(width-width/2,0,width/2,height)
            self.addSubview(date)

        }
        
    }
    
    internal func onClickBtn(sender: UIButton){
        targetView.dismissViewControllerAnimated(false , completion: nil)
    }
    
}




