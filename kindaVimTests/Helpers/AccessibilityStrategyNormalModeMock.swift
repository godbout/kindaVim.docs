@testable import kindaVim
import Foundation
import AccessibilityStrategy


class AccessibilityStrategyNormalModeMock: AccessibilityStrategyNormalModeProtocol {
    
    var functionCalled = ""
    var pgRPassed = false
    
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return element
    }

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func B(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func C(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func caw(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cc(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cF(to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cf(times count: Int = 1, to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cG(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cgg(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciw(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciLeftBrace(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciLeftBracket(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciLeftParenthesis(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciRightBrace(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciRightBracket(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciRightParenthesis(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciBacktick(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ciSingleQuote(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func cT(to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func ct(times count: Int = 1, to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func D(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func daw(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dd(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func df(to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dF(to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dG(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dgg(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dj(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dk(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dt(to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func dT(to character: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func f(times count: Int = 1, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func F(times count: Int = 1, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gCaret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gDollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gI(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gUnderscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gZero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gE(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func gj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func gk(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func l(times count: Int = 1, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func o(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func O(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func PForLastYankStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func PForLastYankStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func pForLastYankStyleCharacterwise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func pForLastYankStyleLinewise(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func controlR(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func r(with replacement: Character, on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func t(times count: Int, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func T(times count: Int = 1, to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func u(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }

    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func W(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func x(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func yf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
        
    func yiSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiLeftBrace(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiLeftBracket(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiLeftParenthesis(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiRightBrace(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiRightBracket(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yiRightParenthesis(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }
    
    func leftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func leftChevronLeftChevron(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func rightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func rightBracketRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }
    
    func rightChevronRightChevron(on element: AccessibilityTextElement?, pgR: Bool) -> AccessibilityTextElement? {
        functionCalled = #function
        pgRPassed = pgR
        
        return element
    }
    
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return element
    }

}
