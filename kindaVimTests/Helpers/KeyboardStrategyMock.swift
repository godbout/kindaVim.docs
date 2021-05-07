@testable import kindaVim
import Foundation

class KeyboardStrategyMock: KeyboardStrategyProtocol {
    
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

    func cc() -> [KeyCombination] {
        functionCalled = #function

        return []
    }

    func ciw() -> [KeyCombination] {
        functionCalled = #function

        return []
    }

    func dd() -> [KeyCombination] {
        functionCalled = #function

        return []
    }

    func G() -> [KeyCombination] {
        functionCalled = #function

        return []
    }

    func gg() -> [KeyCombination] {
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

    func o() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }

    func O() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }

    func controlR() -> [KeyCombination] {
        functionCalled = #function
        
        return []
    }

    func u() -> [KeyCombination] {
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

    func dollarSign() -> [KeyCombination] {
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

}
