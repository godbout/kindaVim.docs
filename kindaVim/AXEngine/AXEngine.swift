import Foundation

struct AXEngine {

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axValue(of axFocusedElement: AXUIElement?) -> String? {
        if let axFocusedElement = axFocusedElement {
            var axValue: AnyObject?
            let error = AXUIElementCopyAttributeValue(axFocusedElement, kAXValueAttribute as CFString, &axValue)

            if error == .success {
                return (axValue as! String)
            }
        }

        return nil
    }

    static func axLineNumberFor(location: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> Int? {
        if let axFocusedElement = axFocusedElement {
            var currentLine: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine)

            if error == .success {
                return (currentLine as! Int)
            }
        }

        return nil
    }

    static func axLineRangeFor(lineNumber: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        if let axFocusedElement = axFocusedElement {
            var lineRangeValue: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, lineNumber as CFTypeRef, &lineRangeValue)

            if error == .success {
                var lineRange = CFRange()
                AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

                return lineRange
            }
        }

        return nil
    }

}
