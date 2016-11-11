//
//  UserStore.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/7/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import Foundation


protocol UserStoreDelegate: class {
    func userLoggedIn()
}


class UserStore {
    // singleton
    static let shared = UserStore()
    private init() {}
    var account: Account? {
        didSet {
            if let _ = account {
                delegate?.userLoggedIn()
            }
        }
    }
    weak var delegate: UserStoreDelegate?
    
    func loging(_ loginUser: User, completion:@escaping(_ succes:Bool, _ error: String?) -> Void) {
        
        //call web service to login
       WebServices.shared.authUser(loginUser) { (user, error) in
            if let user = user {
                WebServices.shared.setAuthToken(user.token, expration: user.expiration)
                completion(true, nil)
            } else{
                completion(false, error)
                
            }
        }
    }
    func register(_ registerUser: Account, completion:@escaping(_ succes:Bool, _ error: String?) -> Void) {
        
        //call web service to login
        WebServices.shared.authUser(registerUser) { (user, error) in
            if let user = user {
               WebServices.shared.setAuthToken(user.token, expration: user.expiration)
                completion(true, nil)
            } else{
                completion(false, error)
                
                
            }
            
        }
    }
    
    func getUserInfo(infoUser: Account, completion:@escaping (_ success: Bool, _ error: String?) -> Void) {
        infoUser.requestType = Account.RequestType.userInfo
        WebServices.shared.getObject(infoUser) { (user, error) in
            if let account = self.account {
                self.account = account
                completion(true, nil)
            } else {
                completion(false, error)
            }
        }
    }
    
    func logout(completion:@escaping () -> Void) {
        let logoutUser = Account()
        logoutUser.requestType = Account.RequestType.logout
        WebServices.shared.postObject(logoutUser) { (object, error) in
            WebServices.shared.clearUserAuthToken()
            completion()
        }
    }
}

