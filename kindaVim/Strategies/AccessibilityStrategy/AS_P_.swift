import AppKit

extension AccessibilityStrategy {
    
    func P(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.role == .textField {
            return PForTextFields(on: element)
        }
                
        return element         
    }
    
    private func PForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        
        var textToPaste = NSPasteboard.general.string(forType: .string) ?? ""
        textToPaste.removeTrailingLinefeedIfAny()        
        element.selectedText = textToPaste
        
        return element
    }
    
}
