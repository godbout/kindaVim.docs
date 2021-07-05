extension AccessibilityStrategyVisualMode {
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
            if Self.head >= Self.anchor {
                let beginningOfWordLocation = textEngine.beginningOfWordBackward(startingAt: element.caretLocation + element.selectedLength - 1, in: TextEngineText(from: element.value))
                
                if beginningOfWordLocation <= Self.anchor {
                    element.caretLocation = beginningOfWordLocation         
                    element.selectedLength = Self.anchor - element.caretLocation + 1
                } else {
                    element.selectedLength -= Self.head - beginningOfWordLocation
                }
            } else if Self.head < Self.anchor {
                let beginningOfWordLocation = textEngine.beginningOfWordBackward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                element.caretLocation = beginningOfWordLocation 
                element.selectedLength = Self.anchor - element.caretLocation + 1
            }
        }
        
        return element
    }
    
}
