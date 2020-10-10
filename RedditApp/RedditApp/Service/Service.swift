//
//  Service.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Service {
    
    func getPosts(ServiceCompleted: @escaping ([Dto]) -> Void) {
        
        let dao = Dao()
        
//        dao.getPosts { (posts) in
//            ServiceCompleted(posts)
//        }
    }
}
