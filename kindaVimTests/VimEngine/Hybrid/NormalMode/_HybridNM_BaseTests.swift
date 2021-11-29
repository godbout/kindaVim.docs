@testable import kindaVim
import KeyCombination
import XCTest


class HybridASNM_BaseTests: SucceedingAS_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }

}
