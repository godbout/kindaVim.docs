@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_BaseTests: SucceedingAS_BaseTests {

    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterNormalMode()
    }

}
