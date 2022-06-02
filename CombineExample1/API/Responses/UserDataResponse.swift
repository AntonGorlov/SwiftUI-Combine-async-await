//
//  UserDataResponse.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 31.05.2022.
//

import Foundation

struct UserDataResponse: Decodable {
    
    let id: Int
    let name: String
    let imageString: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name = "login"
        case imageString = "avatar_url"
    }
}

/*
 Sample User JSON object
 
 {
     "login": "mojombo",
     "id": 1,
     "node_id": "MDQ6VXNlcjE=",
     "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
     "gravatar_id": "",
     "url": "https://api.github.com/users/mojombo",
     "html_url": "https://github.com/mojombo",
     "followers_url": "https://api.github.com/users/mojombo/followers",
     "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
     "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
     "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
     "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
     "organizations_url": "https://api.github.com/users/mojombo/orgs",
     "repos_url": "https://api.github.com/users/mojombo/repos",
     "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
     "received_events_url": "https://api.github.com/users/mojombo/received_events",
     "type": "User",
     "site_admin": false
 }
 */
