//
//  DetailsUserResponse.swift
//  CombineExample1
//
//  Created by Anton Gorlov on 01.06.2022.
//

import Foundation

struct DetailsUserResponse: Decodable {
    
    let id              : Int
    let name            : String
    let location        : String
    let profileURLString: String
    let repoCount       : Int
    let followers       : Int
    
    enum CodingKeys: String, CodingKey {
       
        case id
        case name
        case location
        case profileURLString = "html_url"
        case repoCount        = "public_repos"
        case followers
    }
    
}
//
//{
//  "login": "octocat",
//  "id": 1,
//  "node_id": "MDQ6VXNlcjE=",
//  "avatar_url": "https://github.com/images/error/octocat_happy.gif",
//  "gravatar_id": "",
//  "url": "https://api.github.com/users/octocat",
//  "html_url": "https://github.com/octocat",
//  "followers_url": "https://api.github.com/users/octocat/followers",
//  "following_url": "https://api.github.com/users/octocat/following{/other_user}",
//  "gists_url": "https://api.github.com/users/octocat/gists{/gist_id}",
//  "starred_url": "https://api.github.com/users/octocat/starred{/owner}{/repo}",
//  "subscriptions_url": "https://api.github.com/users/octocat/subscriptions",
//  "organizations_url": "https://api.github.com/users/octocat/orgs",
//  "repos_url": "https://api.github.com/users/octocat/repos",
//  "events_url": "https://api.github.com/users/octocat/events{/privacy}",
//  "received_events_url": "https://api.github.com/users/octocat/received_events",
//  "type": "User",
//  "site_admin": false,
//  "name": "monalisa octocat",
//  "company": "GitHub",
//  "blog": "https://github.com/blog",
//  "location": "San Francisco",
//  "email": "octocat@github.com",
//  "hireable": false,
//  "bio": "There once was...",
//  "twitter_username": "monatheoctocat",
//  "public_repos": 2,
//  "public_gists": 1,
//  "followers": 20,
//  "following": 0,
//  "created_at": "2008-01-14T04:33:35Z",
//  "updated_at": "2008-01-14T04:33:35Z"
//}
