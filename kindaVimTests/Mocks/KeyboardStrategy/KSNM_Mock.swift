@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation
import AXEngine
import Common


class KeyboardStrategyNormalModeMock: KeyboardStrategyNormalModeProtocol {
    
    var axEngine: AXEngineProtocol = AXEngine()
    var functionCalled = ""
    var relevantParameter: KeyCombination?
    
        
    func A(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func a(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func b(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func caret(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cb(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cc(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cDollarSign(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ce(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cG(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cgg(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ciw(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func cl(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
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
    
    func cw(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func db(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dDollarSign(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dd(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func de(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dG(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dgg(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dh(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dj(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dk(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dl(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSign(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dw(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func e(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func gCaret(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSign(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gUnderscore(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gZero(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func ge(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gI(_ vimEngineState: VimEngineState) -> [KeyCombination] {
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
    
    func G(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gg(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func h(times count: Int? = 1) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func I(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func i() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func J(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func j(times count: Int? = 1) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func k(times count: Int? = 1) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func l(times count: Int? = 1) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func o(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func O(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func P(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func p(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func r(with replacement: KeyCombination, _ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        relevantParameter = replacement
        
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
    
    func underscore(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func controlU() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func w(_ vimEngineState: VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yy(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func yiw(_ vimEngineState: inout VimEngineState) -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func zero(_ vimEngineState: VimEngineState) -> [KeyCombination] {
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
