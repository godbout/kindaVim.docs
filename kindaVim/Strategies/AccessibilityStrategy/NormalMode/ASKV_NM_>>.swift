extension AccessibilityStrategyNormalMode {
    
    func rightChevronRightChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        guard var updatedElement = shiftCurrentLine4SpacesToTheRight(on: element) else { return nil }
        
        updatedElement.caretLocation = updatedElement.currentLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
    }
    
}
