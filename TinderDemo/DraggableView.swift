//
//  View.swift
//  TinderDemo
//
//  Created by Kanch on 3/2/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class DraggableView: UIView {

    @IBOutlet weak var panGesture: UIPanGestureRecognizer!
    var imageCenter: CGPoint!
    
    
    @IBOutlet var contentView: DraggableView!
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    @IBOutlet weak var profileImageView: UIImageView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    var image: UIImage? {
        get { return contentView.profileImageView.image}
        set { contentView.profileImageView.image = newValue }
    
    }
    
    
//    @IBAction func onPan(sender: UIPanGestureRecognizer) {
//        
//        let translation = sender.translationInView(contentView)
//        let velocity = sender.velocityInView(contentView)
//        let point = sender.locationInView(contentView)
//        
//        if sender.state == UIGestureRecognizerState.Began {
//            imageCenter = CGPoint(x: profileImageView.center.x, y: profileImageView.center.y  )
//        }
//        else if sender.state == UIGestureRecognizerState.Changed {
//            profileImageView.center = CGPoint(x: imageCenter.x + translation.x, y: imageCenter.y)
//            
//        } else if sender.state == UIGestureRecognizerState.Ended {
//        }
//        
//        
//    }
    
    
    func initSubviews() {
        // standard initialization logic
        
        if(self.subviews.count == 0) {
			let nib = UINib(nibName: "DraggableView", bundle: nil)
			nib.instantiateWithOwner(self, options: nil)
			contentView.frame = bounds
			addSubview(contentView)
        }
        
            // custom initialization logic
        
    }

}
