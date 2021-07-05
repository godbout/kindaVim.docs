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
                    element.selectedLength = Self.anchor - beginningOfWordLocation + 1
                    element.caretLocation = beginningOfWordLocation         
                    
                    Self.head = element.caretLocation
                } else {
                    element.selectedLength -= Self.head - beginningOfWordLocation
                }
            } else if Self.anchor > Self.head {
                let beginningOfWordLocation = textEngine.beginningOfWordBackward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                            
                element.selectedLength += element.caretLocation - beginningOfWordLocation
                element.caretLocation = beginningOfWordLocation 
            }
        }
        
        return element
    }
    
}
