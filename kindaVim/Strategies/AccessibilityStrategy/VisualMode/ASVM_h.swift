extension AccessibilityStrategyVisualMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(using: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        if element.isEmpty {
            element.selectedLength = 1
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
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }
        
        return nil
    }
    
    private func theMove(using element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if VimEngine.shared.visualStyle == .characterwise, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
            if element.caretLocation + (element.selectedLength - 1) <= Self.anchor, element.caretLocation > lineAtHead.start {
                element.caretLocation -= 1
                element.selectedLength += 1
            } else if Self.head > lineAtHead.start, element.selectedLength > 1 {
                element.selectedLength -= 1
            }
        }
        
        element.selectedText = nil
        
        return element
    }

}
