//
//  DtoDataTests.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 11/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import XCTest
@testable import RedditApp

class DtoDataTests: XCTestCase {

    func testInitWithNoContent() {
        // Given:
        let emptyDtoData = Mock.shared.getEmptyDtoData()
        // When:
        let sut: DtoData = emptyDtoData
        // Then:
        XCTAssertNil(sut.modhash)
        XCTAssertNil(sut.children)
        XCTAssertNil(sut.after)
    }
    
    func testInit() {
        // Given:
        let dtoData = Mock.shared.getDtoData()
        // When:
        let sut: DtoData = dtoData
        // Then:
        XCTAssertEqual(sut.modhash, "modhash")
        XCTAssertNotNil(sut.children)
        XCTAssertEqual(sut.after, "after")
    }
}
