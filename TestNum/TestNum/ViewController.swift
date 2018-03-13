//
//  ViewController.swift
//  TestNum
//
//  Created by XL on 2018/3/13.
//  Copyright © 2018年 ZLGB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var showView:XLDigitalAnimationView!
    var mostView:XLMultiDigitalAnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //单个
         showView = XLDigitalAnimationView(frame: CGRect(x:10, y:100, width:20, height:40),backColor:.white, textColor:.black)
        view.addSubview(showView)
        showView.layer.borderColor = UIColor.black.cgColor
        showView.layer.borderWidth = 1
       
        
        //多数字
        //计算好视图的宽和高, 以及间隔, 个数
        let mostFrame = CGRect(x: 100, y: 200, width: 150, height: 40)
         mostView = XLMultiDigitalAnimationView(frame: mostFrame, backColor: .red, textColor: .white, itemSpace: 10, itemNum: 6)
        //每个item的圆角, 默认为0
        mostView.corners = 4
        view.addSubview(mostView)
//        mostView.backgroundColor = UIColor.groupTableViewBackground
    }

    
    @IBAction func click(_ sender: Any) {
        let arr:[Int] = [getRandomNum(9, 0), getRandomNum(9, 0), getRandomNum(9, 0), getRandomNum(9, 0), getRandomNum(9, 0), getRandomNum(9, 0)]

        showView.scroll(index: getRandomNum(9, 0))
        
        //数组中是最终要展示的数字(每个数字:0-9)
        mostView.scroll(indexArray: arr)
    }
    
    private func getRandomNum(_ upper:Int,_ lower:Int) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

