@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation


class KeyboardStrategyNormalModeMock: KeyboardStrategyNormalModeProtocol {
    
    var functionCalled = ""
    
    
    func a() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func A() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func b() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func C() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cb() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cc() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cgg() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cG() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ciw() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlD() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func D() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func db() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ddForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func ddForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }

    func dgg() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dG() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func djForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func djForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dkForNonTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dkForTextElement() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func e() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gCaret() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSign() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gUnderscore() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZero() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ge() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gI() -> [KeyCombination] {
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
    
    func I() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func i() -> [KeyCombination] {
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
    
    func l(times count: Int = 1) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func o() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func O() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func p() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func P() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func r(with replacement: KeyCombination) -> [KeyCombination] {
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
    
    func s() -> [KeyCombination] {
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
    
    func controlU() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func w() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func x() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func X() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yy() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yiw() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caret() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSign() -> [KeyCombination] {
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
    
    func underscore() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zero() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func post(_ keyCombinations: [KeyCombination]) {}
    
}
