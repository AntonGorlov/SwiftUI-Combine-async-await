//
//  UserViewModel.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import Foundation
import Combine

//@MainActor by using async/await for update UI in main thread

/// ViewModel for users
class UserViewModel: ObservableObject {
    
    @Published var users: [UserCellModel] = []
    @Published var isRequestFailed        = false
    @Published var detailsUser: DetailsUserModel = .init(id: 0,
                                                         fullName: "",
                                                         location: "",
                                                         profileURL: nil,
                                                         repoCount: 0,
                                                         followers: 0)

    private let pageLimit = 25
    private var currentLastId: Int? = nil
    private var cancellableBag = Set<AnyCancellable>()
    
    let apiService = APIService.shared
    
    func getAllUsers() {
        
        self.apiService.getAllUsers(perPage: pageLimit, sinceId: currentLastId)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
                switch completion {
                    
                case .failure(let error):
                    
                    self.isRequestFailed = true
                    print(error)
                    
                case .finished:
                    
                    print("finished")
                }
                
            } receiveValue: { users in
                
                let users = Mapper<UserCellModel>().map(users)
                self.users.append(contentsOf: users)
                self.currentLastId = users.last?.id
            }
            .store(in: &cancellableBag)

    }
    
    func getUser(_ userName: String) {
        
        self.apiService.getUser(userName)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                
                switch completion {
                    
                case .failure(let error):
                    
                    self.isRequestFailed = true
                    print(error)
                    
                case .finished:
                    
                    print("finished")
                }
            } receiveValue: { user in
                
                let userMap = Mapper<DetailsUserModel>().map(user)
                self.detailsUser = userMap
            }
            .store(in: &cancellableBag)

    }

    //MARK: - Implemented with an async/await
    
    func asyncGetUser(_ userName: String) {
        
        Task {
            
            do {
               
                let user = try await self.apiService.asyncGetUser(userName)
                let userMap = Mapper<DetailsUserModel>().map(user)
                self.detailsUser = userMap
                
            } catch {
                
                print("Request failed with error: \(error)")
            }
        }
    }
}
