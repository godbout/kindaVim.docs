extension AccessibilityStrategyNormalMode {
    
    func cgg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.caretLocation = 0
        newElement.selectedLength = element.currentLine.start + element.currentLine.lengthWithoutLinefeed
        newElement.selectedText = ""
        
        return newElement
    }
    
}
