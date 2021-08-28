@testable import kindaVim
import KeyCombination
import XCTest


// this move is actually just calling dt. the only difference is that the VimEngine
// will not go into insert mode after. so no tests needed here.
class ASNM_ct_Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.ct(to: character, on: element) 
    }
    
}
