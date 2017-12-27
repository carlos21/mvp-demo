//
//  UserService.swift
//  MVP_Sample
//
//  Created by Carlos Duclos on 9/15/17.
//  Copyright © 2017 Carlos Duclos. All rights reserved.
//

import Foundation

class UserService {
    
    static let shared = UserService()
    
    func login(username: String,
               password: String,
               success:@escaping (Dictionary<String, Any>) -> (),
               failure:@escaping (Error) -> ()) {
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) { 
            if (username == "abc" && password == "123") {
                let userInfo: Dictionary<String, Any> = ["firstName": "Carlos", "lastName": "Duclos", "age": 26]
                success(userInfo)
            } else {
                let error = NSError()
                failure(error)
            }
        }
    }
    
}
