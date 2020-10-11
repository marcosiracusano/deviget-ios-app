//
//  DtoTests.swift
//  RedditAppTests
//
//  Created by Marco Siracusano on 11/10/2020.
//  Copyright © 2020 Marco Siracusano. All rights reserved.
//

import XCTest
@testable import RedditApp

class DtoTests: XCTestCase {

    func testInitWithNoContent() {
        // Given:
        let emptyDto = Mock.shared.getEmptyDto()
        // When:
        let sut: Dto = emptyDto
        // Then:
        XCTAssertNil(sut.kind)
        XCTAssertNil(sut.data)
    }
    
    func testInit() {
        // Given:
        let dto = Mock.shared.getDto()
        // When:
        let sut: Dto = dto
        // Then:
        XCTAssertEqual(sut.kind, "kind")
        XCTAssertNotNil(sut.data)
    }
}
