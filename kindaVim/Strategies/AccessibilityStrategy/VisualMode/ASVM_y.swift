import AppKit

extension AccessibilityStrategyVisualMode {
    
    func y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            return theMove(on: element)
        }
        
        if element.isNotEmpty, element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return theMove(on: element)
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let selectedText = element.selectedText {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(selectedText, forType: .string)
        }
        
        if VimEngine.shared.visualStyle == .characterwise {
            VimEngine.shared.lastYankStyle = .characterwise
        } else {
            VimEngine.shared.lastYankStyle = .linewise
        }
        
        element.selectedLength = 1     
        element.selectedText = nil
        
        return element
    }
    
}
