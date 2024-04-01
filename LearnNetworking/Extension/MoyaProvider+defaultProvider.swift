//
//  MoyaProvider+defaultProvider.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation
import Moya

extension MoyaProvider{
    static func defaultProvider() -> MoyaProvider{
        return MoyaProvider(plugins: [NetworkLoggerPlugin()])
    }
}
