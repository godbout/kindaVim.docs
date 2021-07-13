import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let elementFound = f(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            let text = element.value
            let caretLocationIndex = text.index(text.startIndex, offsetBy: element.caretLocation)
            let elementFoundCaretLocationIndex = text.index(text.startIndex, offsetBy: elementFound.caretLocation)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(text[caretLocationIndex...elementFoundCaretLocationIndex]), forType: .string)
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
