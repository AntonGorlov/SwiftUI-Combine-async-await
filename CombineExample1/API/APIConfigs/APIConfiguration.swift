//
//  APIConfiguration.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 01.06.2022.
//

import Foundation

protocol IAPIConfiguration {
    
    var scheme: String { get }
    var host  : String { get }
}

/// Configuration for reuests. Include: scheme, host, endpoints
struct APIConfiguration: IAPIConfiguration {
    
    var scheme: String = "https"
    var host: String   = "api.github.com"
    
}
