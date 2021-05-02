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

        guard transformedKeys.count == 4 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].action, .release)
        XCTAssertEqual(transformedKeys[2].key, .delete)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .delete)
        XCTAssertEqual(transformedKeys[3].action, .release)
    }

    func test_that_X_is_getting_transformed_to_delete() {
        let transformedKeys = KeyboardStrategy.X()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .delete)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .delete)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_dd_is_getting_transformed_to_a_big_file_of_key_combinations() {
        let transformedKeys = KeyboardStrategy.dd()

        guard transformedKeys.count == 18 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
        
        XCTAssertEqual(transformedKeys[2].key, .a)
        XCTAssertEqual(transformedKeys[2].control, true)
        XCTAssertEqual(transformedKeys[2].shift, true)
        XCTAssertEqual(transformedKeys[2].action, .press)
        XCTAssertEqual(transformedKeys[3].key, .a)
        XCTAssertEqual(transformedKeys[3].control, true)
        XCTAssertEqual(transformedKeys[3].shift, true)
        XCTAssertEqual(transformedKeys[3].action, .release)
        
        XCTAssertEqual(transformedKeys[4].key, .delete)
        XCTAssertEqual(transformedKeys[4].action, .press)
        XCTAssertEqual(transformedKeys[5].key, .delete)
        XCTAssertEqual(transformedKeys[5].action, .release)
        
        XCTAssertEqual(transformedKeys[6].key, .down)
        XCTAssertEqual(transformedKeys[6].action, .press)
        XCTAssertEqual(transformedKeys[7].key, .down)
        XCTAssertEqual(transformedKeys[7].action, .release)
        
        XCTAssertEqual(transformedKeys[8].key, .a)
        XCTAssertEqual(transformedKeys[8].control, true)
        XCTAssertEqual(transformedKeys[8].action, .press)
        XCTAssertEqual(transformedKeys[9].key, .a)
        XCTAssertEqual(transformedKeys[9].control, true)
        XCTAssertEqual(transformedKeys[9].action, .release)
        
        XCTAssertEqual(transformedKeys[10].key, .delete)
        XCTAssertEqual(transformedKeys[10].action, .press)
        XCTAssertEqual(transformedKeys[11].key, .delete)
        XCTAssertEqual(transformedKeys[11].action, .release)
        
        XCTAssertEqual(transformedKeys[12].key, .a)
        XCTAssertEqual(transformedKeys[12].control, true)
        XCTAssertEqual(transformedKeys[12].action, .press)
        XCTAssertEqual(transformedKeys[13].key, .a)
        XCTAssertEqual(transformedKeys[13].control, true)
        XCTAssertEqual(transformedKeys[13].action, .release)
        
        XCTAssertEqual(transformedKeys[14].key, .right)
        XCTAssertEqual(transformedKeys[14].option, true)
        XCTAssertEqual(transformedKeys[14].action, .press)
        XCTAssertEqual(transformedKeys[15].key, .right)
        XCTAssertEqual(transformedKeys[15].option, true)
        XCTAssertEqual(transformedKeys[15].action, .release)
        
        XCTAssertEqual(transformedKeys[16].key, .left)
        XCTAssertEqual(transformedKeys[16].option, true)
        XCTAssertEqual(transformedKeys[16].action, .press)
        XCTAssertEqual(transformedKeys[17].key, .left)
        XCTAssertEqual(transformedKeys[17].option, true)
        XCTAssertEqual(transformedKeys[17].action, .release)
    }

}
