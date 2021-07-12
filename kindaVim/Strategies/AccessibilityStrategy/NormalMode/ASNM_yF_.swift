import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(with: character, for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(to: character, on: element)
    }
    
    private func handleTheThreeCasesTM(with character: Character, for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            
            return theMove(to: character, on: element)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element 
        }
        
        
        return nil
    }
    
    private func theMove(to character: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let elementFound = F(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            let text = element.value
            let caretLocationIndex = text.index(text.startIndex, offsetBy: element.caretLocation)
            let elementFoundCaretLocationIndex = text.index(text.startIndex, offsetBy: elementFound.caretLocation)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(text[elementFoundCaretLocationIndex..<caretLocationIndex]), forType: .string)
            
            element.caretLocation = elementFound.caretLocation
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
