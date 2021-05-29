@testable import kindaVim
import XCTest

class KS_db_Tests: KS_BaseTests {

    func test_that_db_returns_option_delete() {
        let keyCombinations = keyboardStrategy.db()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .delete, option: true))
    }

}
