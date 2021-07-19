extension AccessibilityStrategyNormalMode {
    
    func C(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element

        guard element.currentLine.isNotAnEmptyLine else {
            newElement.selectedLength = 0
            newElement.selectedText = nil

            return newElement            
        }
        
        newElement.selectedLength = (element.currentLine.endLimit + element.currentLine.characterAtEndLimitLength) - element.caretLocation
        newElement.selectedText = ""
                
        return newElement
    }
    
}
