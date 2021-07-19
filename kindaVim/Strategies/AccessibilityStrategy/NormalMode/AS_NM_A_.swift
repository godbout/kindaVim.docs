extension AccessibilityStrategyNormalMode {
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard element.currentLine.isNotAnEmptyLine else {
            newElement.selectedLength = 0
            newElement.selectedText = nil

            return newElement            
        }
        
        newElement.caretLocation = element.currentLine.endLimit + element.currentLine.characterAtEndLimitLength
        newElement.selectedLength = 0
        newElement.selectedText = nil
        
        return newElement        
    }
    
}
