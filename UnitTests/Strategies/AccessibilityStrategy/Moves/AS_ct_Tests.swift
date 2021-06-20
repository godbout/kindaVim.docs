@testable import kindaVim
import XCTest


// this move is actually just calling dt. the only difference is that the VimEngine
// will not go into insert mode after. so no tests needed here.
class AS_ct_Tests: AS_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.ct(to: character, on: element) 
    }
    
}
