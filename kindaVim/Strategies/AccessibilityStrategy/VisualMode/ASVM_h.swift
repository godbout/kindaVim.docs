extension AccessibilityStrategyVisualMode {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if element.caretLocation + element.selectedLength < element.currentLine.end! {
            element.selectedLength += 1
        }
        
        return element
    }
    
}
