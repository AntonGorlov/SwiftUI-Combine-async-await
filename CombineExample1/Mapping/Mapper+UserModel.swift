//
//  Mapper+UserCellModel.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import Foundation

extension Mapper {
    
    func map(_ model: [UserDataResponse]) -> [UserCellModel] {
        
        return model.map { Mapper<UserCellModel>().map($0) }
    }
    
    func map(_ model: UserDataResponse) -> UserCellModel {
        
         .init(id: model.id,
               name: model.name,
               avatarURL: URL(string: model.imageString))
    }
}
