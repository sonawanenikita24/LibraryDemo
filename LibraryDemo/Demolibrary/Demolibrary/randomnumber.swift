//
//  randomnumber.swift
//  Demolibrary
//
//  Created by BridgeLabz on 19/08/19.
//  Copyright © 2019 BridgeLabz. All rights reserved.
//

import Foundation
import Security

public class randomnumber {
    
    private static let server = "example.com"
    private static let accessGroupName = "myKeychainGroup1"

    public static func getMessage() -> String{
        return "Hello world" // creating message
    }
    
    public static func getCustomMessage(string : String) -> String{
        return """
        This is the custom message -
        
        \(string)
        """ // creating message
    }
    
    public static func saveUserData(email : String, password: String) -> Bool {
        
        let attributes : [String : Any] = [
            (kSecClass as String): kSecClassInternetPassword,
            (kSecAttrServer as String): server,
            (kSecAttrAccount as String): email,
            (kSecAttrSynchronizable as String) : kCFBooleanTrue,
            (kSecValueData as String): password.data(using: .utf8)!]

        
        if SecItemCopyMatching(attributes as CFDictionary, nil) == noErr{
           
            return false
        }
        
        // add item in keychain
        let isSuccssful = SecItemAdd(attributes as CFDictionary, nil)
        
        print("OSStatus : \(isSuccssful)")
        
        return isSuccssful == noErr
    }
    
    public static func RetriveUserdata(email:String,password:String) -> Void{
        let query: [String: Any] = [
            (kSecClass as String): kSecClassInternetPassword,
            (kSecAttrServer as String): server,
            (kSecAttrSynchronizable as String) : kCFBooleanTrue,
            (kSecMatchLimit as String): kSecMatchLimitAll,
            (kSecReturnAttributes as String): true,
            (kSecReturnData as String): true]
        
         var items : CFTypeRef?
       
        // should succeed
        let statusCode = SecItemCopyMatching(query as CFDictionary, &items)
        if statusCode == noErr {
            print("\nItems found!!")
        } else {
            
            print("\nError - Item Not found: \(statusCode)")
        }
        
        if let items = items as? [[String: Any]] {
            for item in items {
                let email = item[kSecAttrAccount as String] as? String
                let passwordData = item[kSecValueData as String] as? Data
                let password = String(data: passwordData!, encoding: .utf8)
                print("\(email!) - \(password!)")
             
            }
        }
    }
    
    public static func DeleteData()
    {
        var query: [String: Any] = [
                    (kSecClass as String): kSecClassInternetPassword,
                    (kSecAttrServer as String): server,
                    (kSecAttrSynchronizable as String) : kCFBooleanTrue,
                    (kSecMatchLimit as String): kSecMatchLimitAll,
                    (kSecReturnAttributes as String): true,
                    (kSecReturnData as String): true]
        
        var items : CFTypeRef?
        let statusCode = SecItemCopyMatching(query as CFDictionary, &items)
                if statusCode == noErr {
                    print("\nItems found!")
        
                    if let items =  items as? [[String: Any]] {
                        query[kSecMatchLimit as String] = nil
                        query[kSecReturnAttributes as String] = nil
                        query[kSecReturnData as String] = nil
        
                        for item in items {
                            let email = item[kSecAttrAccount as String]
                            query[kSecAttrAccount as String] = email
                            let statusCode = SecItemDelete(query as CFDictionary)
                            if statusCode == noErr {
                                print("Item deleted : \(email!)")
                            } else {
                                print(statusCode)
                            }
                        }
                    }
                } else {
                    
                    print("\nError : NO items found , \(statusCode)")
                }
        
            }
    }

