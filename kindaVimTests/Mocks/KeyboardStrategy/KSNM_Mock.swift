@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation
import VimEngineState


class KeyboardStrategyNormalModeMock: KeyboardStrategyNormalModeProtocol {
    
    var functionCalled = ""
    
        
    func AForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func AForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func aForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func aForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func bForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func bForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caretForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caretForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cbForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cbForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ccForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ccForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cDollarSignForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cDollarSignForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ceForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ceForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cggForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cggForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cGForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cGForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ciwForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ciwForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func clForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func clForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlB() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlD() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlF() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cwForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cwForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dbForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dbForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dDollarSignForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dDollarSignForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ddForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func ddForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }

    func deForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func deForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dGForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dGForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dggForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dggForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dhForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dhForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func djForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func djForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dkForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dkForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dlForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dlForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSignForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSignForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dwForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func dwForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func eForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func eForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gCaretForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gCaretForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSignForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSignForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gUnderscoreForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gUnderscoreForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZeroForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZeroForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func geForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func geForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gIForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gIForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gj() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gk() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func GForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func GForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ggForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func h() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func IForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func IForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func i() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func JForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func JForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func j() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func k() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func l(times count: Int? = 1) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func oForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func oForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func OForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func OForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func pForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func pForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func PForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func PForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func rForNonTextElement(with replacement: KeyCombination) -> [KeyCombination] {
        functionCalled = #function
        
        return[]
    }
    
    func rForTextElement(with replacement: KeyCombination) -> [KeyCombination] {
        functionCalled = #function
        
        return[]
    }
    
    func controlR() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlRForAXElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func u() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func uForAXElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscoreForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func underscoreForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlU() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func wForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func wForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yyForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yyForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yiwForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yiwForTextElement(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zeroForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zeroForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    func escape() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    // temporary for pressing enter in Command Mode
    // to act like an enter in Insert Mode
    // checking if it feels better (like in Alfred)
    func enter() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func post(_ keyCombinations: [KeyCombination]) {}
    
}