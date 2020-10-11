//
//  Mocks.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 11/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation
@testable import RedditApp

class Mock {
    
    static let shared = Mock()
    
    func getDto() -> Dto {
        let dto = Dto(kind: "kind", data: getDtoData())
        
        return dto
    }
    
    func getEmptyDto() -> Dto {
        let dto = Dto(kind: nil, data: nil)
        
        return dto
    }
    
    func getDtoData() -> DtoData {
        let dtoData = DtoData(modhash: "modhash", children: [getDtoChild()], after: "after")
        
        return dtoData
    }
    
    func getEmptyDtoData() -> DtoData {
        let emptyDtoData = DtoData(modhash: nil, children: nil, after: nil)
        
        return emptyDtoData
    }
    
    func getDtoChild() -> DtoChild {
        let dtoChild = DtoChild(kind: "kind", data: getPost())
        
        return dtoChild
    }
    
    func getEmptyDtoChild() -> DtoChild {
        let emptyDtoChild = DtoChild(kind: nil, data: nil)
        
        return emptyDtoChild
    }
    
    func getPost() -> Post {
        let post = Post(title: "title", selftext: "selftext", author: "author", created: 11111, thumbnail: "thumbnail", numberOfComments: 9999)
        
        return post
    }
    
    func getEmptyPost() -> Post {
        let emptyPost = Post(title: nil, selftext: nil, author: nil, created: nil, thumbnail: nil, numberOfComments: nil)
        
        return emptyPost
    }
}
