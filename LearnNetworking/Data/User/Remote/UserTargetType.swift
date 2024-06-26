//
//  UserTargetType.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation
import Moya

enum UserTargetType{
    case getListUser
    case getSingleUser(Int)
}

extension UserTargetType: DefaultTargetType {
    //Parameter ketika request, seperti page=2 dll
    var parameters: [String : Any] {
        switch self {
        case .getListUser:
            return [:]
        case .getSingleUser:
            return [:]
        }
    }
    
    var path: String {
        switch self {
        case .getListUser:
            return "/users"
        case .getSingleUser(let id):
            return "/users/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getListUser:
            return .get
        case .getSingleUser:
            return .get
        }
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        switch self {
        case .getListUser:
            //gunakan URLEncoding kalau tidak ada body atau parameter saat request
            //gunakan JSONEncoding kalau terdapat body atau parameter saat request
            return URLEncoding.default
        case .getSingleUser:
            return URLEncoding.default
        }
    }
    
    
    var task: Task{
        return .requestParameters(parameters: parameters, encoding: parameterEncoding)
    }
    
}
