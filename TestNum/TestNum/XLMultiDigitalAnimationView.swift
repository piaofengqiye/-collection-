//
//  XLMultiDigitalAnimationView.swift
//  TestNum
//
//  Created by XL on 2018/3/13.
//  Copyright © 2018年 ZLGB. All rights reserved.
//

import UIKit

class XLMultiDigitalAnimationView: UIView {
    private var collectViewBackColor:UIColor!
    private var itemTextColor:UIColor!
    private var itemSpace:CGFloat!
    private var dataNum:Int = 0
    var corners:CGFloat = 0
    init(frame:CGRect, backColor:UIColor, textColor:UIColor, itemSpace:CGFloat, itemNum:Int) {
        super.init(frame: frame)
        itemTextColor = textColor
        collectViewBackColor = backColor
        dataNum = itemNum
        self.itemSpace = itemSpace
        addCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func scroll(indexArray:[Int]) -> Void {
        guard indexArray.count == dataNum else {
            print("数组个数不对")
            return
        }
        for i in 0..<dataNum {
            let collectionView:UICollectionView = viewWithTag(i + 1000)as!UICollectionView
            collectionView.scrollToItem(at: IndexPath.init(item: indexArray[i], section: 0), at: .bottom, animated: true)
        }
    }
    

}
extension XLMultiDigitalAnimationView {
    private func addCollectionView() {
        for i in 0..<dataNum {
            
            let width:CGFloat = (self.bounds.size.width - CGFloat(dataNum - 1) * CGFloat(itemSpace)) / CGFloat(dataNum)
            let x:CGFloat = (itemSpace + width) * CGFloat(i)
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            let collectionView = UICollectionView(frame: CGRect(x:x, y:0, width:width, height:self.bounds.size.height), collectionViewLayout: layout)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(XLMultiDigitalAnimationViewItem.self, forCellWithReuseIdentifier: "XLMultiDigitalAnimationViewItem")
            collectionView.backgroundColor = .clear
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.isScrollEnabled = false
            //        collectionView.isPagingEnabled = true
            collectionView.tag = i + 1000
            self.addSubview(collectionView)
        }
        
    }
}

extension XLMultiDigitalAnimationView:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    //MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:XLMultiDigitalAnimationViewItem = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: XLMultiDigitalAnimationViewItem.self), for: indexPath) as!XLMultiDigitalAnimationViewItem
        cell.titleLbl.text = String.init(format: "%d", indexPath.item)
        cell.titleLbl.textColor = itemTextColor
        cell.contentView.layer.cornerRadius = corners
        cell.contentView.layer.masksToBounds = true
        cell.contentView.backgroundColor = collectViewBackColor
        return cell
    }
    
    
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width:CGFloat = (self.bounds.size.width - CGFloat(dataNum - 1) * CGFloat(itemSpace)) / CGFloat(dataNum)
        return CGSize(width: width, height: self.bounds.size.height)
    }
}

class XLMultiDigitalAnimationViewItem: UICollectionViewCell {
    var titleLbl:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleLbl = UILabel()
        contentView.addSubview(titleLbl)
        titleLbl.frame = contentView.bounds
        titleLbl.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
