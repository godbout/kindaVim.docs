import Foundation

struct AccessibilityTextElementAdaptor {
    
    // TO THINK:
    // tried to keep a static variable to the last axFocusedElement
    // to avoid querying for it again when we write to it.
    // it makes sense while using the app because we will always
    // write to the field we currently are in. but it makes testing
    // harder to understand, as you need to reset the static variable in between.
    // not sure how to handle this yet. without a static variable, we have to requery,
    // which seems actually very fast. so maybe it's safer this way.

    static func fromAXFocusedElement() -> AccessibilityTextElement? {
        var accessibilityElement: AccessibilityTextElement?

        if let axFocusedElement = AXEngine.axFocusedElement() {
            var values: CFArray?
            let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXSelectedTextRangeAttribute] as CFArray, .stopOnError, &values)

            if error == .success, let values = values as NSArray? {
                let axRole = role(for: values[0] as! String)
                
                var selectedTextRange = CFRange()
                AXValueGetValue(values[2] as! AXValue, .cfRange, &selectedTextRange)
                
                let axValue = values[1] as! String
                let axCaretLocation = selectedTextRange.location
                var lineText = ""
                var lineNumber: Int?
                var axLineStart: Int?
                var axLineEnd: Int?

                if let axLineNumber = AXEngine.axLineNumberFor(location: axCaretLocation, on: axFocusedElement) {
                    lineNumber = axLineNumber

                    let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber, on: axFocusedElement)
                    
                    axLineStart = axLineRange!.location
                    axLineEnd = axLineStart! + axLineRange!.length
                    
                    let lineStart = axValue.index(axValue.startIndex, offsetBy: axLineStart!)
                    let lineEnd = axValue.index(lineStart, offsetBy: axLineEnd! - axLineStart!)
                    
                    lineText = String(axValue[lineStart..<lineEnd])
                }
                
                let currentLine = AccessibilityTextElementLine(
                    text: lineText,
                    number: lineNumber,
                    start: axLineStart,
                    end: axLineEnd
                )

                accessibilityElement = AccessibilityTextElement(
                    axRole: axRole,
                    axValue: axValue,
                    axCaretLocation: axCaretLocation,
                    currentLine: currentLine
                )
            }
        }

        return accessibilityElement
    }
    
    static func lineFor(lineNumber: Int) -> AccessibilityTextElementLine {
        var start: Int?
        var end: Int?
        
        if let axLineRange = AXEngine.axLineRangeFor(lineNumber: lineNumber) {
            start = axLineRange.location
            end = start! + axLineRange.length
        }
        
        return AccessibilityTextElementLine(
            number: lineNumber,
            start: start,
            end: end
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

    static func toAXFocusedElememt(from accessibilityElement: AccessibilityTextElement) -> Bool {
        guard let axFocusedElement = AXEngine.axFocusedElement() else { return false }
        
        var selectedTextRange = CFRange()
        selectedTextRange.location = accessibilityElement.axCaretLocation
        selectedTextRange.length = accessibilityElement.axSelectedLength

        let newValue = AXValueCreate(.cfRange, &selectedTextRange)

        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        return true
    }

}
