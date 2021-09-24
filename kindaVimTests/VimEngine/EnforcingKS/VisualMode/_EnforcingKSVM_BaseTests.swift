@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_BaseTests: EnforcingKS_BaseTests {

    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterVisualMode()
    }

}
