@testable import kindaVim
import KeyCombination
import XCTest


class HybridNM_BaseTests: Hybrid_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }

}
