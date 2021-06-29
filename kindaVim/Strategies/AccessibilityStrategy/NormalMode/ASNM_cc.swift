extension AccessibilityStrategyNormalMode {
    
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element  else { return nil }
        
//        if element.isEmpty {
//            return element
//        }
//        
//        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
//            return element
//        }
//        
//        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
//            return element            
//        }
        
        
        let lineText = element.currentLine.value
        let firstNonBlankOfCurrentLineLocation = textEngine.firstNonBlank(in: lineText)
        
        element.caretLocation = element.currentLine.start + firstNonBlankOfCurrentLineLocation
        element.selectedLength = element.currentLine.lengthWithoutLinefeed - firstNonBlankOfCurrentLineLocation
        element.selectedText = ""
        
        return element
    }
    
}
