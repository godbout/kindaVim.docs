extension AccessibilityStrategyNormalMode {
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            guard let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            element = updatedElement
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)            
            guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }

            updatedElement.caretLocation -= 1
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: updatedElement)
            guard var finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            let firstNonBlankWithinLimitOfLastLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: finalElement.currentLine.value))            
            finalElement.caretLocation = finalElement.currentLine.start + firstNonBlankWithinLimitOfLastLineLocation
            finalElement.selectedLength = 0
            
            return finalElement
        }
        
                
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(location: element.currentLine.end + 1) {
            let lineValue = nextLine.value
            let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineValue))
            let firstNonBlankWithinLineLimitOfNextLineText = lineValue[..<lineValue.index(lineValue.startIndex, offsetBy: firstNonBlankWithinLineLimitOfNextLineLocation)]
            
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.length + firstNonBlankWithinLineLimitOfNextLineLocation
            element.selectedText = String(firstNonBlankWithinLineLimitOfNextLineText)
        } else if let previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.currentLine.start - 1) {
            let firstNonBlankWithinLineLimitOfPreviousLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: previousLine.value))
            
            element.caretLocation = element.currentLine.start - 1
            element.selectedLength = element.currentLine.length + 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation -= previousLine.length - firstNonBlankWithinLineLimitOfPreviousLineLocation - 1                
            element.selectedLength = 0
            element.selectedText = ""
        } else {          
            element.caretLocation = 0
            element.selectedLength = element.length
            element.selectedText = ""          
        }        
        
        return element
    }
    
}
