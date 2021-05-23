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
            let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXValueAttribute, kAXSelectedTextRangeAttribute] as CFArray, .stopOnError, &values)

            if error == .success, let values = values as NSArray? {
                var selectedTextRange = CFRange()
                AXValueGetValue(values[1] as! AXValue, .cfRange, &selectedTextRange)
                
                let axText = values[0] as! String
                let axCaretLocation = selectedTextRange.location
                var axLineStart: Int?
                var axLineEnd: Int?

                if let axLineNumber = AXEngine.axLineNumberFor(location: axCaretLocation, on: axFocusedElement) {
                    let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber, on: axFocusedElement)
                    
                    axLineStart = axLineRange!.location
                    axLineEnd = axLineStart! + axLineRange!.length
                }

                accessibilityElement = AccessibilityTextElement(
                    axText: axText,
                    axCaretLocation: axCaretLocation,
                    axLineStart: axLineStart,
                    axLineEnd: axLineEnd
                )
            }
        }

        return accessibilityElement
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
