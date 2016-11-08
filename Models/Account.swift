//
//  Account.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/6/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

class Account: NetworkModel {
    
    var id: String?
    var email: String?
    var hasRegistered: Bool?
    var loginProvider: String?
    var fullName: String?
    var avatarBase64: String?
    var lastCheckInLongitude: Double?
    var lastCheckInLatitude: Double?
    var lastCheckInDateTime: String?
    var oldPassword: String?
    var newPassword: String?
    var confirmPassword: String?
    var apiKey = "iOSandroid301november2016"
    var password: String?
    
    
    //Request Type
    enum RequestType {
        case userInfo
        case logout
        case changePasword
        case setPassword
        case register
    
    }
    var requestType = RequestType.register
    
    
    // empty constructor
    required init() {}
    
    // create an object from JSON
    required init(json: JSON) throws {
        id = try? json.getString(at: Constants.Account.id)
        email = try? json.getString(at: Constants.Account.email)
        hasRegistered = try? json.getBool(at: Constants.Account.hasRegistered)
        loginProvider = try? json.getString(at: Constants.Account.loginPrivider)
        fullName = try? json.getString(at: Constants.Account.fullName)
        avatarBase64 = try? json.getString(at: Constants.Account.avatarBase64)
        password = try? json.getString(at: Constants.Account.password)
        lastCheckInLongitude = try? json.getDouble(at: Constants.Account.lastCheckInLongitude)
        lastCheckInLatitude = try? json.getDouble(at: Constants.Account.lastCheckInLatitude)
        lastCheckInDateTime = try? json.getString(at: Constants.Account.lastCheckInDateTime)
        
    }
    
    init(id: String, email: String, hasRegistered: Bool, loginProvider: String, fullName: String, avatarBase64: String, lastCheckinLongitude: Double, lastCheckinLatitude: Double, lastCheckinDate: String, password: String) {
        self.id = id
        self.email = email
        self.hasRegistered = hasRegistered
        self.loginProvider = loginProvider
        self.fullName = fullName
        self.avatarBase64 = avatarBase64
        self.password = password
        //self.lastCheckInLatitude = lastCheckInLatitude
        //self.lastCheckInLongitude = lastCheckInLongitude
        //self.lastCheckInDateTime = lastCheckInDateTime
    }
    init (userInfo: String){
        requestType = .userInfo
    }
    
    init(register: String) {
        requestType = .register
        
    }
    
    init(setPassword: String) {
        requestType = .setPassword
    }
    
    init(changePasword: String) {
        requestType = .changePasword
    }
    
    init(logout: String) {
        requestType = .logout
    }
    
    // Always return HTTP.GET
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
        case .register:
            return .post
        default:
            return .get
        }
    }
    
    // A sample path to a single post
    func path() -> String {
        switch requestType {
        case .userInfo:
            return "/api/Account/userInfo"
        case .logout:
            return "/api/Account/logout"
        case .changePasword:
            return "/api/Account/changePassword"
        case .setPassword:
            return "/api/Account/setPassword"
        case .register:
            return "/api/Account/registerAccount"
            
        }
    }
    
    // Demo object isn't being posted to a server, so just return nil
    func toDictionary() -> [String: AnyObject]? {
        switch requestType {
        case .userInfo:
            //let startDate = Utils.adjustedTime().toString(.iso8601(nil))
            
            var params: [String: AnyObject] = [:]
            params[Constants.Account.email] = email as AnyObject?
            params[Constants.Account.hasRegistered] = hasRegistered as AnyObject?
            params[Constants.Account.loginPrivider] = loginProvider as AnyObject?
            params[Constants.Account.fullName] = fullName as AnyObject?
            params[Constants.Account.avatarBase64] = avatarBase64 as AnyObject?
            params[Constants.Account.lastCheckInLongitude] = lastCheckInLongitude as AnyObject?
            params[Constants.Account.lastCheckInLatitude] = lastCheckInLatitude as AnyObject?
            params[Constants.Account.lastCheckInDateTime] = lastCheckInDateTime as AnyObject?
            
            
            return params
        default:
            return nil
        }
    }
    
}


