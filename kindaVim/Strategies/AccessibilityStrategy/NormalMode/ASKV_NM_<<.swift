extension AccessibilityStrategyNormalMode {
    
    func leftChevronLeftChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let leadingNonBlanksCount = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: element.currentLine.value))
        
        newElement.caretLocation = element.currentLine.start
        newElement.selectedLength = leadingNonBlanksCount >= 4 ? 4 : leadingNonBlanksCount
        newElement.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
        
        updatedElement.caretLocation = updatedElement.currentLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
    }
    
}
