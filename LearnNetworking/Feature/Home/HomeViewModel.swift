//
//  HomeViewModel.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 14/02/24.
//

import Foundation


final class HomeViewModel: ObservableObject{
    private let userRepository: UserRepository
    
    @Published var userList: [User] = []
    
    init(userRepository: UserRepository = DefaultUserRepository()) {
        self.userRepository = userRepository
    }
    
    @MainActor
    func getAllUser() async{
        do{
            let data = try await userRepository.getListUser()
            self.userList = data.data ?? []
        } catch{
            print(error.localizedDescription)
        }
    }
}
