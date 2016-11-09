//
//  LoginViewController.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/5/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import MBProgressHUD
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var eMailTextField: UITextField!
   
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Mark: IBActions
    @IBAction func loginTapped(_ sender: Any) {
        guard let username = eMailTextField.text, username != "" else {
            let alert = Utils.createAlert("login Error", message:  "Please provide a username", dismissButtonTitle: "Close")
            present(alert, animated:  true, completion: nil)
            
            return
            
        }
        guard let password = passwordTextField.text, password != "" else {
            let alert = Utils.createAlert("login Error", message:  "Please provide a Password", dismissButtonTitle: "Close")
            present(alert, animated:  true, completion: nil)
            
            return
        }
        
        // going to go ahead with the login
//        MBProgressHUD.showAdded(to: view, animated: true)
//        let user = Account(username: username, password: password)
//        UserStore.shared.loging(user) { (succcess, error) in
//            MBProgressHUD.hide(for: self.view, animated: true)
//            
//            if succcess {
//                self.dismiss(animated: true, completion: nil)
//            }else  if let error = error {
//                self.present(Utils.createAlert(message: error), animated: true, completion: nil)
//            }else {
//                self.present(Utils.createAlert(message: Constants.JSON.unknownError), animated: true, completion: nil)
//            }
//        }
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}

}
