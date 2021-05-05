//
//  AccessibilityStrategyStub.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 05/05/2021.
//

@testable import kindaVim
import Foundation

struct AccessibilityStrategyStub: AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityElement?) -> AccessibilityElement? {
        return nil
    }
    
    func l(on element: AccessibilityElement?) -> AccessibilityElement? {
        return nil        
    }
    
}
