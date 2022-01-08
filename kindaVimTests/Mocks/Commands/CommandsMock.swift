@testable import kindaVim
import Commands
import KeyCombination


class CommandsMock: CommandsProtocol {
    
    var functionCalled = ""
        
    
    func q() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func qExclamationMark() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func w() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func wq() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
    func x() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }
    
} 
