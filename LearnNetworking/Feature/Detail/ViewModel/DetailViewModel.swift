//
//  DetailViewModel.swift
//  LearnNetworking
//
//  Created by Muhammad Arzu on 05/03/24.
//

import Foundation


class DetailViewModel: ObservableObject {
    @Published var user: User?
    var test = "Test"
    @Published var isError = false
    @Published var errorMessage = ""
    
    let userRepository: UserRepository
    
    init(userRepository: UserRepository = DefaultUserRepository()) {
        self.userRepository = userRepository
//        self.anotherTest = anotherTest
    }
    
    @MainActor
    func getSingleUser(id: Int){
        Task {
            
            do {
                let result = try await userRepository.getSingleUser(by: id)
                self.user = result.data
            } catch(let error) {
                self.isError = true
                print("LOCALIZED", error.localizedDescription)
                print("RAW", error)
                self.errorMessage = error.localizedDescription
                
            }
        }
    }
    
}

class Test {
    func testDetail() {
//        let viewModel = DetailViewModel(id: 2, anotherTest: "", userRepository: MockUserRepository())
        //
//        viewModel.getSingleUser()
    }
}
