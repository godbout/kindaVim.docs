extension AccessibilityStrategyNormalMode {
    
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let lineText = element.currentLine.value
        let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
        
        newElement.caretLocation = element.currentLine.start + firstNonBlankOfCurrentLineLocation
        newElement.selectedLength = element.currentLine.lengthWithoutLinefeed - firstNonBlankOfCurrentLineLocation
        newElement.selectedText = ""
        
        return newElement
    }
    
}
