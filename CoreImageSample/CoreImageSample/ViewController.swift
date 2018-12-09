//
//  ViewController.swift
//  CoreImageSample
//
//  Created by 10.12 on 2018/12/9.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit
import CoreImage
// first change slider value then apply fliter
class ViewController: UIViewController {

    var sliderValue: Float = 0.0
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Sepia(_ sender: UIButton) {
        applyfilter(1)
    
    }
    
    @IBAction func Vignette(_ sender: UIButton) {
        applyfilter(2)
    }
    
    @IBAction func Invert(_ sender: UIButton) {
        applyfilter(3)
    }
    
    @IBAction func Photo(_ sender: UIButton) {
        applyfilter(4)
    }
    
    @IBAction func Perspective(_ sender: UIButton) {
        applyfilter(5)
    }
    
    @IBAction func Gaussian(_ sender: UIButton) {
        applyfilter(6)
    }
    
    @IBAction func slider(_ sender: UISlider) {
        sliderValue = sender.value
    }
    
    func applyfilter(_ numberFliter: Int) {
        let filePath: String = Bundle.main.path(forResource: "image", ofType: "jpg")!
        let fileUrl: URL = URL(fileURLWithPath: filePath as String)
        let inputImage: CIImage = CIImage(contentsOf: fileUrl)!
        
        switch numberFliter {
        case 1:
            let filter = CIFilter(name: "CISepiaTone")
            filter!.setValue(inputImage, forKey: kCIInputImageKey)
            filter!.setValue(sliderValue, forKey: "InputIntensity")
            let outputImage: CIImage = filter!.value(forKey: kCIOutputImageKey) as! CIImage
            let img: UIImage = UIImage(ciImage: outputImage)
            imageView.image = img
        case 2:
            let filter = CIFilter(name: "CIVignette")!
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            filter.setValue(sliderValue, forKey: "InputRadius")
            filter.setValue(sliderValue, forKey: "InputIntensity")
            let outputImage: CIImage = filter.value(forKey: kCIOutputImageKey) as! CIImage
            let img: UIImage = UIImage(ciImage: outputImage)
            imageView.image = img
        case 3:
            let filter = CIFilter(name: "CIColorInvert")!
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            let outputImage: CIImage = filter.value(forKey: kCIOutputImageKey) as! CIImage
            let img: UIImage = UIImage(ciImage: outputImage)
            imageView.image = img
        case 4:
            let filter = CIFilter(name: "CIPhotoEffectMono")!
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            let outputImage: CIImage = filter.value(forKey: kCIOutputImageKey) as! CIImage
            let img: UIImage = UIImage(ciImage: outputImage)
            imageView.image = img
        case 5:
            let filter = CIFilter(name: "CIPerspectiveTransform")!
            filter.setValue(inputImage, forKey: kCIInputImageKey)
            let outputImage: CIImage = filter.value(forKey: kCIOutputImageKey) as! CIImage
            let img: UIImage = UIImage(ciImage: outputImage)
            imageView.image = img
        case 6:
            let filter = CIFilter(name: "CIGaussianBlur")
            filter?.setValue(inputImage, forKey: kCIInputImageKey)
            let outputImage: CIImage = filter?.value(forKey: kCIOutputImageKey) as! CIImage
            let img: UIImage = UIImage(ciImage: outputImage)
            imageView.image = img
        default:
            print("test")
            
        }
    }
}

