//
//  Mapper.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import Foundation

/// Mapper for all type
struct Mapper<ReturnType> {
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    /// - Returns: <#description#>
    func map<MappableType>(_ model: MappableType) -> ReturnType {
        
        fatalError("Mapper did not find an available overload: \(MappableType.self) -> \(ReturnType.self)")
    }
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    /// - Returns: <#description#>
    func map<MappableType>(_ model: MappableType) -> ReturnType? {
        
        fatalError("Mapper did not find an available overload: \(MappableType.self) -> \(ReturnType.self)")
    }
    
    /// <#Description#>
    /// - Parameter model: <#model description#>
    /// - Returns: <#description#>
    func map<MappableType>(_ model: MappableType?) -> ReturnType? {
        
        fatalError("Mapper did not find an available overload: \(MappableType.self) -> \(ReturnType.self)")
    }
}

