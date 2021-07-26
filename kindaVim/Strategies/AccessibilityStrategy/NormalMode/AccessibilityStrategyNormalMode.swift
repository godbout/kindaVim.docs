import Foundation


protocol AccessibilityStrategyNormalModeProtocol {

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func B(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func C(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ct(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func df(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func gE(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func p(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func P(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func W(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiw(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightBracketRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func rightChevronRightChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement?
}


struct AccessibilityStrategyNormalMode: AccessibilityStrategyNormalModeProtocol {    
    
    var textEngine: TextEngineProtocol = TextEngine()
        
    
    func ciInnerQuotedString(using quote: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        let lineStart = element.currentLine.start             
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let quotedStringRange = textEngine.innerQuotedString(using: quote, startingAt: lineCaretLocation, in: lineText) {
            newElement.caretLocation = lineStart + quotedStringRange.lowerBound
            newElement.selectedLength = quotedStringRange.count
            newElement.selectedText = ""
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement    
    }
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        print("\ncaret position: \(String(describing: element?.caretLocation))")
        print("line start: \(String(describing: element?.currentLine.start))", "line end: \(String(describing: element?.currentLine.end))")
        
        return nil
    }

}
