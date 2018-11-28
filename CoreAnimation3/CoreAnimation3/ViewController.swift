//
//  ViewController.swift
//  CoreAnimation3
//
//  Created by 10.12 on 2018/11/28.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var position = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func animate(_ sender: UIButton) {
        if position {
            let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
            animation.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 400))
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.duration = 3.0
            animation.isRemovedOnCompletion = false
            
            let resizeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.toValue = NSValue(cgSize: CGSize(width: 240, height: 60))
            resizeAnimation.fillMode = CAMediaTimingFillMode.forwards
            resizeAnimation.duration = 3.0
            resizeAnimation.isRemovedOnCompletion = false
            
            UIView.animate(withDuration: 5.0, animations: {
                // properties changes to animate
                self.imageView.alpha = 0.0
            }, completion: {(value:Bool) in
                // when finished animation do this...
                self.imageView.alpha = 1.0
                self.imageView.layer.add(animation, forKey: "position")
                self.imageView.layer.add(resizeAnimation, forKey: "bounds.size")
            })
            position = false
        } else {
            let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
            animation.toValue = NSValue(cgPoint: CGPoint(x: 300, y: 400))
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.duration = 3.0
            animation.isRemovedOnCompletion = false
            
            let resizeAnimation: CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.toValue = NSValue(cgSize: CGSize(width: 240, height: 60))
            resizeAnimation.fillMode = CAMediaTimingFillMode.forwards
            resizeAnimation.duration = 3.0
            resizeAnimation.isRemovedOnCompletion = false
            
            imageView.layer.add(animation, forKey: "position")
            imageView.layer.add(resizeAnimation, forKey: "bounds.size")
            position = true
        }
    }
    
}

