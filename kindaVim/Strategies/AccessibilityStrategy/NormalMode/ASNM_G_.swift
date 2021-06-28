extension AccessibilityStrategyNormalMode {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        if element.lastCharacterIsLinefeed {
            element.caretLocation = element.value.count
        } else if let lastLine = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation) {            
            element.caretLocation = lastLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lastLine.value))
        }
                
        return element
    }
    
}
