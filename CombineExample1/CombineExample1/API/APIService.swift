//
//  APIService.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import Foundation
import Combine

/// API service gets some data in GitHub
class APIService {
    
    private let apiConfig = APIConfiguration()
    
    static let shared = APIService()
    
    func getAllUsers(perPage: Int = 30, sinceId: Int? = nil) -> AnyPublisher<[UserDataResponse], Error> {
        
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = "/users"
        
        components.queryItems = [
            URLQueryItem(name: "per_page", value: "\(perPage)"),
            URLQueryItem(name: "since", value: (sinceId != nil) ? "\(sinceId!)" : nil)
        ]
        
        guard let url = components.url else {
            
            return Fail(error: FetchError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url,
                                 timeoutInterval: 10)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { _ in FetchError.unknown }
            .decode(type: [UserDataResponse].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func getUser(_ userName: String) -> AnyPublisher<DetailsUserResponse, Error> {
        
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = "/users/\(userName)"
       
        guard let url = components.url else {
            
            return Fail(error: FetchError.invalidURL)
                .eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url,
                                 timeoutInterval: 10)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { _ in FetchError.unknown }
            .decode(type: DetailsUserResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    //MARK: - Implemented with an async/await
    
    func asyncGetUser(_ userName: String) async throws -> DetailsUserResponse {
        
        var components = URLComponents()
        components.scheme = apiConfig.scheme
        components.host = apiConfig.host
        components.path = "/users/\(userName)"
        
        guard let url = components.url else {
            
            throw FetchError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let detailsUser = try JSONDecoder().decode(DetailsUserResponse.self, from: data)
        
        return detailsUser
    }
}
