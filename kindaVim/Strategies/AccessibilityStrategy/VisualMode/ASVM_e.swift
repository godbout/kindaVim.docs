extension AccessibilityStrategyVisualMode {
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation + element.selectedLength - 1, in: TextEngineText(from: element.value))
                
                element.selectedLength += endOfWordForwardLocation - Self.head
            } else if Self.head < Self.anchor {
                let endOfWordForwardLocation = textEngine.endOfWordForward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
                
                if endOfWordForwardLocation > Self.anchor {
                    element.caretLocation = Self.anchor
                    element.selectedLength = endOfWordForwardLocation - Self.anchor + 1                    
                } else {
                    element.caretLocation = endOfWordForwardLocation
                    element.selectedLength = Self.anchor - endOfWordForwardLocation + 1
                }
            }
        }
        
        element.selectedText = nil
        
        return element
    }
    
}
