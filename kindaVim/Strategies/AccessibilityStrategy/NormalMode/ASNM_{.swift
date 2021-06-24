extension AccessibilityStrategy {
    
    func leftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
 
        element.caretLocation = textEngine.beginningOfParagraphBackward(
            startingAt: element.caretLocation,
            in: TextEngineText(from: element.value)
        )
        
        return element
    }
    
}
