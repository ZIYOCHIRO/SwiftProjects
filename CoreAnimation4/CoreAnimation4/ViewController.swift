//
//  ViewController.swift
//  CoreAnimation4
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
    }

    @IBAction func animate(_ sender: UIButton) {
        if position {
            let subLayer: CALayer = self.imageView.layer
            let thePath: CGMutablePath = CGMutablePath()
            thePath.move(to: CGPoint(x: 400, y: 300))
            thePath.addCurve(to: CGPoint(x: 400, y: 300), control1: CGPoint(x: 100, y: 100), control2: CGPoint(x: 200, y: 100))
            
            let theAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
            theAnimation.path = thePath
            theAnimation.duration = 5.0
            theAnimation.fillMode = CAMediaTimingFillMode.forwards
            theAnimation.isRemovedOnCompletion = false
            
            let resizseAnimation:CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizseAnimation.toValue = NSValue(cgSize: CGSize(width: 240, height: 60))
            resizseAnimation.duration = 5.0
            resizseAnimation.fillMode = CAMediaTimingFillMode.forwards
            resizseAnimation.isRemovedOnCompletion = false
            
            subLayer.add(theAnimation, forKey: "position")
            imageView.layer.add(resizseAnimation, forKey: "bounds.size")
            position = false
        } else {
            let animation: CABasicAnimation! = CABasicAnimation(keyPath: "posiiton")
            animation.fromValue = NSValue(cgPoint: CGPoint(x: 300, y: 400))
            animation.duration = 5.0
            animation.fillMode = CAMediaTimingFillMode.forwards
            animation.isRemovedOnCompletion = false

            let resizeAnimation:CABasicAnimation = CABasicAnimation(keyPath: "bounds.size")
            resizeAnimation.fromValue = NSValue(cgSize: CGSize(width: 240, height: 60))
            resizeAnimation.duration = 5.0
            resizeAnimation.fillMode = CAMediaTimingFillMode.forwards
            resizeAnimation.isRemovedOnCompletion = false

            imageView.layer.add(animation, forKey: "postion")
            imageView.layer.add(resizeAnimation, forKey: "bounds.size")
            position = true
        }
    }
    
}

