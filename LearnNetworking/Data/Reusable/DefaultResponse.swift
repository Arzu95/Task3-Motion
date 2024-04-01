//
//  DefaultResponse.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation

struct ListDataResponse<T: Codable>: Codable{
    var data: [T]?
}

struct DataResponse<T: Codable>: Codable{
    var data: T?
}

