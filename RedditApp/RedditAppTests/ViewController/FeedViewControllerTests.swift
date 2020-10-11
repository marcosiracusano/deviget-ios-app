//
//  FeedViewControllerTests.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 10/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import XCTest
@testable import RedditApp

class FeedViewControllerTests: XCTestCase {
    
    var sut: FeedViewController!

    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as? FeedViewController
        sut.loadViewIfNeeded()
        sut.postsArray = Mock.shared.getPostsArray()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testHasATableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }

    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
    }

    func testTableViewHasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }

    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:willDisplay:forRowAt:))))
    }
    
    func testTableViewCellHasReuseIdentifier() {
        let cell = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? FeedTableViewCell
        let actualReuseIdentifer = cell?.reuseIdentifier
        let expectedReuseIdentifier = "FeedTableViewCell"
        XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }

    func testTableViewHasCorrectCountOfCells() {
        let numberOfCells = 5
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 5), numberOfCells)
    }
    
    func testTableFirstCellHasCorrectLabelText() {
        let cell0 = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as? FeedTableViewCell
        XCTAssertEqual(cell0?.titleLabel.text, "title")
        XCTAssertEqual(cell0?.authorLabel.text, "author")
        XCTAssertEqual(cell0?.commentsLabel.text, "9999 comments")
        XCTAssertNotNil(cell0?.entryDateLabel.text)
    }
}
