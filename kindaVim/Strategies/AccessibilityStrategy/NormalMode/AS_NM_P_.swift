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
        let element = element
        
        if let oneOfTheThreeCasesTMForTextFields = handleTheThreeCasesTMForTextFields(for: element) {
            return oneOfTheThreeCasesTMForTextFields
        }
        
        return theMoveForTextFields(on: element)
    }
    
    private func handleTheThreeCasesTMForTextFields(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return theMoveForTextFields(on: element)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return theMoveForTextFields(on: element)
        }
        
        
        return nil
    }
    
    private func theMoveForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
                
        var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")        
        textToPaste.removeTrailingLinefeedIfAny()

        element.selectedLength = 0        
        element.selectedText = textToPaste.value
        
        return element
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
        let element = element
        
        if let oneOfTheThreeCasesTMForTextAreasCharacterwise = handleTheThreeCasesTMForTextAreasCharacterwise(for: element) {
            return oneOfTheThreeCasesTMForTextAreasCharacterwise
        }
        
        return theMoveForTextAreasCharacterwise(on: element)
    }
    
    private func handleTheThreeCasesTMForTextAreasCharacterwise(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return theMoveForTextAreasCharacterwise(on: element)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        
        return nil
    }
    
    private func theMoveForTextAreasCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        element.selectedLength = 0    
        element.selectedText = NSPasteboard.general.string(forType: .string)
        
        return element
    }        
    
    private func PForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let element = element
        
        if let oneOfTheThreeCasesTMForTextAreasLinewise = handleTheThreeCasesTMForTextAreasLinewise(for: element) {
            return oneOfTheThreeCasesTMForTextAreasLinewise
        }
        
        return theMoveForTextAreasLinewise(on: element)
    }
    
    private func handleTheThreeCasesTMForTextAreasLinewise(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()
            
            element.selectedLength = 0
            element.selectedText = textToPaste.value
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return theMoveForTextAreasLinewise(on: element)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()
            
            element.selectedLength = 0
            element.selectedText = textToPaste.value
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMoveForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        var textToPaste: TextEngineLine
        textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
        textToPaste.addTrailingLinefeedIfNone()            
        
        element.caretLocation = element.currentLine.start
        element.selectedLength = 0
        element.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        
        element.caretLocation = element.currentLine.start + 1 + textEngine.firstNonBlank(in: textToPaste.value)
        element.selectedLength = 0
        element.selectedText = nil
        
        return element   
    }
    
}
