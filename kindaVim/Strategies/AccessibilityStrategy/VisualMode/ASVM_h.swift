extension AccessibilityStrategyVisualMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if VimEngine.shared.visualStyle == .characterwise {
            if element.caretLocation + element.selectedLength - 1 <= Self.anchor {
                if element.caretLocation > element.currentLine.startLimit! {
                    element.caretLocation -= 1
                    element.selectedLength += 1
                }
            } else {
                if Self.head > element.currentLine.startLimit! {
                    if element.selectedLength > 1 {
                        element.selectedLength -= 1
                    }
                }
            }
        }
        
        return element
    }
    
}
