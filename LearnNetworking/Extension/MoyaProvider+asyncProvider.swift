//
//  MoyaProvider+asyncProvider.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation
import Moya

extension MoyaProvider {
    func asyncRequest<T: Codable>(_ target: Target, model: T.Type) async throws -> T {
        
        return try await withCheckedThrowingContinuation ({ continuation in
            self.request(target) { result in
                switch result {
                case .failure(let moyaError):
                    continuation.resume(throwing: moyaError)
                case .success(let response):
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    do {
                        let decodedData = try decoder.decode(model.self, from: response.data)
                        continuation.resume(returning: decodedData)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                }
            }
        })
    }
}
