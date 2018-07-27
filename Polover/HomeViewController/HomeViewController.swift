//
//  ViewController.swift
//  Polover
//
//  Created by Maze Geek on 7/26/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class HomeViewController: UIViewController {
    
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
        FirebaseApp.configure()
    }
    
    @IBAction func signUPTapped(_ sender: UIButton) {
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            displayAlert(title: "Missing Information ", message: "You must provide email and password")
            
        } else {
            
            if let email = emailTextField.text{
                if let password = passwordTextField.text{
                    
                    
                    
                    if signUpMood{
                        //SIGN UP
                        
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                                
                                
                            }else {
                                print("Sign UP Success")
                                 self.performSegue(withIdentifier: "riderSegue", sender: nil)
                            }
                            
                        })
                        
                        
                        
                    }else{
                        // LOG IN
                        
                        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                            
                            if error != nil {
                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                                
                                
                            }else {
                                print("Sign in Success")
                                self.performSegue(withIdentifier: "riderSegue", sender: nil)
                            }
                        })
                    }
                }
            }
        }
        
    }
    
    // Alert controller
    func displayAlert(title:String , message: String ){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
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


