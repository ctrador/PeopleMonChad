//
//  Account.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/6/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//
import UIKit
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
    var authorization: String?
    var oldPassword: String?
    var newPassword: String?
    var confirmPassword: String?
    var apiKey: String?
    var password: String?
    var grantType: String?
    var userName: String?
    var token : String?
    var expiration : String?
    
    //Request Type
    enum RequestType {
        case userInfo
        case logout
        case changePasword
        case setPassword
        case register
        case login
        case updateProfile
    }
    var requestType = RequestType.userInfo
    
    
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
        lastCheckInLongitude = try? json.getDouble(at: Constants.Account.lastCheckInLongitude)
        lastCheckInLatitude = try? json.getDouble(at: Constants.Account.lastCheckInLatitude)
        lastCheckInDateTime = try? json.getString(at: Constants.Account.lastCheckInDateTime)
        authorization = try? json.getString(at: Constants.Account.authorization)
        oldPassword = try? json.getString(at: Constants.Account.oldPassword)
        newPassword = try? json.getString(at: Constants.Account.newPassword)
        apiKey = try? json.getString(at: Constants.Account.ApiKey)
        password = try? json.getString(at: Constants.Account.password)
        token = try? json.getString(at: Constants.Account.token)
        expiration = try? json.getString(at: Constants.Account.expiration)
       // grantType = try? json.getString(at: Constants.keychainIdentifier.granttype)
        userName = try? json.getString(at: Constants.Account.userName)
    }
    
    init(id: String, email: String, hasRegistered: Bool, loginProvider: String, fullName: String, avatarBase64: String, lastCheckinLongitude: Double, lastCheckinLatitude: Double, lastCheckInLatitude: Double, lastCheckinDate: String, authorization: String, oldPassword: String, newPassword: String, apiKey: String, password: String, token: String, expiration: String, grantType: String, userName: String) {
        self.id = id
        self.email = email
        self.hasRegistered = hasRegistered
        self.loginProvider = loginProvider
        self.fullName = fullName
        self.avatarBase64 = avatarBase64
      //  self.lastCheckInLongitude = lastCheckInLongitude
        self.lastCheckInLatitude = lastCheckInLatitude
     //   self.lastCheckInDateTime = lastCheckInDateTime
        self.authorization = authorization
        self.oldPassword = oldPassword
        self.newPassword = newPassword
        self.apiKey = apiKey
        self.password = password
        self.token = token
        self.expiration = expiration
        self.grantType = grantType
        self.userName = userName
    }
    
    init (userInfo: String){
        requestType = .userInfo
        
    }
    // sample to init enums
    init(fullName: String, password: String, email: String, avatarBase64: String, apiKey: String) {
        self.email = email
        self.password = password
        self.fullName = fullName
        self.avatarBase64 = avatarBase64
        self.apiKey = Constants.ApiKey
         requestType = .register
    }
    
    init(newPassword: String) {
       self.newPassword = newPassword
        requestType = .setPassword
    }
    
    init(oldPasword: String, newPassWord: String, confirmPassword: String) {
//        self.oldPassword = oldPassword
  //      self.newPassword = newPassword
        self.confirmPassword = confirmPassword
        
        requestType = .changePasword
    }
    init(fullName: String, avatarBase64: String){
        self.fullName = fullName
        self.avatarBase64 = avatarBase64
        requestType = .userInfo
    }
    init(logout: String) {
        requestType = .logout
    }
    init(grantType: String, userName: String, Password: String ){
        self.grantType = grantType
        self.userName = userName
    //    self.password = password
        requestType = .login
    }
    // Always return HTTP.GET
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
        case .userInfo:
            return .get
        case .register:
            return .post
        default:
            return .get
        }
    }
    
    // A sample path to a single post
    func path() -> String {
        switch requestType {
        case .userInfo, .updateProfile:
            return "/api/Account/UserInfo"
        case .logout:
            return "/api/Account/logout"
        case .changePasword:
            return "/api/Account/changePassword"
        case .setPassword:
            return "/api/Account/setPassword"
        case .register:
            return "/api/Account/Register"
        case .login:
            return "/token"
      //  case .userInfo, .updateProfile:
         //   return "/api/Account/UserInfo"
        }
    }
    
    // Demo object isn't being posted to a server, so just return nil
    func toDictionary() -> [String: AnyObject]? {
        
        var params: [String: AnyObject] = [:]
        switch requestType {
        case .userInfo:
            //let startDate = Utils.adjustedTime().toString(.iso8601(nil))
            
            //var params: [String: AnyObject] = [:]
            params[Constants.Account.id] = id as AnyObject?
            params[Constants.Account.email] = email as AnyObject?
            params[Constants.Account.hasRegistered] = hasRegistered as AnyObject?
            params[Constants.Account.loginPrivider] = loginProvider as AnyObject?
            params[Constants.Account.fullName] = fullName as AnyObject?
            params[Constants.Account.avatarBase64] = avatarBase64 as AnyObject?
            params[Constants.Account.lastCheckInLongitude] = lastCheckInLongitude as AnyObject?
            params[Constants.Account.lastCheckInLatitude] = lastCheckInLatitude as AnyObject?
            params[Constants.Account.lastCheckInDateTime] = lastCheckInDateTime as AnyObject?
            params[Constants.Account.authorization] = authorization as AnyObject?
            params[Constants.Account.oldPassword] = oldPassword as AnyObject?
            params[Constants.Account.newPassword] = newPassword as AnyObject?
            params[Constants.Account.ApiKey] = apiKey as AnyObject?
            params[Constants.Account.password] = password as AnyObject?
            params[Constants.Account.token] = token as AnyObject?
            params[Constants.Account.expiration] = expiration as AnyObject?
           // return params
            
        case .register:
            //var params: [String: AnyObject] = [:]
            
            params[Constants.Account.fullName] = fullName as AnyObject
            params[Constants.Account.email] = email as AnyObject?
            params[Constants.Account.password] = password as AnyObject?
            params[Constants.Account.avatarBase64] = avatarBase64 as AnyObject?
            params[Constants.Account.ApiKey] = apiKey as AnyObject?
            
           // return params
        case .updateProfile:
            params[Constants.Account.fullName] = fullName as AnyObject?
            params[Constants.Account.avatarBase64] = avatarBase64 as AnyObject?
           // return params
        default:
            return nil
        }
        return params
    }
    
}


