@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_BaseTests: KS_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterVisualMode()
    }

}
