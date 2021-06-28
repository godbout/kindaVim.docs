extension AccessibilityStrategyNormalMode {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        
        if let firstLine = AXEngine.axLineRangeFor(lineNumber: 0) {
            let value = element.value
            let firstLineText = value[..<value.index(value.startIndex, offsetBy: firstLine.length)]
            
            element.caretLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: String(firstLineText)))
        }
        
        return element
    }
    
}
