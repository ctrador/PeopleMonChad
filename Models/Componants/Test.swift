//
//  Test.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/5/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//
/*
import Foundation
import Alamofire
import Freddy

class Test: NetworkModel  {
    
    // Object to excrice the network stack
    var userId : Int?
    var id : Int?
    var title : String?
    var body : String?
    
    // request Type
    enum RequestType {
        case getPost
        case getPosts
        case createPost
        
        
        
    }
    
    var requestType = RequestType.getPost
    
    
    // empty constructer
    required init() {
        
    }
    // create an object from JSON
    required init(json : JSON) throws {
        userId = try? json.getInt(at: Constants.Test.userId)
        id = try? json.getInt(at: Constants.Test.userId)
        title = try? json.getString(at: Constants.Test.userId)
        body = try? json.getString(at: Constants.Test.userId)
        
    }
    // always return HTTP.Get
    func method () -> Alamofire.HTTPMethod{
        switch requestType {
        case .getPost, .getPosts :
            return .get
        default:
            return.post
        }
    }
    // as imple path to grt singel post
    
    func path() ->String{
        switch requestType {
        case .getPost:
            return "/posts/1"
        case .getPosts:
            return "/posts"
        case .createPost:
            return "/posts"
            
        }
    }// demo object isn't being posted to a server nill
    func toDictionary() -> [String: AnyObject]?{
        switch requestType {
        case .createPost:
            var params: [String: AnyObject] = [:]
            
            params[Constants.Test.userId] = userId as AnyObject?? ?? 0 as AnyObject?
            params[Constants.Test.title] = title as AnyObject?? ?? "" as AnyObject?
            params[Constants.Test.body] = body as AnyObject?? ?? "" as AnyObject?
            
            return params
        default:
            return nil
        }
    }// helper method for debuging
    func description() -> String {
        var text = ""
        text += "title: \(title ?? "")\n"
        text += "body: \(title ?? "")\n"
        return text
    }
}



*/

 
