extension AccessibilityStrategyVisualMode {
    
    func escape(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(using: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(using element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if Self.head > lineAtHead.endLimit {
                element.caretLocation = lineAtHead.endLimit
            } else {
                element.caretLocation = Self.head
            }
        }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
    }
    
}
