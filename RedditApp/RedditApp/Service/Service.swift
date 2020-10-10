//
//  Service.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Service {
    
    func getPosts(ServiceCompleted: @escaping ([Post]) -> Void) {
        
        let dao = Dao()
        
        dao.getPosts { (dto) in
            
            let children = dto.data.children
            var posts: [Post] = []
            
            for child in children {
                let post = child.data
                
                posts.append(post)
            }
            
            ServiceCompleted(posts)
        }
    }
}
