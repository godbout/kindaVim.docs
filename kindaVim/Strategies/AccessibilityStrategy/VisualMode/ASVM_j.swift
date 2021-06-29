extension AccessibilityStrategyVisualMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.length
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        guard let lineNumberAtHead = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation + element.selectedLength - 1) else { return element }
        
        if let lineAfterTheHead = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineNumberAtHead.number + 1) {
            element.selectedLength += lineAfterTheHead.length
        }        
        
        return element
    }
    
}
