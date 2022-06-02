//
//  Mapper+DetailsUserModel.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 01.06.2022.
//

import Foundation

extension Mapper {
    
    func map(_ model: DetailsUserResponse) -> DetailsUserModel {
        
        .init(id: model.id,
              fullName: model.name,
              location: model.location,
              profileURL: URL(string: model.profileURLString),
              repoCount: model.repoCount,
              followers: model.followers)
    }
}
