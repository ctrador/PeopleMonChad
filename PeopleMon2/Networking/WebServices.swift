//
//  WebServices.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/5/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import Valet
import Foundation
import Alamofire
import Freddy

// central router to creat URL request contrvable request
class WebServices: NSObject {
    
    // Singleton
    static let shared = WebServices()
    
    //prevent object creation
    private override init() { }
    
    // vaseURL private and public vars
    fileprivate var _baseURL = ""
    var baseURL : String{
        
        get {
            return _baseURL
        }
        set {
            _baseURL = newValue
        }
    }
    
    // Store anuth token
    //  private var authToken: String?
    
    //func setAuthToken(_ token: String?) {
    
    private var authToken: String? {
        get {
            let myValet = VALValet(identifier: Constants.keychainIdentifier, accessibility: .whenUnlocked)
            
            if let authTokenString = myValet?.string(forKey: Constants.authToken){
                return authTokenString
            } else {
                return nil
            }
        }
        set {
            let myValet = VALValet(identifier: Constants.keychainIdentifier, accessibility: .whenUnlocked)
            if let newValue = newValue{
                myValet?.setString(newValue, forKey: Constants.authToken)
            } else {
                myValet?.removeObject(forKey: Constants.authToken)
            }
        }
    }
    
    fileprivate var authTokenExpireDate : String? {
        get {
            let myValet = VALValet(identifier: Constants.keychainIdentifier, accessibility: .whenUnlocked)
            
            if let authTokenExpireDate = myValet?.string(forKey: Constants.authTokenExpireDate){
                return authTokenExpireDate
            } else {
                return nil
            }
        }
        set {
            let myValet = VALValet(identifier: Constants.keychainIdentifier, accessibility: .whenUnlocked)
            if let newValue = newValue{
                myValet?.setString(newValue, forKey: Constants.authTokenExpireDate)
            } else {
                myValet?.removeObject(forKey: Constants.authTokenExpireDate)
            }
        }
    }
    func setAuthToken (_ token: String?, expration: String?) {
        authToken = token
        authTokenExpireDate = expration
        
    }
    // Step 7: function to check for authToken
    func userAuthTokenExists() -> Bool {
        if self.authToken != nil {
            return true
        }
        else {
            return false
        }
    }
    
    // Step 7: function to check if authToken is expired
    func userAuthTokenExpired() -> Bool {
        if self.authTokenExpireDate != nil {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss Z"
            
            let dateString = self.authTokenExpireDate!
            if let expireDate = dateFormatter.date(from: dateString) {
                let hourFromNow = Date().addingTimeInterval(3600)
                
                if expireDate.compare(hourFromNow) == ComparisonResult.orderedAscending {
                    return true
                } else {
                    return false
                }
            } else {
                return true
            }
        } else {
            return true
        }
    }
    
    // Step 7: function to clear the auth token
    func clearUserAuthToken() {
        if self.userAuthTokenExists() {
            self.authToken = nil
        }
    }
    
    // AuthRouter - all network calls go through this
    
    enum AuthRouter: URLRequestConvertible {
        static var baseURLString = WebServices.shared._baseURL
        static var OAuthToken: String?
        
        // Because AuthRouter is an enum, it needs to have a case to instantiate it
        
        case restRequest(NetworkModel)
        
        func asURLRequest() throws -> URLRequest {
            let URL = try AuthRouter.baseURLString.asURL()
            var urlRequest: URLRequest
            
            switch self {
            case .restRequest(let model):
                // Create the url request with the base url and add on the path component passed in via the NetworkModel
                urlRequest = URLRequest(url: URL.appendingPathComponent(model.path()))
                
                // Set the method to the method passed in via the NetworkModel
                urlRequest.httpMethod = model.method().rawValue
                
                // Check for an auth token and if it exists, add it to the request
                
                if let token = WebServices.shared.authToken {
                    urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
                }
                
                // Check for parameters and eithe radd them to the URL or the body depending on the Method
                if let params = model.toDictionary() {
                    if model.method() == .get {
                        return try! URLEncoding.default.encode(urlRequest, with: params)
                    } else {
                        return try! JSONEncoding.default.encode(urlRequest, with: params)
                    }
                }
                
                return urlRequest
            }
        }
    }
    
}
