//
//  UserStore.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/7/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import Foundation

class UserStore {
    // singleton
    static let shared = UserStore()
    private init() {}
    
    func loging(_ loginUser: Account, completion:@escaping(_ succes:Bool, _ error: String?) -> Void) {
        
        //call web service to login
//        WebServices.shared.authUser(loginUser) { (user, error) in
//            if let user = user {
//                WebServices.shared.setAuthToken(user.token, expration: user.expiration)
//                completion(true, nil)
//            } else{
//                completion(false, error)
//                
//            }
//        }
    }
    func register(_ registerUser: Account, completion:@escaping(_ succes:Bool, _ error: String?) -> Void) {
        
        //call web service to login
       // WebServices.shared.authUser(registerUser) { (user, error) in
         //   if let user = user {
           //     WebServices.shared.setAuthToken(user.token, expration: user.expiration)
             //   completion(true, nil)
            }// else{
               // completion(false, error)
                
                
            //}
            
       // }
    //}
    func logout(_ completion:()-> ()) {
        WebServices.shared.clearUserAuthToken()
        completion()
        
    }
    
}



