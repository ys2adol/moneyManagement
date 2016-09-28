

import Foundation
import UIKit

class tabView : UIView{
    
    var status = 1
    var nyukinArr :[String] = [],syukkinArr:[String] = [],keihiArr  :[String] = [],zankinArr :[String] = []
    var kingakuLabel = UILabel()
    var defaults = NSUserDefaults.standardUserDefaults()
    var viewStatus = 0
    
    init(frame: CGRect, tag:Int){
        super.init(frame: frame);
        self.tag =  tag;
        self.nyukinArr = self.getUserDefault(self.tag) as! Array
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    override func drawRect(rect: CGRect) {
        /*
        var shinkiBtn = UIButton()
        shinkiBtn.setTitle("新規登録", forState: UIControlState.Normal)
        shinkiBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        shinkiBtn.backgroundColor = UIColor.whiteColor()
        shinkiBtn.addTarget(self, action: "onClickbtn:", forControlEvents: .TouchUpInside)
        shinkiBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        shinkiBtn.tag = 5
        shinkiBtn.frame = CGRectMake(0,30,320,40)
        self.addSubview(shinkiBtn)
*/
        
        switch self.tag{
        case 1:
            
            for (var i = 0 ; i < 5 ; i++ ) {
                
                if(nyukinArr.count > i){
                    let listView = UIView(),label = UILabel()
                    listView.backgroundColor = UIColor.whiteColor()
                    listView.frame = CGRectMake(0, CGFloat(i*50), 320, 50)
                    label.text = "No." + String(i+1) + " " + nyukinArr[i]
                    label.frame = CGRectMake(0, 0, 320, 30)
                    listView.addSubview(label)
                    self.addSubview(listView)
                }

            }
            
            
            
            
            
            
            
            
            break
        case 2:
            break
        case 3:
            break
        case 4:
            break
        default:
            break
        }
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
    
    //ボタンクリックイベント
    func onClickBtn(sender: UIButton){
        
        nyukinArr.append("aaaaaaa")
        nyukinArr[46] = "henkousimasita"
        setArray()
        print(self.tag)
        print(nyukinArr.count)
    }
    
    //userDefault に保存
    func setArray(){
        
        defaults.setObject(nyukinArr, forKey:"nyukinData")
        // シンクロを入れないとうまく動作しないときがあります
        defaults.synchronize()
    }
    
}




