//
//  ViewController.swift
//  AVFoundationQR
//
//  Created by 10.12 on 2018/11/27.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var previewView: UIView!
    var sendURL: String!
    var codeReader: CodeReader = AVCodeReader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let previewLayer = codeReader.videoPreview
        previewLayer.frame = previewView.bounds
        previewView.layer.addSublayer(previewLayer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.startReading), name: NSNotification.Name.NSExtensionHostWillEnterForeground, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.stopReading), name: NSNotification.Name.NSExtensionHostDidEnterBackground, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startReading()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopReading()
    }
    
    
    @objc func startReading() {
        codeReader.startReading(completion: didOutput)
    }
    @objc func stopReading() {
        codeReader.stopReading()
    }
    
    
    private func didOutput(result: CodeReadResult) {
        switch result {
        case .success(let elemento): print(elemento)
        case .failure: showNotAvaiableCameraError()
        }
    }
    
    private func showNotAvaiableCameraError() {
        let alertController = UIAlertController(title: "Camera required", message: "This device has no camera. Is this an iOS Simulator?", preferredStyle: .alert)
        let gotItAction = UIAlertAction(title: "Got it", style: .default, handler: nil)
        alertController.addAction(gotItAction)
        self.present(alertController, animated: false, completion: nil)
    }


}

