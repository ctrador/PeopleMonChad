//
//  RegisterViewController.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/7/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import UIKit
import MBProgressHUD


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    
    @IBOutlet weak var eMailTextFeild: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Mark: IBActions
    
    
    @IBAction func regester(_ sender: Any) {
        
        let avatarBase64 = "chad"
        
        guard let fullName = fullNameTextField.text, fullName != "" else {
            let alert = Utils.createAlert("login Error", message:  "Please provide a username", dismissButtonTitle: "Close")
            present(alert, animated:  true, completion: nil)
            
            return
            
        }
        guard let email = eMailTextFeild.text, email != "" && Utils.isValidEmail(email) else {
            let alert = Utils.createAlert("login Error", message:  "Please provide a Valid Email", dismissButtonTitle: "Close")
            present(alert, animated:  true, completion: nil)
            
            return
        }
        guard let password = passwordTextField.text, password != "" else {
            let alert = Utils.createAlert("login Error", message:  "Please provide a Password", dismissButtonTitle: "Close")
            present(alert, animated:  true, completion: nil)
            
            return
        }
        
        guard let confirm = confirmPasswordTextField.text, password == confirm else {
            let alert = Utils.createAlert("login Error", message:  "Passwords do not match", dismissButtonTitle: "Close")
            present(alert, animated:  true, completion: nil)
            
            return
            
        }
        
        // going to go ahead with the register
        MBProgressHUD.showAdded(to: view, animated: true)
    
       // let user = Account(email: email, fullName: fullName, avatarBase64: avatarBase64, password: password)
        let user = Account(email: email, fullName: fullName, avatarBase64: avatarBase64, password: password)
        
        UserStore.shared.register(user) { (succcess, error) in
            MBProgressHUD.hide(for: self.view, animated: true)
            
           if succcess {
                self.dismiss(animated: true, completion: nil)
            }else  if let error = error {
               self.present(Utils.createAlert(message: error), animated: true, completion: nil)
            }else {
                self.present(Utils.createAlert(message: Constants.JSON.unknownError), animated: true, completion: nil)
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

