//
//  ViewController.swift
//  PasswordField
//
//  Created by Kelvin Tan on 10/20/18.
//  Copyright © 2018 Kelvin Tan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordStrength: UILabel!
    @IBOutlet weak var showHideLabel: UIButton!
    
    var passwordVisible: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureView()
    }
    
    func configureView(){
        passwordTextField.isSecureTextEntry = true
        passwordTextField.clearsOnBeginEditing = false
        showHideLabel.setTitle("Show", for: .normal)
        passwordStrength.isHidden = true
    }

    @IBAction func showHide() {
        if passwordVisible {
            passwordTextField.isSecureTextEntry = false
            showHideLabel.setTitle("Hide", for: .normal)
            passwordVisible = false
        } else {
            passwordTextField.isSecureTextEntry = true
            showHideLabel.setTitle("Show", for: .normal)
            passwordVisible = true
        }
    }
    
    @IBAction func passwordTyped() {
        passwordStrength.isHidden = false
        if (passwordTextField.text?.count)! < 3 {
            passwordStrength.text = "Password is weak"
            passwordStrength.textColor = UIColor.red
        } else if (passwordTextField.text?.count)! > 8 {
            passwordStrength.text = "Password is unbreakable"
            passwordStrength.textColor = UIColor.green
        } else {
            passwordStrength.text = "Password is safer"
            passwordStrength.textColor = UIColor.purple
        }
    }
}

