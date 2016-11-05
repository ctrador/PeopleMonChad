//
//  NetworkModel.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/5/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//


import Foundation
import Alamofire
import Freddy


// Decribes what you need to make a network request and read it
protocol NetworkModel: JSONDecodable {
    
    init(json: JSON) throws
    init()
    // what is the HTTP Method (Get/post/put/ect)
    func method() -> Alamofire.HTTPMethod
    func path()-> String
    func toDictionary() -> [String: AnyObject]?
    
}

