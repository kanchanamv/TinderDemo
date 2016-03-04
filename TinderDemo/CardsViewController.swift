//
//  ViewController.swift
//  TinderDemo
//
//  Created by Kanch on 3/2/16.
//  Copyright © 2016 Kanch. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

	@IBOutlet var panGesture: UIPanGestureRecognizer!
	@IBOutlet weak var profileImageView: UIImageView!

	@IBOutlet weak var customView: DraggableView!
	var imageCenter: CGPoint!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		customView.image = UIImage(named: "ryan")
		view.addSubview(customView)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func onPan(sender: UIPanGestureRecognizer) {
		let translation = sender.translationInView(view)
		let velocity = sender.velocityInView(view)
		let point = sender.locationInView(view)

		if sender.state == UIGestureRecognizerState.Began {

			imageCenter = CGPoint(x: customView.contentView.profileImageView.center.x, y: customView.contentView.profileImageView.center.y)
		}
		else if sender.state == UIGestureRecognizerState.Changed {
			// customView.contentView.profileImageView.center = CGPoint(x: imageCenter.x + translation.x, y: imageCenter.y)
			// UIView.animateWithDuration(2.0, animations: { () -> Void in

			let angle = Int(translation.x).degreesToRadians
			// 180.0 * CGFloat(translation.x) / 180.0
			if velocity.x > 0 {
				if translation.x < 50
				{
                    customView.contentView.profileImageView.center.x = imageCenter.x + translation.x
					customView.contentView.profileImageView.transform = CGAffineTransformMakeRotation(angle)
				}
				else {
//               customView.contentView.profileImageView.center.x = imageCenter.x + translation.x
					customView.contentView.profileImageView.center.x -= view.bounds.width
					customView.contentView.profileImageView.transform = CGAffineTransformMakeRotation(angle)
				}
			}
			else {
                print ("translation: \(translation.x)")
                if translation.x >= -50
                {
                    print("center: \(imageCenter.x + translation.x)")
                    customView.contentView.profileImageView.center.x = imageCenter.x + translation.x
                    
                    customView.contentView.profileImageView.transform = CGAffineTransformMakeRotation(angle)
                }
                else {
                    //                customView.contentView.profileImageView.center.x = imageCenter.x + translation.x
                    customView.contentView.profileImageView.center.x -= view.bounds.width
                    customView.contentView.profileImageView.transform = CGAffineTransformMakeRotation(angle)
                }
//				customView.contentView.profileImageView.transform = CGAffineTransformMakeRotation(-1.0 * angle)
			}

			// }
		} else if sender.state == UIGestureRecognizerState.Ended {

			// customView.contentView.profileImageView.center = imageCenter
		}
	}
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        ProfileViewController pvc = UIStoryboard.instantiateViewControllerWithIdentifier("ProfileViewController")
        
    }
}

extension Int {
	var degreesToRadians : CGFloat {
		return CGFloat(self) * CGFloat(M_PI) / 180.0
	}
}

