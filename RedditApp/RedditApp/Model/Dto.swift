//
//  Dto.swift
//  RedditApp
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import Foundation

class Dto: Codable {
    let kind: String
    let data: DtoData
    
    enum CodingKeys: String, CodingKey {
        case kind, data
    }

    init(kind: String, data: DtoData) {
        self.kind = kind
        self.data = data
    }
}

class DtoData: Codable {
    let modhash: String
    let children: [DtoChild]
    let after: String
    
    enum CodingKeys: String, CodingKey {
        case modhash, children, after
    }

    init(modhash: String, children: [DtoChild], after: String) {
        self.modhash = modhash
        self.children = children
        self.after = after
    }
}

class DtoChild: Codable {
    let kind: String
    let data: Post
    
    enum CodingKeys: String, CodingKey {
        case kind, data
    }

    init(kind: String, data: Post) {
        self.kind = kind
        self.data = data
    }
}
