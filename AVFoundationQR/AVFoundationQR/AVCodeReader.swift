//
//  AVCodeReader.swift
//  AVFoundationQR
//
//  Created by 10.12 on 2018/11/27.
//  Copyright © 2018 Rui. All rights reserved.
//

import AVFoundation

class AVCodeReader: NSObject, CodeReader {
    var videoPreview: CALayer
    
    func startReading(completion: @escaping (CodeReadResult) -> Void) {
        // the current only reason a session would be null is if camera is not available
    }
    
    func stopReading() {
        <#code#>
    }
    
    
}
