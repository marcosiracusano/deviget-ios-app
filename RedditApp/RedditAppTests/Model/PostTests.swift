//
//  PostTests.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 11/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import XCTest
@testable import RedditApp

class PostTests: XCTestCase {

    func testInitWithNoContent() {
        // Given:
        let emptyPost = Mock.shared.getEmptyPost()
        // When:
        let sut: Post = emptyPost
        // Then:
        XCTAssertNil(sut.title)
        XCTAssertNil(sut.selftext)
        XCTAssertNil(sut.author)
        XCTAssertNil(sut.created)
        XCTAssertNil(sut.thumbnail)
        XCTAssertNil(sut.numberOfComments)
    }
    
    func testInit() {
        // Given:
        let post = Mock.shared.getPost()
        // When:
        let sut: Post = post
        // Then:
        XCTAssertEqual(sut.title, "title")
        XCTAssertEqual(sut.selftext, "selftext")
        XCTAssertEqual(sut.author, "author")
        XCTAssertEqual(sut.created, 11111)
        XCTAssertEqual(sut.thumbnail, "thumbnail")
        XCTAssertEqual(sut.numberOfComments, 9999)
    }
}
