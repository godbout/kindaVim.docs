//
//  KeyboardStrategyMock.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 05/05/2021.
//

@testable import kindaVim
import Foundation

class KeyboardStrategyMock: KeyboardStrategyProtocol {
    
    var functionLastCalled = ""

    func a() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func A() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func b() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func C() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func cc() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func ciw() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func dd() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func G() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func gg() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func h() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func I() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func j() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func k() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func l() -> [KeyCombination] {
        functionLastCalled = #function

        return []
    }

    func o() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func O() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func controlR() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func u() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func w() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func x() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func X() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func dollarSign() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func underscore() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

    func zero() -> [KeyCombination] {
        functionLastCalled = #function
        
        return []
    }

}
