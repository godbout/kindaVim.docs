extension AccessibilityStrategyNormalMode {
    
    func cG(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.caretLocation = element.currentLine.start
        newElement.selectedLength = element.length - element.currentLine.start
        newElement.selectedText = ""
        
        return newElement
    }
    
}
