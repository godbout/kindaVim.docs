//
//  AccessibilityStrategy.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

import Foundation

struct AccessibilityElement {
    
    var text = ""
    var cursorLocation = 0
    var selectionLength = 0
    
}

struct AccessibilityStrategy {
    
    static func h(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }
        
        element.cursorLocation -= 1
        
        return element
    }
    
}
