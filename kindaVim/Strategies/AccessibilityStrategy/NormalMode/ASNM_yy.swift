import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(element.currentLine.value, forType: .string)
            
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(element.currentLine.value, forType: .string)
            
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(element.currentLine.value, forType: .string)
            
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element        
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(element.currentLine.value, forType: .string)
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
