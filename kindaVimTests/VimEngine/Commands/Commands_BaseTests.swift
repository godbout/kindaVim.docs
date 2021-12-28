@testable import kindaVim
import KeyCombination
import XCTest


class Commands_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    let commandLineModeMock = CommandLineModeMock()
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()

    override func setUp() {
        kindaVimEngine.commandLineMode = commandLineModeMock
        kindaVimEngine.asNormalMode = asNormalModeMock
    }

}
