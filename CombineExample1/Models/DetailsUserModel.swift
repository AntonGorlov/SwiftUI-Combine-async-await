//
//  DetailsUserModel.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 01.06.2022.
//

import Foundation

/// Details model
struct DetailsUserModel {
    
    let id        : Int
    let fullName  : String
    let location  : String
    let profileURL: URL?
    let repoCount : Int
    let followers : Int
}
