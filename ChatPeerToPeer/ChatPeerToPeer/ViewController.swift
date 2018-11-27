//
//  ViewController.swift
//  ChatPeerToPeer
//
//  Created by 10.12 on 2018/11/27.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController, UITextFieldDelegate, MCSessionDelegate, MCBrowserViewControllerDelegate {
    
    @IBOutlet weak var sendText: UITextField!
    @IBOutlet weak var textBox: UITextView!
    
    var browserVC: MCBrowserViewController!
    var advertiserAssistant: MCAdvertiserAssistant!
    var session: MCSession!
    var peerID: MCPeerID!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMultipeer()
    }
    
    func setUpMultipeer() {
        peerID = MCPeerID(displayName: UIDevice.current.name)
        session = MCSession(peer: peerID)
        session.delegate = self
        browserVC = MCBrowserViewController(serviceType: "chat", session: session)
        browserVC.delegate = self
        advertiserAssistant = MCAdvertiserAssistant(serviceType: "chat", discoveryInfo: nil, session: session)
        advertiserAssistant.start()
    }

    @IBAction func button(_ sender: UIButton) {
        showBrowserVC()
    }
    
    // MARK: func to conform the protocols ------------------------------------------
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        // code
    }
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        let message = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        DispatchQueue.main.async(execute: {self.messageReception(message!, peer: peerID)})
    }
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        // code
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        // code
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        // code
    }
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        self.dismissBrowserVC()
    }
    
    // NOtifies delegate that the user taps the cancel button.
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        self.dismissBrowserVC()
    }
    
    // ------------------------protocols funcs ends here.------------------------------
    func showBrowserVC() {
        self.present(self.browserVC, animated: true, completion: nil)
    }
    func messageReception(_ message: NSString, peer: MCPeerID) {
        var finalText: String
        if peer == self.peerID {
            finalText = "\nYo: \(message)"
        } else {
            finalText = "\n\(peer.displayName): \(message)"
        }
        self.textBox.text = self.textBox.text + (finalText as String)
    }
    
    func dismissBrowserVC() {
        self.browserVC.dismiss(animated: true, completion: nil)
    }
    
    
}

