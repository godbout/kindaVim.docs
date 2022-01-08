@testable import kindaVim
import KeyCombination
import XCTest
import KeyboardShortcuts
import Sauce
import SwiftUI


class GCECustomKeyboardShortcutTests: XCTestCase {
    
    var useCustomShortcutToEnterNormalModeProductionValue: Bool!
    var globalHotkeyCombination: KeyCombination!
    
    override func setUp() {
        useCustomShortcutToEnterNormalModeProductionValue = GlobalEventsController.useCustomShortcutToEnterNormalMode
        GlobalEventsController.useCustomShortcutToEnterNormalMode = true
        
        guard let customKeyboardShortcut = KeyboardShortcuts.getShortcut(for: .enterNormalMode) else { return XCTFail() }
        guard let key = Sauce.shared.key(for: customKeyboardShortcut.key!.rawValue) else { return XCTFail() }
        
        globalHotkeyCombination = KeyCombination(
            key: key,
            control: customKeyboardShortcut.modifiers.contains(.control),
            option: customKeyboardShortcut.modifiers.contains(.option),
            shift: customKeyboardShortcut.modifiers.contains(.shift),
            command: customKeyboardShortcut.modifiers.contains(.command)
        )

    }
    
    override func tearDown() {
        GlobalEventsController.useCustomShortcutToEnterNormalMode = useCustomShortcutToEnterNormalModeProductionValue
    }
    
}


// insert mode
extension GCECustomKeyboardShortcutTests {
    
    func test_that_when_in_insert_mode_the_global_hotkey_press_sets_Vim_in_normal_mode() {
        AppCore.shared.vimEngine.enterInsertMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.state.currentMode, .normal)
    }

    func test_that_when_in_insert_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterInsertMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
    
}


// normal mode
extension GCECustomKeyboardShortcutTests {
    
    func test_that_when_in_Normal_Mode_the_global_hotkey_press_switches_Vim_to_Insert_Mode() {
        AppCore.shared.vimEngine.enterNormalMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.state.currentMode, .insert)
    }

    func test_that_when_in_normal_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterNormalMode()

        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)

        XCTAssertTrue(captured)
    }
        
}


// visual mode
extension GCECustomKeyboardShortcutTests {
    
    func test_that_when_in_Visual_Mode_the_global_hotkey_press_switches_Vim_to_Insert_Mode() {
        AppCore.shared.vimEngine.enterVisualMode()

        _ = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)        

        XCTAssertEqual(AppCore.shared.vimEngine.state.currentMode, .insert)
    }
    
    func test_that_when_in_visual_mode_the_global_hotkey_press_is_captured_and_not_sent_back_to_macOS() {
        AppCore.shared.vimEngine.enterVisualMode()
        
        let captured = GlobalEventsController.handle(keyCombination: globalHotkeyCombination)
        
        XCTAssertTrue(captured)
    }

}
