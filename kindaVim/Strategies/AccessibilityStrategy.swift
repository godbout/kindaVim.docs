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

//        if element.axCaretLocation > element.axLineStart {
//            element.axCaretLocation -= 1
//        }

        return element
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

//        let lineStart = element.axText.index(element.axText.startIndex, offsetBy: element.axLineStart)
//        let lineEnd = element.axText.index(lineStart, offsetBy: element.axLineEnd - element.axLineStart)
//
//        let limit = element.axText[lineStart..<lineEnd].hasSuffix("\n") ? element.axLineEnd - 2 : element.axLineEnd - 1
//
//        if element.axCaretLocation < limit {
//            element.axCaretLocation += 1
//        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

//        let lineStart = element.axText.index(element.axText.startIndex, offsetBy: element.axLineStart)
//        let lineEnd = element.axText.index(lineStart, offsetBy: element.axLineEnd - element.axLineStart)
//
//        let limit = element.axText[lineStart..<lineEnd].hasSuffix("\n") ? element.axLineEnd - 2 : element.axLineEnd - 1
//
//        element.axCaretLocation = limit

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        print(element.axCaretLocation)
        print(element.axLineStart, element.axLineEnd)

//        element.axCaretLocation = element.axLineStart

        return element
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        switch status {
        case .on:
            element = h(on: element)!
            element.axSelectedLength = 0
        case .off:
            element.axSelectedLength = 0
        }

        return element
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
