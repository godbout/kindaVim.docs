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
        } else if let axLineNumber = AXEngine.axLineNumberFor(location: element.value.count - 1), let axLastLine = AXEngine.axLineRangeFor(lineNumber: axLineNumber) {
            let value = element.value
            let lastLineText = value[value.index(value.startIndex, offsetBy: axLastLine.location)..<value.index(value.startIndex, offsetBy: axLastLine.location + axLastLine.length)]
            
            element.caretLocation = axLastLine.location + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: String(lastLineText)))
        }
                
        return element
    }
    
}
