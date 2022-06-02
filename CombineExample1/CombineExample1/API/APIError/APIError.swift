//
//  APIError.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 02.06.2022.
//

import Foundation

/// Type of Error
enum FetchError: Error {
    
    case invalidURL
    case missingData
    case unknown
    
    func descriptionError() -> String {
        
        switch self {
            
        case .invalidURL:
            
            return "Invalid URL"
        case .missingData:
            
            return "Missing Data"
        case .unknown:
            
            return "Unknown error"
        }
    }
}
