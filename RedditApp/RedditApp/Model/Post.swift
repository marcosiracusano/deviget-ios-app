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
    let selftext: String
    let author: String
    let created: Double
    let thumbnail: String
    let numberOfComments: Int
    var unread: Bool = true
    var after: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case title, selftext, author, created, thumbnail
        case numberOfComments = "num_comments"
    }

    init(title: String, selftext: String, author: String, created: Double, thumbnail: String, numberOfComments: Int) {
        self.title = title
        self.selftext = selftext
        self.author = author
        self.created = created
        self.thumbnail = thumbnail
        self.numberOfComments = numberOfComments
    }
}
