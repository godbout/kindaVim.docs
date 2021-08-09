@testable import kindaVim
import Foundation


class KeyboardStrategyVisualModeMock: KeyboardStrategyVisualModeProtocol {
    
    var functionCalled = ""
    

    func d() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func G() -> [KeyCombination] {
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
    
    func y() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
}
