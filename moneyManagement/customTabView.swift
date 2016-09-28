


import Foundation
import UIKit

class customTabView : UIView{
    
    var nyukinTab   = UIButton(); var syukkinTab  = UIButton()
    var keihiTab    = UIButton(); var zankinTab   = UIButton()
    var nyukinView  = UIView()  ; var syukkinView = UIView()
    var keihiView   = UIView()  ; var zankinView  = UIView()
    var viewArr:[UIView] = []
    var pageNo = 1
    
    init(frame: CGRect, tag:Int){
        super.init(frame: frame);
        self.tag =  tag;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawRect(rect: CGRect) {
        
        
        //ビュー選択ボタン
        nyukinTab.setTitle("入金", forState: UIControlState.Normal)
        nyukinTab.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        nyukinTab.addTarget(HomeView(), action: "onClickBtn:", forControlEvents: .TouchUpInside)
        nyukinTab.titleLabel?.font = UIFont.systemFontOfSize(20)
        nyukinTab.tag = 1
        nyukinTab.frame = CGRectMake(0, 0, 80, 30)
        self.addSubview(nyukinTab)

        syukkinTab.setTitle("出金", forState: UIControlState.Normal)
        nyukinTab.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        syukkinTab.addTarget(HomeView(), action: "onClickBtn:", forControlEvents: .TouchUpInside)
        syukkinTab.titleLabel?.font = UIFont.systemFontOfSize(20)
        syukkinTab.tag = 2
        syukkinTab.frame = CGRectMake(80, 0, 80, 30)
        self.addSubview(syukkinTab)
        
        keihiTab.setTitle("経費", forState: UIControlState.Normal)
        nyukinTab.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        keihiTab.addTarget(HomeView(), action: "onClickBtn:", forControlEvents: .TouchUpInside)
        keihiTab.titleLabel?.font = UIFont.systemFontOfSize(20)
        keihiTab.tag = 3
        keihiTab.frame = CGRectMake(160, 0, 80, 30)
        self.addSubview(keihiTab)
        
        zankinTab.setTitle("残金", forState: UIControlState.Normal)
        nyukinTab.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        zankinTab.addTarget(HomeView(), action: "onClickBtn:", forControlEvents: .TouchUpInside)
        zankinTab.titleLabel?.font = UIFont.systemFontOfSize(20)
        zankinTab.tag = 4
        zankinTab.frame = CGRectMake(240, 0, 80, 30)
        self.addSubview(zankinTab)

        
        var shinkiBtn = UIButton()
        shinkiBtn.setTitle("新規登録2", forState: UIControlState.Normal)
        shinkiBtn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        shinkiBtn.backgroundColor = UIColor.whiteColor()
        shinkiBtn.addTarget(HomeView(), action: "onClickBtn:", forControlEvents: .TouchUpInside)
        shinkiBtn.titleLabel?.font = UIFont.systemFontOfSize(20)
        shinkiBtn.tag = 5
        shinkiBtn.frame = CGRectMake(0,30,320,40)
        self.addSubview(shinkiBtn)
        
        //各表示ビュー
        
        nyukinView  = tabView(frame: CGRectMake(0, 70, 320, 318), tag:1)
        nyukinView.backgroundColor = UIColor.redColor()
        self.addSubview(nyukinView)
        
        syukkinView = tabView(frame: CGRectMake(0, 70, 320, 318), tag:2)
        syukkinView.backgroundColor = UIColor.blueColor()
        self.addSubview(syukkinView)
        
        keihiView   = tabView(frame: CGRectMake(0, 70, 320, 318), tag:3)
        keihiView.backgroundColor = UIColor.greenColor()
        self.addSubview(keihiView)
        
        zankinView  = tabView(frame: CGRectMake(0, 70, 320, 318), tag:4)
        zankinView.backgroundColor = UIColor.yellowColor()
        self.addSubview(zankinView)

        self.bringSubviewToFront(nyukinView)
        
        
    }
    
    func viewSelect(tag:Int){
        //配列の数字を揃えるためzeroViewを入れているだけ　実際は使用しない
        let zeroView  = UIView()
        viewArr = [zeroView,nyukinView,syukkinView,keihiView,zankinView]
        self.bringSubviewToFront(viewArr[tag])
    }
    
}







