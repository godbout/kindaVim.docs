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
        
        
        let lastLine = textEngine.lastLine(in: element.value)
        let firstNonBlankLocation = textEngine.firstNonBlank(in: lastLine.value)        
        
        if firstNonBlankLocation >= lastLine.endLimit { 
            element.caretLocation = lastLine.start + lastLine.endLimit
        } else {
            element.caretLocation = lastLine.start + firstNonBlankLocation
        }            
        
        return element
    }
    
}
