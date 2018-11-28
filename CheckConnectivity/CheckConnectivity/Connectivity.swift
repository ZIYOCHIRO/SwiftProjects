//
//  Connectivity.swift
//  CheckConnectivity
//
//  Created by 10.12 on 2018/11/28.
//  Copyright © 2018 Rui. All rights reserved.
//

import Foundation
import SystemConfiguration

open class Reachability {
    class func isConnectedToNetwork() -> Bool {
        
        var zeroAddresss = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
        zeroAddresss.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddresss.sin_family = sa_family_t(AF_INET)
        
        
        
        
        return false
    }
}
