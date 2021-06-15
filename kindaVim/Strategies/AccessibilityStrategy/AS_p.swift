import AppKit

extension AccessibilityStrategy {
    
    func p(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.role == .textField {
            return pForTextFields(on: element)
        }
        
        if element.role == .textArea {
            return pForTextAreas(on: element)
        }        
        
        return element         
    }
    
    private func pForTextFields(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }   
            
        return element
    }
    
    private func pForTextAreas(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
}
