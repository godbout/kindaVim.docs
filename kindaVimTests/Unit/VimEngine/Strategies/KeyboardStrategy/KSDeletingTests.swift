//
//  KSDeletingTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSDeletingTests: XCTestCase {
    
    func test_that_x_is_getting_transformed_to_right_delete() {
        let transformedKeys = KeyboardStrategy.x()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .both)
        XCTAssertEqual(transformedKeys[1].key, .delete)
        XCTAssertEqual(transformedKeys[1].action, .both)
    }

    func test_that_X_is_getting_transformed_to_delete() {
        let transformedKeys = KeyboardStrategy.X()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .delete)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
    func test_that_dd_is_getting_transformed_to_a_big_file_of_key_combinations() {
        let transformedKeys = KeyboardStrategy.dd()

        guard transformedKeys.count == 9 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
        
        XCTAssertEqual(transformedKeys[1].key, .a)
        XCTAssertEqual(transformedKeys[1].control, true)
        XCTAssertEqual(transformedKeys[1].shift, true)
        XCTAssertEqual(transformedKeys[1].action, .both)
        
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .both)
        
        XCTAssertEqual(transformedKeys[3].key, .down)
        XCTAssertEqual(transformedKeys[3].action, .both)
        
        XCTAssertEqual(transformedKeys[4].key, .a)
        XCTAssertEqual(transformedKeys[4].control, true)
        XCTAssertEqual(transformedKeys[4].action, .both)
        
        XCTAssertEqual(transformedKeys[5].key, .delete)
        XCTAssertEqual(transformedKeys[5].action, .both)
        
        XCTAssertEqual(transformedKeys[6].key, .a)
        XCTAssertEqual(transformedKeys[6].control, true)
        XCTAssertEqual(transformedKeys[6].action, .both)
        
        XCTAssertEqual(transformedKeys[7].key, .right)
        XCTAssertEqual(transformedKeys[7].option, true)
        XCTAssertEqual(transformedKeys[7].action, .both)
        
        XCTAssertEqual(transformedKeys[8].key, .left)
        XCTAssertEqual(transformedKeys[8].option, true)
        XCTAssertEqual(transformedKeys[8].action, .both)
    }

}
