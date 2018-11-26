//
//  ImageViewController.swift
//  Airdrop
//
//  Created by 10.12 on 2018/11/26.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func send(_ sender: UIButton) {
        let sendImage: UIImage = imageView.image!
        let controller = UIActivityViewController(activityItems: [sendImage], applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
        
    }
    @IBAction func takePhoto(_ sender: UIButton) {
        
        let cameraController = UIImagePickerController()
        cameraController.delegate = self
        cameraController.sourceType = UIImagePickerController.SourceType.camera
        
        self.present(cameraController, animated: true, completion: nil)
    }
    @IBAction func album(_ sender: UIButton) {
        let albumController = UIImagePickerController()
        albumController.delegate = self
        albumController.sourceType = .photoLibrary
        self.present(albumController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let choosedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = choosedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
}
