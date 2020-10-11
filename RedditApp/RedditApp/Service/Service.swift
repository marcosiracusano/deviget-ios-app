//
//  Service.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Service {
    
    func getPosts(params: String?, ServiceCompleted: @escaping ([Post]) -> Void) {
        
        let dao = Dao()
        
        dao.getPosts(params: params) { (dto) in
            
            let after = dto.data?.after
            let children = dto.data?.children
            var posts: [Post] = []
            
            for child in children ?? [] {
                child.data?.after = after
                if let post = child.data {
                    posts.append(post)
                }
            }
            
            ServiceCompleted(posts)
        }
    }
}
