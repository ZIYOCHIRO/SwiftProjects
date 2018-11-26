//
//  ViewController.swift
//  Protocol_and_delegate
//
//  Created by 10.12 on 2018/11/26.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController, myDelegate{
    func method_1() {
        print("message received")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let myRequest: myObject =  myObject()
        myRequest.delegate = self
        myRequest.start()
    }


}

