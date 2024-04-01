//
//  UserResponse.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation


struct User: Codable, Identifiable{
    var id: Int?
    var email: String?
    var firstName: String?
    var lastName: String?
    var avatar: String?
    
    enum CodingKeys: String, CodingKey{
        case id, email, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    var fullName: String{
        return (firstName ?? "") + "" + (lastName ?? "")
    }
}




