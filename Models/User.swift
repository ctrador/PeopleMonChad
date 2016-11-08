//
//  User.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/7/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import Foundation
import Alamofire
import Freddy

class User: NetworkModel{
    
    var userId: String?
    var userName: String?
    var avatarBase64: String?
    var longitude: Double?
    var latitude: Double?
    var created: String?
    var radiusInMeters: Int?
    var authorization: String?
    var caughtUserId: String?
    var conversationId: Int?
    var recipientId: String?
    var recipientName: String?
    var lastMessage: String?
    var messageCount: Int?
    var senderId: String?
    var senderName: String?
    var recipientAvatarBase64: String?
    var senderAvatarBase64: String?
    //var pageSize: Int?
    // var pageNumber: Int?
    var count: Int?
    var messageId: Int?
    var message: String?
    var recipientUserId: String?
    var senderUserId: String?
    
    
    // var messages = [recipientName, senderName, messageId, message, created, recipientUserId, senderUserId]
    enum RequestType {
        case checkIn
        case userCatch
        case conversation
        case userNearby
        
    }
    var requestType = RequestType.conversation
    
    required init() {}
    
    required init(json: JSON) throws {
        userId = try? json.getString(at: Constants.User.userId)
        userName = try? json.getString(at: Constants.User.userName)
        avatarBase64 = try? json.getString(at: Constants.User.avatarBase64)
        longitude = try? json.getDouble(at: Constants.User.longitude)
        latitude = try? json.getDouble(at: Constants.User.latitude)
        created = try? json.getString(at: Constants.User.created)
        caughtUserId = try? json.getString(at: Constants.User.caughtUserId)
        conversationId = try? json.getInt(at: Constants.User.conversationId)
        recipientId = try? json.getString(at: Constants.User.recipientId)
        recipientName = try? json.getString(at: Constants.User.recipientName)
        lastMessage = try? json.getString(at: Constants.User.lastMessage)
        messageCount = try? json.getInt(at: Constants.User.messageCount)
        senderId = try? json.getString(at: Constants.User.senderId)
        senderName = try? json.getString(at: Constants.User.senderName)
        recipientAvatarBase64 = try? json.getString(at: Constants.User.recipientAvatarBase64)
        senderAvatarBase64 = try? json.getString(at: Constants.User.senderAvatarBase64)
        count = try? json.getInt(at: Constants.User.count)
        messageId = try? json.getInt(at: Constants.User.messageId)
        message = try? json.getString(at: Constants.User.message)
        recipientUserId = try? json.getString(at: Constants.User.recipientUserId)
        senderUserId = try? json.getString(at: Constants.User.senderUserId)
        
    }
    
    init(userId: String, userName: String, avatarBase64: String, longitude: Double, latitude: Double, created: String, conversationId: Int, recipientId: String, recipientName: String, lastMessage: String, messageCount: Int, senderId: String, senderName: String,recipientAvatarBase64: String, senderAvatarBase64: String, count: Int) {
        self.userId = userId
        self.userName = userName
        self.avatarBase64 = avatarBase64
        self.longitude = longitude
        self.latitude = latitude
        self.created = created
        self.conversationId = conversationId
        self.recipientId = recipientId
        self.recipientName = recipientName
        self.lastMessage = lastMessage
        self.messageCount = messageCount
        self.avatarBase64 = avatarBase64
        self.senderId = senderId
        self.senderName = senderName
        self.recipientAvatarBase64 = recipientAvatarBase64
        self.senderAvatarBase64 = senderAvatarBase64
        self.count = count
    }
    
    init(checkIn: String) {
        requestType = .checkIn
    }
    
    init(userCatch: String) {
        requestType = .userCatch
    }
    
    init(userNearby: Int) {
        requestType = .userNearby
    }
    
    // Always return HTTP.GET
    func method() -> Alamofire.HTTPMethod {
        switch requestType {
        case .conversation:
            return .post
        default:
            return .get
        }
        
    }
    // A sample path to a single post
    func path() -> String {
        switch requestType {
        case .conversation:
            return "/v1/user/conversation"
        case .checkIn:
            return "/v1/user/checkIn"
        case .userCatch:
            return "/v1/user/catch"
        case .userNearby:
            return "/v1/user/Nearby"
            
        }
    }
    // Demo object isn't being posted to a server, so just return nil
    func toDictionary() -> [String: AnyObject]? {
        switch requestType {
        case .conversation:
            //let startDate = Utils.adjustedTime().toString(.iso8601(nil))
            
            var params: [String: AnyObject] = [:]
            params[Constants.User.userId] = userId as AnyObject?
            params[Constants.User.userName] = userName as AnyObject?
            params[Constants.User.longitude] = longitude as AnyObject?
            params[Constants.User.latitude] = latitude as AnyObject?
            params[Constants.User.avatarBase64] = avatarBase64 as AnyObject?
            params[Constants.User.created] = created as AnyObject?
            params[Constants.User.conversationId] = conversationId as AnyObject?
            params[Constants.User.recipientName] = recipientName as AnyObject?
            params[Constants.User.lastMessage] = lastMessage as AnyObject?
            params[Constants.User.messageCount] = messageCount as AnyObject?
            params[Constants.User.senderId] = senderId as AnyObject?
            params[Constants.User.senderName] = senderName as AnyObject?
            params[Constants.User.recipientAvatarBase64] = recipientAvatarBase64 as AnyObject?
            params[Constants.User.count] = count as AnyObject?
            // params[Constants.User.messages] = messages as AnyObject?
            return params
        default:
            return nil
        }
    }
    
    
}
