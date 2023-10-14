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
    
    var emailPH: String?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        let errorAlertController = UIAlertController(title: "Error", message: "Please enter a valid email address and password", preferredStyle: .alert)
    
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        if let email = emailTextField.text, let password = passwordTextField.text{
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print (e.localizedDescription)
                    self.present(errorAlertController, animated: true)
                    errorAlertController.addAction(okAction)
                }
                else{
                    self.emailPH = email
                    self.performSegue(withIdentifier: K.Segues.loginSeque, sender: self)
                }
            }
        }
    }
    
    @IBAction func newUserButtonPressed(_ sender: UIButton) {
        
        let registerAlertController = UIAlertController(title: "Register a new account", message: "Complete the fields below", preferredStyle: .alert)
        
        /* registerAlertController.addTextField { UITextField in
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
         print ("Account created")
         self.performSegue(withIdentifier: K.Segues.loginSeque, sender: self)
         
         let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
         changeRequest?.displayName = self.registerAlertController.textFields?[0].text
         changeRequest?.commitChanges { error in
         if let e = error{
         print (e.localizedDescription)
         }
         }
         
         }
         }}
         registerAlertController.addAction(createAccountButton)
         self.present(registerAlertController, animated: true)
         
         }*/
        
        //This is temporary just to speed up the process as i'm building. Remember to delete later
        self.performSegue(withIdentifier: K.Segues.loginSeque, sender: self)
    }
}

