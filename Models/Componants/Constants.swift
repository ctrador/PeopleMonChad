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
    static let monthDayYear = "MM/dd/yyyy"
    
    // Step 7: Add keychain strings
    public static let keychainIdentifier = "PeopleMonKeychain"
    public static let authTokenExpireDate = "authTokenExpireDate"
    public static let authToken = "authToken"
    
    // Step 19: Add Notification constant
    static let newExpensesFound = "NewExpensesFound"
    
    // Step 3: Create Test Model Constants
    // MARK: Test Model
    struct Test {
        static let userId = "userId"
        static let id = "id"
        static let title = "title"
        static let body = "body"
    }
    
    // Step 4: JSON Constants
    struct JSON {
        static let unknownError = "An Unknown Error Has Occurred"
        static let processingError = "There was an error processing the response"
    }
    
    // Step 9: BudgetUser Constants
    struct Account {
        static let id = "id"
        static let email = "email"
        static let hasRegistered = "has_registered"
        static let loginPrivider = "login_privider"
        static let fullName = "full_name"
        static let avatarBase64 = "Avatar_base_64"
        static let lastCheckInLongitude = "last_checkin_longitude"
        static let lastCheckInLatitude = "last_checkin_latitude"
        static let lastCheckInDateTime = "last_checin_date_time"
        static let authorization = "authorization"
        static let oldPassword = "old_password"
        static let newPassword = "new_password"
        static let confirmPassword = "confirm_password"
        static let password = "password"
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




