//
//  DtoChildTests.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 11/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import XCTest
@testable import RedditApp

class DtoChildTests: XCTestCase {

    func testInitWithNoContent() {
        // Given:
        let emptyDtoChild = Mock.shared.getEmptyDtoChild()
        // When:
        let sut: DtoChild = emptyDtoChild
        // Then:
        XCTAssertNil(sut.kind)
        XCTAssertNil(sut.data)
    }
    
    func testInit() {
        // Given:
        let dtoChild = Mock.shared.getDtoChild()
        // When:
        let sut: DtoChild = dtoChild
        // Then:
        XCTAssertEqual(sut.kind, "kind")
        XCTAssertNotNil(sut.data)
    }
}
