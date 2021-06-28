extension AccessibilityStrategyVisualMode {
    
    func c(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        element.selectedText = ""
        
        
//        if VimEngine.shared.visualStyle == .linewise {
//            if let axNextLine = AXEngine.axLineRangeFor(lineNumber: element.currentLine.number! + 1) {
//                let value = element.value
//                let axNextLineText = String(value[value.index(value.startIndex, offsetBy: axNextLine.location)..<value.index(value.startIndex, offsetBy: axNextLine.location + axNextLine.length)])
//                let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: axNextLineText))
//                
//                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
//                
//                element.caretLocation += firstNonBlankWithinLineLimitOfNextLineLocation
//                element.selectedLength = 0
//                element.selectedText = nil
//            } else if let axPreviousLine = AXEngine.axLineRangeFor(lineNumber: element.currentLine.number! - 1) {
//                let value = element.value
//                let axPreviousLineText = String(value[value.index(value.startIndex, offsetBy: axPreviousLine.location)..<value.index(value.startIndex, offsetBy: axPreviousLine.location + axPreviousLine.length)])
//                let firstNonBlankWithinLineLimitOfPreviousLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: axPreviousLineText))
//                
//                element.caretLocation = element.currentLine.start! - 1
//                element.selectedLength = element.currentLine.length! + 1
//                element.selectedText = ""
//                
//                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
//                
//                element.caretLocation -= axPreviousLineText.count - firstNonBlankWithinLineLimitOfPreviousLineLocation - 1                
//                element.selectedLength = 0
//                element.selectedText = ""
//            }
//        }
        
        return element
    }
    
}
