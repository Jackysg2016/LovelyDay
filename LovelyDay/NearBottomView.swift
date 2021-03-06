//
//  NearBottomView.swift
//  LovelyDay
//
//  Created by Elise on 16/6/5.
//  Copyright © 2016年 Elise. All rights reserved.
//

import UIKit

class NearBottomView: UIView {
    @IBOutlet weak var goHereView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: "goHereViewClick")
            goHereView.addGestureRecognizer(tap)
            goHereView.userInteractionEnabled = true
        }
    }
    @IBOutlet weak var shareView: UIView! {
        didSet {
            let tap = UITapGestureRecognizer(target: self, action: "shareViewClick")
            shareView.addGestureRecognizer(tap)
            shareView.userInteractionEnabled = true
        }
    }
    
    
    @objc private func shareViewClick() {
        delegate?.nearBottomView(shareViewDidClick: self.shareView)
    }
    @objc private func goHereViewClick() {
        delegate?.nearBottomView(goHereViewDidClick: self.goHereView)
    }
    
    
    var delegate:NearBottomViewDelegate?
    
    
    
    class func loadNearBottomView() -> NearBottomView {
        let view = NSBundle.mainBundle().loadNibNamed("NearBottomView", owner: nil, options: nil).last as? NearBottomView
        return view!
    }
    
    
    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
protocol NearBottomViewDelegate {
    func nearBottomView(shareViewDidClick view:UIView)
    func nearBottomView(goHereViewDidClick view:UIView)
}