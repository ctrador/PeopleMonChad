//
//  People.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/10/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

//
//  OtherUsers.swift
//  Peoplemon
//
//  Created by Andrew Noble on 11/6/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import Foundation
import MapKit
import Freddy
import Alamofire

class People : NetworkModel {
    
    var userId : String?
    var userName : String?
    var avatarBase : String?
    var longitute : Double?
    var latitude : Double?
    var created : String?
    var radiusInMeters : Double?
    var radius : Double?
    
    var requestType: RequestType = .nearby
    
    enum RequestType {
        case userCaught
        case userCheckin
        case nearby
        case userCatch
        
    }
    
    required init() {
        requestType = .userCaught
    }
    
    required init(json: JSON) throws {
        userId = try? json.getString(at: Constants.Person.userId)
        userName = try? json.getString(at: Constants.Person.userName)
        avatarBase = try? json.getString(at: Constants.Person.avatarBase64)
        longitute = try? json.getDouble(at: Constants.Person.longitude)
        latitude = try? json.getDouble(at: Constants.Person.latitude)
        created = try? json.getString(at: Constants.Person.created)
        radiusInMeters = try? json.getDouble(at: Constants.Person.radius)
        
    }
    
    init(radius: Double) {
        
        self.radiusInMeters = radius
        self.requestType = .nearby
    }
    
    init (coordinate : CLLocationCoordinate2D) {
        self.longitute = coordinate.longitude
        self.latitude = coordinate.latitude
        self.requestType = .userCheckin
    }
    
    init(longitude: Double, latitude: Double) {
        self.longitute = longitude
        self.latitude = latitude
        self.requestType = .userCheckin
    }
    
    
    init(userId: String, radiusInMeters: Double) {
        self.requestType = .userCaught
        self.userId = userId
        self.radiusInMeters = radiusInMeters
    }
    
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
        case .nearby, .userCaught:
            return .get
        default:
            return .post
        }
    }
    
    func path() -> String {
        switch requestType {
        case .nearby:
            return "/v1/User/Nearby"
        case .userCheckin:
            return "/v1/User/CheckIn"
        case .userCatch:
            return "/v1/User/Catch"
        case .userCaught:
            return "/v1/User/Caught"
        }
    }
    
    func toDictionary() -> [String: AnyObject]? {
        var params: [String: AnyObject] = [:]
        
        switch requestType {
        case .nearby:
            params[Constants.Person.radius] = radiusInMeters as AnyObject?
        case .userCheckin:
            params[Constants.Person.longitude] = longitute as AnyObject?
            params[Constants.Person.latitude] = latitude as AnyObject?
        case .userCatch:
            params[Constants.Person.caughtUserId] = userId as AnyObject?
            params[Constants.Person.radius] = radiusInMeters as AnyObject?
        case .userCaught:
            break
        }
        
        return params
    }
    
    
    
    
    
    
    
    
    
    
}



