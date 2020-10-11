//
//  DetailViewControllerTests.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 11/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import XCTest
@testable import RedditApp

class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!

    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
    }

    func testSetupPostContent() {
        // Given:
        sut.post = Mock.shared.getPost()
        // When:
        sut.setupPostContent()
        // Then:
        XCTAssertEqual(sut.authorLabel.text, "author")
        XCTAssertEqual(sut.postContentLabel.text, "title")
        XCTAssertEqual(sut.textLabel.text, "selftext")
    }
}
