//
//  ViewController.swift
//  CheckConnectivity
//
//  Created by 10.12 on 2018/11/28.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var checkingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkConnectivity()
    }
    
    @objc func checkConnectivity() {
        
    }

}

