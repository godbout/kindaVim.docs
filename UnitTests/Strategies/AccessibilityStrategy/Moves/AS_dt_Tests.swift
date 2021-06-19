@testable import kindaVim
import XCTest


// this move is actually just calling ct. the only difference is that the VimEngine
// will not go into insert mode after. so no tests needed here.
class AS_dt_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.dt(to: character, on: element) 
    }
    
}
