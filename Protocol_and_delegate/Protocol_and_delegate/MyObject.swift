//
//  MyObject.swift
//  Protocol_and_delegate
//
//  Created by 10.12 on 2018/11/26.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

protocol myDelegate {
    func method_1()
}

class myObject: NSObject {
    var delegate: myDelegate?
    
    func start() {
        delegate?.method_1()
    }
}
