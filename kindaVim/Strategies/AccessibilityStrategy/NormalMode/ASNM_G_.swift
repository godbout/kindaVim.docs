extension AccessibilityStrategyNormalMode {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil        
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {}
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if element.lastCharacterIsLinefeed {
            element.caretLocation = element.length
        } else if let lastLine = AccessibilityTextElementAdaptor.lineFor(location: element.length) {            
            element.caretLocation = lastLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lastLine.value))
        }
                
        return element
    }
    
}
