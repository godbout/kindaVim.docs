@testable import kindaVim
import XCTest


class UsingKSVM_BaseTests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.enterVisualMode()
    }

}
