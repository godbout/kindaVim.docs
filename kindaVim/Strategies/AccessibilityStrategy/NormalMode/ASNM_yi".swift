import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element 
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        let lineStart = element.currentLine.start              
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let quotedStringRange = textEngine.innerQuotedString(using: "\"", startingAt: lineCaretLocation, in: lineText) {
            element.caretLocation = lineStart + quotedStringRange.lowerBound
            
            let startDoubleQuoteIndex = lineText.index(lineText.startIndex, offsetBy: quotedStringRange.lowerBound)
            let endDoubleQuoteIndex = lineText.index(lineText.startIndex, offsetBy: quotedStringRange.upperBound)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(lineText[startDoubleQuoteIndex..<endDoubleQuoteIndex]), forType: .string)                
        }        
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
