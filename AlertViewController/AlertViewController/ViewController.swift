//
//  ViewController.swift
//  AlertViewController
//
//  Created by 10.12 on 2018/11/26.
//  Copyright © 2018 Rui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Alert With Form
    @IBAction func alertWithForm(_ sender: Any) {
        let alertController = UIAlertController(title: "My title", message: "This is an alert!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("You have pressed the cancel button!")
        }
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            print("You have pressed the OK button")
            let userName = alertController.textFields![0].text
            let password = alertController.textFields![1].text
            self.doSomething(userName, password: password)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(OKAction)
        
        alertController.addTextField(configurationHandler: {(textField: UITextField) in
            textField.placeholder = "User Name"
            textField.isSecureTextEntry = false
        })
        alertController.addTextField(configurationHandler: {(textField: UITextField) in
            textField.placeholder = "Password"
            textField.isSecureTextEntry = true
        })
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    @objc func doSomething(_ userName: String?, password: String?) {
        print("username: \(userName ?? "") password: \(password ?? "")")
    }
    
    // Show Alert
    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Attention", message: "This is an alert!", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("You have pressed the Cancel button!")
        }
        
        let OKaction = UIAlertAction(title: "OK", style: .default) { _ in
            print("You have pressed the OK button!")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(OKaction)
        
        self.present(alertController, animated: true , completion: nil)
    }
    
    // Action Sheet
    @IBAction func actionSheet(_ sender: Any) {
        let alertController = UIAlertController(title: "My Title", message: "This ia an alert again!", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("You have pressed the Cancel button")
        }
        let OKaction = UIAlertAction(title: "OK", style: .default) { _ in
            print("You have pressed the OK button")
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(OKaction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
}

