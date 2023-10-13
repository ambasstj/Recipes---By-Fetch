//
//  ViewController.swift
//  Recipes. Powered by Fetch
//
//  Created by Tevin Jones on 10/13/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    let errorAlertController = UIAlertController(title: "Error", message: "Please enter a valid email address and password", preferredStyle: .alert)
    let registerAlertController = UIAlertController(title: "Register a new account", message: "Complete the fields below", preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    var emailPH: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }

    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print (e.localizedDescription)
                    self.present(self.errorAlertController, animated: true)
                    self.errorAlertController.addAction(self.okAction)
                }
                else{
                    self.emailPH = email
                    self.performSegue(withIdentifier: K.Segues.loginSeque, sender: self)
                }
            }
        }
    }
    
    @IBAction func newUserButtonPressed(_ sender: UIButton) {
        
        registerAlertController.addTextField { UITextField in
            UITextField.placeholder = "First Name"
        }
        registerAlertController.addTextField { UITextField in
            UITextField.placeholder = "Last Name"
        }
        registerAlertController.addTextField { UITextField in
            UITextField.placeholder = "Email address"
            UITextField.keyboardType = .emailAddress
        }
        registerAlertController.addTextField { UITextField in
            UITextField.placeholder = "Password"
            UITextField.isSecureTextEntry = true
        }
  
        let createAccountButton = UIAlertAction(title: "Create account ", style: .default){_ in
            
            Auth.auth().createUser(withEmail: self.registerAlertController.textFields?[2].text ?? "", password: self.registerAlertController.textFields?[3].text ?? "") { Authresult, error in
                if let e = error {
                    print (e.localizedDescription)
                    self.present(self.errorAlertController, animated: true)
                }
                else {
                    print ("this worked")
                    self.performSegue(withIdentifier: K.Segues.loginSeque, sender: self)
                    
                }
            }}
        registerAlertController.addAction(createAccountButton)
        self.present(registerAlertController, animated: true)
        
    }
    


}

