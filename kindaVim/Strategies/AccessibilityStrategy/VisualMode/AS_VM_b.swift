extension AccessibilityStrategyVisualMode {
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
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
        
        element.selectedText = nil
        
        return element
    }
        
}
