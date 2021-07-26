extension AccessibilityStrategyNormalMode {
    
    func rightChevronRightChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        guard newElement.currentLine.isNotAnEmptyLine else {
            newElement.caretLocation = element.currentLine.start
            newElement.selectedLength = 1
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.caretLocation = element.currentLine.start
        newElement.selectedLength = 0
        newElement.selectedText = "    "
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
        
        updatedElement.caretLocation = updatedElement.currentLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
    }
    
}
