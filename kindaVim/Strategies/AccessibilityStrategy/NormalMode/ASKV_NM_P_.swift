import AppKit

extension AccessibilityStrategyNormalMode {
    
    func P(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.role == .textField {
            return PForTextFields(on: element)
        }
        
        if element.role == .textArea {
            return PForTextAreas(on: element)
        }
                
        return element         
    }
    
    private func PForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")        
        textToPaste.removeTrailingLinefeedIfAny()
        
        newElement.caretLocation = element.caretLocation
        newElement.selectedLength = 0        
        newElement.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        updatedElement.caretLocation -= updatedElement.characterLengthForCharacter(before: updatedElement.caretLocation)
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
    }
    
    private func PForTextAreas(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let element = element
        
        if KindaVimEngine.shared.lastYankStyle == .characterwise {
            return PForTextAreasCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.lastYankStyle == .linewise {
            return PForTextAreasLinewise(on: element)
        }
        
        return element
    }
    
    private func PForTextAreasCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        let textToPaste = NSPasteboard.general.string(forType: .string) ?? ""
        
        newElement.caretLocation = element.caretLocation
        newElement.selectedLength = 0
        newElement.selectedText = textToPaste
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
        guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else {
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        guard textToPaste.contains("\n") == false else {
            updatedElement.caretLocation = newElement.caretLocation
            updatedElement.selectedLength = updatedElement.characterLength
            updatedElement.selectedText = nil
            
            return updatedElement
        }
        
        updatedElement.caretLocation -= updatedElement.characterLengthForCharacter(before: updatedElement.caretLocation)
        updatedElement.selectedLength = updatedElement.characterLength
        updatedElement.selectedText = nil
        
        return updatedElement
    }
    
    private func PForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var newElement = element
        
        var textToPaste: TextEngineLine
        textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
        textToPaste.addTrailingLinefeedIfNone()            
        
        newElement.caretLocation = element.currentLine.start
        newElement.selectedLength = 0
        newElement.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        
        newElement.caretLocation = element.currentLine.start + 1 + textEngine.firstNonBlank(in: textToPaste.value)
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement   
    }
    
}
