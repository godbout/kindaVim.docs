extension AccessibilityStrategyNormalMode {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.lastCharacterIsLinefeed {
            element.caretLocation = element.length
        } else if let lastLine = AccessibilityTextElementAdaptor.lineFor(location: element.length) {            
            element.caretLocation = lastLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lastLine.value))
        }
        
        element.selectedLength = 1
        element.selectedText = nil                
                
        return element
    }
    
}
