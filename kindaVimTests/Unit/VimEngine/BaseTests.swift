//
//  BaseTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class BaseTests: XCTestCase {

    let keyboardStrategyMock = KeyboardStrategyMock()

    override func setUp() {
        VimEngineController.shared.keyboardStrategy = keyboardStrategyMock
        VimEngineController.shared.accessibilityStrategy = FailingAccessibilityStrategyStub()
        VimEngineController.shared.enterCommandMode()
    }

}
