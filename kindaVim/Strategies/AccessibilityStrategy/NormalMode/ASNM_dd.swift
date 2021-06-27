extension AccessibilityStrategyNormalMode {
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
                
        if let axNextLine = AXEngine.axLineRangeFor(lineNumber: element.currentLine.number! + 1) {
            let value = element.value
            let axNextLineText = String(value[value.index(value.startIndex, offsetBy: axNextLine.location)..<value.index(value.startIndex, offsetBy: axNextLine.location + axNextLine.length)])
            let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: axNextLineText))
            let firstNonBlankWithinLineLimitOfNextLineText = axNextLineText[..<axNextLineText.index(axNextLineText.startIndex, offsetBy: firstNonBlankWithinLineLimitOfNextLineLocation)]
            
            element.caretLocation = element.currentLine.start!
            element.selectedLength = element.currentLine.length! + firstNonBlankWithinLineLimitOfNextLineLocation
            element.selectedText = String(firstNonBlankWithinLineLimitOfNextLineText)
        } else {
            if element.currentLine.isTheFirstLine {
                element.caretLocation = 0
                element.selectedLength = element.value.count
                element.selectedText = ""
            } else {
                let previousLine = textEngine.previousLine(before: element.caretLocation, in: element.value)!
                let firstNonBlankOfPreviousLineLocation = textEngine.firstNonBlank(in: previousLine)
                    
                element.caretLocation = element.currentLine.start! - 1
                element.selectedLength = element.currentLine.length! + 1
                element.selectedText = ""
                
                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
                
                element.caretLocation -= previousLine.count - firstNonBlankOfPreviousLineLocation - 1
                element.selectedLength = 0
                element.selectedText = ""                
            }
        }        
        
        return element
    }
    
}
