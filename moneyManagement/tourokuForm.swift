
//  Copyright © 2016年 jp.ne.chanma. All rights reserved.
//

import Foundation
import UIKit

class tourokuForm: UIView, UITextViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var tourokuView: UIView!
    @IBOutlet weak var titleTextField: UITextView!
    @IBOutlet weak var dateTextField: UITextView!
    @IBOutlet weak var kingakuTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextView!
    
    @IBOutlet weak var titleDelBtn: UIButton!
    @IBOutlet weak var dateDelBtn: UIButton!
    @IBOutlet weak var kingakuDelBtn: UIButton!
    @IBOutlet weak var memoDelBtn: UIButton!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // xibファイル読み込み
        NSBundle.mainBundle().loadNibNamed("tourokuForm", owner: self, options: nil)
        
        //ボタンイベントを付加
        titleDelBtn.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        titleDelBtn.tag = 0
        
        dateDelBtn.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        dateDelBtn.tag = 1
        
        kingakuDelBtn.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        kingakuDelBtn.tag = 2
        
        memoDelBtn.addTarget(self, action: "onClickBtn:", forControlEvents: .TouchUpInside)
        memoDelBtn.tag = 3

        titleTextField.delegate = self
        dateTextField.delegate = self
        kingakuTextField.delegate = self
        memoTextField.delegate = self

        
        addSubview(tourokuView)
    }
    
    override func drawRect(rect: CGRect) {
    
        print("どろーれくと")
        
    }
    
    func onClickBtn(sender: UIButton) {
        
        switch sender.tag{

        case 0:
            titleTextField.text   = ""
            break
        case 1:
            dateTextField.text    = ""
            break
        case 2:
            kingakuTextField.text = ""
            break
        case 3:
            print(33333333)
            memoTextField.text    = ""
            break
        default:
            break
        }
    }
    
    
    func getText() ->String{
        var text = titleTextField.text! + ","
        text = text + dateTextField.text! + ","
        text = text + kingakuTextField.text! + ","
        text = text + memoTextField.text!
        return text
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
            
//            if(labelTitle != "memo"){
//            }
            if(textView.text.characters.count > 99){
                return false
            }
            return true
    }

    
    func printAAA(){
        print("AAA")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}