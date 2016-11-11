//
//  Constants.swift
//  PeopleMon2
//
//  Created by Chad Trador on 11/5/16.
//  Copyright © 2016 Chad Trador. All rights reserved.
//

import UIKit
import Foundation

struct Constants {
    
    public static let keychainIdentifier = "PeopleMonKeychain"
    public static let authTokenExpireDate = "authTokenExpireDate"
    public static let authToken = "authToken"
    public static let ApiKey = "iOSandroid301november2016"
    public static let grantType = "password"
    public static let radius = 100.0
    
    // Step 4: JSON Constants
    struct JSON {
        static let unknownError = "An Unknown Error Has Occurred"
        static let processingError = "There was an error processing the response"
    }
    
    // Step 9: Account Constants
    struct Account {
        static let id = "Id"
        static let email = "Email"
        static let hasRegistered = "HasRegistered"
        static let loginPrivider = "LoginPrivider"
        static let fullName = "FullName"
        static let avatarBase64 = "AvatarBase64"
        static let lastCheckInLongitude = "LastCheckInLongitude"
        static let lastCheckInLatitude = "LastCheckInLatitude"
        static let lastCheckInDateTime = "LastChecInDateTime"
        static let authorization = "Authorization"
        static let oldPassword = "OldPassword"
        static let newPassword = "NewPassword"
        static let confirmPassword = "ConfirmPassword"
        static let ApiKey = "ApiKey"
        static let password = "Password"
        static let token = "access_token"
        static let expiration = ".expires"
        static let userName = "userName"
        
    }
    
    
    
    // Step 10: User Constants
    struct User {
        static let userId = "user_id"
        static let userName = "username"
        static let avatarBase64 = "avatar_base_64"
        static let longitude = "longitude"
        static let latitude = "latitude"
        static let created = "created"
        static let caughtUserId = "caughtUserId"
        static let radiusInMeters = "RadiusInMeters"
        static let conversationId = "conversation_id"
        static let recipientId = "recipient_id"
        static let recipientName = "recipent_name"
        static let lastMessage = "last_message"
        static let messageCount = "message_count"
        static let senderId = "sender_id"
        static let senderName = "sender_name"
        static let recipientAvatarBase64 = "recipient_avatar_base64"
        static let senderAvatarBase64 = "sender_avatar_base_64"
        static let count = "count"
        static let messageId = "message_id"
        static let message = "message"
        static let recipientUserId = " recipient_user_id"
        static let senderUserId = "sender_user_id"
        static let token = "access_token"
        static let expirationDate = ".expires"
        static let grantType = "grant_type"
        static let password = "password"
        static let radius = "radiusInMeters"
    }
    
    // Step 11: People Constants
    struct Person {
        static let userId = "UserId"
        static let userName = "UserName"
        static let latitude = "Latitude"
        static let longitude = "Longitude"
        static let created = "Created"
        static let radius = "radiusInMeters"
        static let caughtUserId = "CaughtUserId"
        static let avatarBase64 = "AvatarBase64"
    }
}




