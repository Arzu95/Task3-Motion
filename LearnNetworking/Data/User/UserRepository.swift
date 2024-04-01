//
//  UserRepository.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation
import Moya

protocol UserRepository {
    func getListUser() async throws -> ListDataResponse<User>
    func getSingleUser(by id: Int) async throws -> DataResponse<User>
}

final class DefaultUserRepository: UserRepository {
    
    private let provider: MoyaProvider<UserTargetType>
    
    init(provider: MoyaProvider<UserTargetType> = .defaultProvider() ) {
        self.provider = provider
    }
    
    func getListUser() async throws -> ListDataResponse<User> {
        try await provider.asyncRequest(.getListUser, model: ListDataResponse<User>.self)
    }
    
    func getSingleUser(by id: Int) async throws -> DataResponse<User> {
        try await provider.asyncRequest(.getSingleUser(id), model: DataResponse<User>.self)
    }
    
}

final class MockUserRepository: UserRepository {
    func getListUser() async throws -> ListDataResponse<User> {
        return .init()
    }
    
    func getSingleUser(by id: Int) async throws -> DataResponse<User> {
        return .init()
    }
}
