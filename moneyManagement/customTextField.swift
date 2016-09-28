

import Foundation
import UIKit

class customTextField : UIView,UITextViewDelegate{//UITextFieldDelegate{
    
    var label:UILabel = UILabel()
    var labelTitle = ""
    var textField:UITextView = UITextView()
    var resetBtn:UIButton = UIButton()
    
//    var textField:UITextField = UITextField()
    
    init(frame: CGRect, labelTitle:String){
        super.init(frame: frame);
        
        self.labelTitle = labelTitle
        self.backgroundColor = UIColor.lightGrayColor()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    override func drawRect(rect: CGRect) {
        
        
        label.text = labelTitle
        label.frame = CGRectMake(10, 5, 110, 20)
        self.addSubview(label)
        
        textField.frame = CGRectMake(10, 25, 220, 30)
        textField.font = UIFont.systemFontOfSize(CGFloat(20))
        if(labelTitle == "メモ"){
            textField.frame = CGRectMake(10, 25, 220, 100)
        }
        textField.delegate = self
        self.addSubview(textField)

        
        resetBtn.setTitle("消去", forState: UIControlState.Normal)
        resetBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        resetBtn.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        resetBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        resetBtn.frame = CGRectMake(190, 5, 40, 20)
        resetBtn.layer.masksToBounds = true
        self.addSubview(resetBtn)

        
        /*
        textField.frame = CGRectMake(10, 25, 220, 30)
        textField.delegate = self
        textField.borderStyle = UITextBorderStyle.RoundedRect
        self.addSubview(textField)
        */
        
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange,
        replacementText text: String) -> Bool {
            print(textView.text.characters.count)
            if text == "\n" {
                textView.resignFirstResponder() //キーボードを閉じる
                return false
            }
            if text == "" { //バックスペース
                return true
            }
            
            if(labelTitle != "memo"){
                
            }
            if(textView.text.characters.count > 99){
                return false
            }
            return true
    }
    
    internal func onClickBtn(sender: UIButton){
        textField.text! = ""        
    }


    func getText() ->String{
        return textField.text!
    }
    
    
}




