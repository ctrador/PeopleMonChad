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
    // Step 16: Add monthDayYear
   // static let monthDayYear = "MM/dd/yyyy"
    
    // Step 7: Add keychain strings
    public static let keychainIdentifier = "PeopleMonKeychain"
    public static let authTokenExpireDate = "authTokenExpireDate"
    public static let authToken = "authToken"
    public static let apiKey = "ApiKey"
    public static let ApiKey = "iOS301november2016"
    public static let grantType = "password"
  
    
    // Step 4: JSON Constants
    struct JSON {
        static let unknownError = "An Unknown Error Has Occurred"
        static let processingError = "There was an error processing the response"
    }
    
    // Step 9: BudgetUser Constants
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
        static let userName = "user_name"
        static let avatarBase64 = "avatar_base_64"
        static let longitude = "longitude"
        static let latitude = "latitude"
        static let created = "created"
        static let caughtUserId = "caught_user_id"
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
        static let token = "token"
        static let expirationDate = "expiration"
        
    }
    
    // Step 11: Expense Constants
    struct Expense {
        static let id = "id"
        static let amount = "amount"
        static let category = "category"
        static let date = "date"
        static let note = "note"
        static let categoryId = "categoryId"
        static let categoryName = "categoryName"
        
        // Step 19: Add month/year
        static let month = "month"
        static let year = "year"
    }
}

// MARK: - Colors
// Step 14: UIColor extension and
extension UIColor {
    public class func rgba(red: NSInteger, green: NSInteger, blue: NSInteger, alpha: Float = 1.0) -> UIColor {
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(alpha))
    }
}

struct ColorPalette {
    static let PositiveColor = UIColor.rgba(red: 15, green: 181, blue: 46)
    static let NegativeColor = UIColor.rgba(red: 219, green: 31, blue: 31)
    static let BlueColor = UIColor.rgba(red: 12, green: 35, blue: 64)
    static let GoldColor = UIColor.rgba(red: 201, green: 151, blue: 0)
    static let calendarCellColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.1)
    static let calendarTodayColor = UIColor.rgba(red: 12, green: 35, blue: 64, alpha: 0.3)
    static let calendarBorderColor = UIColor.rgba(red: 12, green: 35, blue: 64, alpha: 0.8)
}




