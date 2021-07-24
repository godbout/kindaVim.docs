extension AccessibilityStrategyNormalMode {
    
    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
            
        guard element.currentLine.isNotAnEmptyLine else {
            newElement.selectedLength = 0
            newElement.selectedText = nil

            return newElement
        }
        
        guard element.caretIsNotAtTheEnd else {
            newElement.selectedLength = 0
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.caretLocation += element.characterLength
        newElement.selectedLength = 0
        newElement.selectedText = nil
        
        return newElement
    }
    
}
