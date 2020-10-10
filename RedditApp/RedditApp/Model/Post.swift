//
//  Post.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Post: Codable {
    let title: String
    let author: String
    let created: Int
    let thumbnail: String
    let numberOfComments: Int
    var unread: Bool = true
    
    enum CodingKeys: String, CodingKey {
        case title, author, created, thumbnail
        case numberOfComments = "num_comments"
    }

    init(title: String, author: String, created: Int, thumbnail: String, numberOfComments: Int) {
        self.title = title
        self.author = author
        self.created = created
        self.thumbnail = thumbnail
        self.numberOfComments = numberOfComments
    }
}
