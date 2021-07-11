extension AccessibilityStrategyVisualMode {
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
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
        
        element.selectedText = nil
        
        return element
    }
        
}
