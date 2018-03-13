//
//  XLDigitalAnimationView.swift
//  TestNum
//
//  Created by XL on 2018/3/13.
//  Copyright © 2018年 ZLGB. All rights reserved.
//

import UIKit

class XLDigitalAnimationView: UIView {

    private  var xlcollectionView: UICollectionView!
    private var collectViewBackColor:UIColor!
    private var itemTextColor:UIColor!
    init(frame:CGRect, backColor:UIColor, textColor:UIColor) {
        super.init(frame: frame)
        itemTextColor = textColor
        collectViewBackColor = backColor
        addCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func scroll(index:Int) -> Void {
        xlcollectionView.scrollToItem(at: IndexPath.init(item: index, section: 0), at: .bottom, animated: true)
    }
    
}

extension XLDigitalAnimationView {
    private func addCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: CGRect(x:0, y:0, width:self.bounds.size.width, height:self.bounds.size.height), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(XLDigitalAnimationViewSingleItem.self, forCellWithReuseIdentifier: "XLDigitalAnimationViewSingleItem")
        collectionView.backgroundColor = collectViewBackColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
//        collectionView.isPagingEnabled = true
        xlcollectionView = collectionView
        self.addSubview(self.xlcollectionView)
    }
}

extension XLDigitalAnimationView:UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    //MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:XLDigitalAnimationViewSingleItem = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: XLDigitalAnimationViewSingleItem.self), for: indexPath) as!XLDigitalAnimationViewSingleItem
        cell.titleLbl.text = String.init(format: "%d", indexPath.item)
        cell.titleLbl.textColor = itemTextColor
        return cell
    }
    
    
    
    //MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
    }
}

class XLDigitalAnimationViewSingleItem: UICollectionViewCell {
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
