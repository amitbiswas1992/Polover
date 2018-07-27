//
//  ViewController.swift
//  Polover
//
//  Created by Maze Geek on 7/26/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    @IBOutlet weak var riderDriverSwitch: UISwitch!
    @IBOutlet weak var signUPButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var riderLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    
    var signUpMood = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func signUPTapped(_ sender: UIButton) {
        
        
    }
    
    @IBAction func logInTapped(_ sender: UIButton) {
        if signUpMood{
            signUPButton.setTitle("Log In", for: .normal)
            logInButton.setTitle("Switch To Sign Up", for: .normal)
            riderLabel.isHidden = true
            driverLabel.isHidden = true
            riderDriverSwitch.isHidden = true
            signUpMood = false
            
        }
        else {
            signUPButton.setTitle("Sign Up", for: .normal)
            logInButton.setTitle("Switch To Log In", for: .normal)
            riderLabel.isHidden = false
            driverLabel.isHidden = false
            riderDriverSwitch.isHidden = false
            signUpMood = true
        }
        
    }
    
}

