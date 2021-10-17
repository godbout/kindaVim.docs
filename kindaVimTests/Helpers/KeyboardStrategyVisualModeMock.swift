@testable import kindaVim
import KeyboardStrategy
import KeyCombination
import Foundation


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var functionCalled = ""
    
    func b() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func dollarSign() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func d() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func e() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gDollarSign() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func ge() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func gg() -> [KeyCombination] {
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
    
    func gZero() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func G() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func h() -> [KeyCombination] {
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
       
    func l() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func vForEnteringFromNormalMode() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForVisualStyleCharacterwise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func vForVisualStyleLinewise() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func w() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
   
    func y() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
        
    func zero() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
}
