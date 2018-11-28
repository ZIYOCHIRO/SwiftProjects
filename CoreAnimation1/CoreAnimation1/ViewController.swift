//
//  ViewController.swift
//  CoreAnimation1
//
//  Created by 10.12 on 2018/11/28.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Animate(_ sender: Any) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "position")
        animation.fromValue = NSValue(cgPoint: CGPoint(x: imageView.frame.midX, y: imageView.frame.midY))
        animation.toValue = NSValue(cgPoint: CGPoint(x: imageView.frame.midX, y: CGFloat(340)))
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.duration = 1.0
        imageView.layer.add(animation, forKey: "position")
    }
    
}

