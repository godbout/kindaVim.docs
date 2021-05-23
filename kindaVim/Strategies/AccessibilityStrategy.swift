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
        
        if element.axValue.count != 0, element.axLineStart == nil {
            element.axCaretLocation -= 1
        }

        if let axLineStart = element.axLineStart, element.axCaretLocation > axLineStart {
            element.axCaretLocation -= 1
        }

        return element
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
//        if element.axValue.count != 0, element.axLineStart == nil {
//            return element
//        }
        
        if let axLineStart = element.axLineStart, let axLineEnd = element.axLineEnd {
            let lineStart = element.axValue.index(element.axValue.startIndex, offsetBy: axLineStart)
            let lineEnd = element.axValue.index(lineStart, offsetBy: axLineEnd - axLineStart)
            
            let limit = element.axValue[lineStart..<lineEnd].hasSuffix("\n") ? axLineEnd - 2 : axLineEnd - 1

            if element.axCaretLocation < limit {
                element.axCaretLocation += 1
            }
        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let axLineStart = element.axLineStart, let axLineEnd = element.axLineEnd {
            let lineStart = element.axValue.index(element.axValue.startIndex, offsetBy: axLineStart)
            let lineEnd = element.axValue.index(lineStart, offsetBy: axLineEnd - axLineStart)

            let limit = element.axValue[lineStart..<lineEnd].hasSuffix("\n") ? axLineEnd - 2 : axLineEnd - 1

            element.axCaretLocation = limit
        }

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let axLineStart = element.axLineStart {
            element.axCaretLocation = axLineStart
        }

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
