extension AccessibilityStrategyNormalMode {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
                
        if let firstLine = AccessibilityTextElementAdaptor.lineFor(location: 0) {
            element.caretLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: firstLine.value))
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
