//
//  test.swift
//  test
//
//  Created by Alexander Alemayhu on 26/02/16.
//  Copyright © 2016 A. Alemayhu. All rights reserved.
//

import XCTest

class test: XCTestCase {
    func testIncrementBy9() {
        var version = Semver(major: 0, minor: 6, patch: 6)
        version.increment(9)
        XCTAssertEqual([version.major, version.minor, version.patch], [0, 7, 5])
    }

    func testFromString() {
        let vers = "0.1.1"
        let version = Semver.fromString(vers)
        if let version = version {
            XCTAssertEqual([version.major, version.minor, version.patch], [0, 1, 1])
        } else {
            XCTFail("Could not create version from string: \(vers)")
        }
    }
}
