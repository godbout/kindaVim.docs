import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement?

}

enum BlockCursorStatus {
    case on
    case off
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
//        guard let currentLineNumber = AXEngine.axLineNumberFor(location: element.caretLocation) else { return nil }
//        guard let currentLineRange = AXEngine.axLineRangeFor(lineNumber: currentLineNumber) else { return nil }

//        if element.caretLocation > currentLineRange.location {
            element.axCaretLocation -= 1
//        }

        return element
    }

//    private func lineRangeFor(line: Int) -> CFRange? {
//        if let axFocusedElement = AccessibilityTextElementAdaptor.axFocusedElement() {
//            var lineRangeValue: AnyObject?
//            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, line as CFTypeRef, &lineRangeValue)
//
//            if error == .success {
//                var lineRange = CFRange()
//                AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)
//
//                return lineRange
//            }
//        }
//
//        return nil
//    }

//    private func currentLineNumber(at location: Int, for element: AccessibilityTextElement) -> Int? {
//        if let axFocusedElement = AccessibilityTextElementAdaptor.axFocusedElement() {
//            var index = location
//
//            if location == element.internalText.count {
//                index = location - 1
//            }
//
//            var currentLine: AnyObject?
//            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, index as CFTypeRef, &currentLine)
//
//            if error == .success {
//                return currentLine as! Int
//            }
//        }
//
//        return nil
//    }
//
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
//        guard let currentLineNumber = AXEngine.axLineNumberFor(location: element.caretLocation) else { return nil }
//        guard let currentLineRange = AXEngine.axLineRangeFor(lineNumber: currentLineNumber) else { return nil }
//
//        if element.caretLocation < currentLineRange.location + currentLineRange.length - 1 {
            element.axCaretLocation += 1
//        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        return nil
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        return nil
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

//        switch status {
//        case .on:
//            element = h(on: element)!
//            element.selectedLength = 0
//        case .off:
//            element.selectedLength = 0
//        }

        return nil
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
