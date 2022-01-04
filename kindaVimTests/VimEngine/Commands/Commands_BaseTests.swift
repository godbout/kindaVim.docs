@testable import kindaVim
import KeyCombination
import XCTest


class Commands_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    let commandsMock = CommandsMock()
    let asNormalModeMock = AccessibilityStrategyNormalModeMock()

    override func setUp() {
        kindaVimEngine.commands = commandsMock
        kindaVimEngine.asNormalMode = asNormalModeMock
    }

}
