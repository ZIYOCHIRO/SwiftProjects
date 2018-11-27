//
//  ViewController.swift
//  QuartzCore
//
//  Created by 10.12 on 2018/11/27.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollisionBehaviorDelegate {
    
    @IBOutlet var gravity: UIButton!
    @IBOutlet var push: UIButton!
    @IBOutlet var attachment: UIButton!
    
    @objc var collision: UICollisionBehavior!
    @objc var animator = UIDynamicAnimator()
    @objc var attachmentBehavior: UIAttachmentBehavior? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: self.view)
    }
    override func viewDidAppear(_ animated: Bool) {
        let max: CGRect = UIScreen.main.bounds
        let snap1 = UISnapBehavior(item: self.gravity, snapTo: CGPoint(x: max.size.width/2, y: max.size.height/2 - 50))
        let snap2 = UISnapBehavior(item: self.push, snapTo: CGPoint(x: max.size.width/2, y: max.size.height/2))
        let snap3 = UISnapBehavior(item: self.attachment, snapTo: CGPoint(x: max.size.width/2, y: max.size.height/2 + 50))
        
        snap1.damping = 1
        snap2.damping = 2
        snap3.damping = 4
        
        animator.addBehavior(snap1)
        animator.addBehavior(snap2)
        animator.addBehavior(snap3)
    }
    @IBAction func gravity(_ sender: Any) {
        animator.removeAllBehaviors()
        
        let gravity = UIGravityBehavior(items: [self.gravity, self.push, self.attachment])
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [self.gravity, self.push, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    @IBAction func push(_ sender: Any) {
        animator.removeAllBehaviors()
        
        let push = UIPushBehavior(items: [self.gravity, self.push, self.attachment], mode: UIPushBehavior.Mode.instantaneous)
        push.magnitude = 2
        
        animator.addBehavior(push)
        
        collision = UICollisionBehavior(items: [self.gravity, self.push, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
        
    }
    
    @IBAction func attachment(_ sender: Any) {
        animator.removeAllBehaviors()
        
        let anchorPoint = CGPoint(x: self.attachment.center.x, y: self.attachment.center.y)
        attachmentBehavior = UIAttachmentBehavior(item: self.attachment, attachedToAnchor: anchorPoint)
        attachmentBehavior!.frequency = 0.5
        attachmentBehavior!.damping = 2
        attachmentBehavior!.length = 20
        animator.addBehavior(attachmentBehavior!)
        collision = UICollisionBehavior(items: [self.gravity, self.push, self.attachment])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }
    
    
    @IBAction func handleAttachment(_ sender: UIPanGestureRecognizer) {
        if attachmentBehavior != nil {
            attachmentBehavior!.anchorPoint = sender.location(in: self.view)
        }
    }
    

}

