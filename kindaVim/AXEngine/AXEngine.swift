import Foundation


struct AXTextElementData {

    let role: AccessibilityTextElementRole
    let value: String
    let length: Int
    let caretLocation: Int
    let selectedLength: Int
    let selectedText: String
    
}


struct AXEngine {

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axLineNumberFor(location: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> Int? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var currentLine: AnyObject?
        guard AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine) == .success else { return nil }

        return (currentLine as! Int)
    }

    static func axLineRangeFor(lineNumber: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var lineRangeValue: AnyObject?
        guard AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, lineNumber as CFTypeRef, &lineRangeValue) == .success else { return nil }
        
        var lineRange = CFRange()
        AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

        return lineRange
    }
    
    static func axTextElementData(of axFocusedElement: AXUIElement? = axFocusedElement()) -> AXTextElementData? { 
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXNumberOfCharactersAttribute, kAXSelectedTextRangeAttribute, kAXSelectedTextAttribute] as CFArray, .stopOnError, &values)
        
        guard error == .success, let elementValues = values as NSArray? else { return nil }
        
        let axRole = role(for: elementValues[0] as! String)
        guard axRole != .someOtherShit else { return nil }
        
        var selectedTextRange = CFRange()
        AXValueGetValue(elementValues[3] as! AXValue, .cfRange, &selectedTextRange)
        
        let axValue = elementValues[1] as! String
        let axLength = elementValues[2] as! Int
        let axCaretLocation = selectedTextRange.location
        let axSelectedLength = selectedTextRange.length
        let axSelectedText = elementValues[4] as! String
        
        return AXTextElementData(
            role: axRole,
            value: axValue,
            length: axLength,
            caretLocation: axCaretLocation,
            selectedLength: axSelectedLength,
            selectedText: axSelectedText
        )
    }
    
    private static func role(for role: String) -> AccessibilityTextElementRole {
        switch role {
        case "AXTextField":
            return .textField
        case "AXTextArea":
            return .textArea
        default:
            return .someOtherShit
        }
    }
    
    static func axSelectedTextRange(on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var axSelectedTextRange: AnyObject?
        guard AXUIElementCopyAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, &axSelectedTextRange) == .success else { return nil }
        
        var selectedTextRange = CFRange()
        AXValueGetValue(axSelectedTextRange as! AXValue, .cfRange, &selectedTextRange)
        
        return selectedTextRange
    }
    
    static func axValueAndNumberOfCharacters(of axFocusedElement: AXUIElement? = axFocusedElement()) -> (String, Int)? {
        guard let axFocusedElement = axFocusedElement else { return nil }
            
        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXNumberOfCharactersAttribute] as CFArray, .stopOnError, &values)
        
        guard error == .success, let elementValues = values as NSArray? else { return nil }
        
        guard role(for: elementValues[0] as! String) != .someOtherShit else { return nil }
        
        let axValue = elementValues[1] as! String
        let axLength = elementValues[2] as! Int
    
        return (axValue, axLength)
    }
    
    static func toAXFocusedElement(from accessibilityElement: AccessibilityTextElement) -> Bool {
        guard let axFocusedElement = axFocusedElement() else { return false }
        
        var selectedTextRange = CFRange()
        selectedTextRange.location = accessibilityElement.caretLocation
        selectedTextRange.length = tweakedSelectedLength(for: accessibilityElement)
        
        let newValue = AXValueCreate(.cfRange, &selectedTextRange)
        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        if let selectedText = accessibilityElement.selectedText {
            guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextAttribute as CFString, selectedText as CFTypeRef) == .success else { return false }
        }
        
        return true
    }
    
    // this is to handle properly The 3rd Case of The 3 Cases (and maybe also the 1st?).
    // if the text ends with an empty line, we can't fake the block cursor, so ne need to
    // tweak the selectedLength. the calculation is of course not the same for 
    // Normal Mode (caretLocation) and Visual Mode (caretLocation + selectedLength)
    private static func tweakedSelectedLength(for element: AccessibilityTextElement) -> Int {
        if KindaVimEngine.shared.currentMode == .visual {
            return (element.caretLocation + (element.selectedLength - 1) >= element.length) ? element.selectedLength - 1 : element.selectedLength 
        }
        
        return element.caretIsAtTheEnd ? 0 : element.selectedLength
    }

}
