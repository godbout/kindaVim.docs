import KeyCombination
import AccessibilityStrategy


// AS Normal Mode
extension KindaVimEngine {
 
    func tryHandlingNormalModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .a:
            if let element = asNormalMode.a(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .A:
            if let element = asNormalMode.A(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .b:
            if let element = asNormalMode.b(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .B:
            if let element = asNormalMode.B(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            if let element = asNormalMode.C(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .D:
            if let element = asNormalMode.D(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .controlD:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .e:
            if let element = asNormalMode.e(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .E:
            if let element = asNormalMode.E(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            }
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            if let element = asNormalMode.G(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .h:
            if let element = asNormalMode.h(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .i:
            if let element = asNormalMode.i(on: focusedTextElement) {
                push(element: element)
                
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .I:
            if let element = asNormalMode.I(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .j:
            if jkMapping == true {
                if let element = asNormalMode.gj(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            } else {
                if let element = asNormalMode.j(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }    
            }
        case .k:
            if jkMapping == true {
                if let element = asNormalMode.gk(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            } else {
                if let element = asNormalMode.k(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element)
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }    
            }
        case .l:
            if let element = asNormalMode.l(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .o:
            if let element = asNormalMode.o(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .O:
            if let element = asNormalMode.O(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }

        case .p:
            switch lastYankStyle {
            case .characterwise:
                if let element = asNormalMode.pForLastYankStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asNormalMode.pForLastYankStyleLinewise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            }   
        case .P:
            switch lastYankStyle {
            case .characterwise:
                if let element = asNormalMode.PForLastYankStyleCharacterwise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asNormalMode.PForLastYankStyleLinewise(on: focusedTextElement) {
                    resetCountBuffers()
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            if let element = asNormalMode.controlR(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .s:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            if let element = asNormalMode.u(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .controlU:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .v:
            if let element = asVisualMode.vForEnteringFromNormalMode(on: focusedTextElement) {
                visualStyle = .characterwise
                enterVisualMode()
                push(element: element)
            } else { 
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .V:
            if let element = asVisualMode.VForEnteringFromNormalMode(on: focusedTextElement) {
                visualStyle = .linewise
                enterVisualMode()
                push(element: element)
            } else { 
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .w:
            if let element = asNormalMode.w(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .W:
            if let element = asNormalMode.W(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }            
        case .x:
            if let element = asNormalMode.x(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }                
        case .X:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                lastYankStyle = .linewise
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        // to test (can dump info to console, send stuff to AX etc.)
        case .commandD:
            if let element = AccessibilityStrategyNormalMode.test(element: focusedTextElement) {
                resetCountBuffers()
                _ = push(element: element)
            }
        case .escape:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            
            // special case. we currently are overriding how
            // escape behaves so that we can comment or indent
            // whole bunch of lines at the same time.
            if var element = focusedTextElement {
                element.selectedLength = 0
                element.selectedText = nil
                push(element: element)
            }
        case .enter:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .caret:
            if let element = asNormalMode.caret(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .dollarSign:
            if let element = asNormalMode.dollarSign(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .leftBrace:
            if let element = asNormalMode.leftBrace(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            }
        case .leftBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .leftBracket))
        case .leftChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .leftChevron))
        case .percent:
            resetCountBuffers()
            
            if let element = asNormalMode.percent(on: focusedTextElement) {
                push(element: element)
            }
        case .rightBrace:
            resetCountBuffers()
            
            if let element = asNormalMode.rightBrace(on: focusedTextElement) {
                push(element: element)
            }
        case .rightBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .rightBracket))
        case .rightChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .rightChevron))
        case .underscore:
            if let element = asNormalMode.underscore(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .zero:
            if let element = asNormalMode.zero(on: focusedTextElement) {
                resetCountBuffers()
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        default:
            resetCountBuffers()
        }
    }
    
}


// Operator Pending for AS Normal Mode
extension KindaVimEngine {

    func tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            enterNormalMode()
            
            if let element = asNormalMode.caw(on: focusedTextElement) {
                push(element: element)
                
                if element.selectedText != nil {
                    enterInsertMode()
                }
            }
        case [.c, .b]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.c, .c]:
            if let element = asNormalMode.cc(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .f]:
            ()
        case [.c, .F]:
            ()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            if let element = asNormalMode.cgg(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .G]:
            if let element = asNormalMode.cG(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i]:
            ()
        case [.c, .i, .doubleQuote]:
            enterNormalMode()
                        
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciDoubleQuote(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            }
        case [.c, .i, .leftBrace]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftBrace(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftBracket]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftBracket(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftParenthesis]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftParenthesis(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBrace]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightBrace(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBracket]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightBracket(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightParenthesis]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightParenthesis(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.ciSingleQuote(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }            
        case [.c, .i, .backtick]:
            enterNormalMode()
            
            if let element = asNormalMode.ciBacktick(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .w]:
            if let element = asNormalMode.ciw(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }           
        case [.c, .t]:
            ()
        case [.c, .T]:
            ()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            if let element = asNormalMode.daw(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .b]:
            enterNormalMode()
        case [.d, .d]:
            if let element = asNormalMode.dd(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .f]:
            ()
        case [.d, .F]:
            ()
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            if let element = asNormalMode.dgg(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .G]:
           if let element = asNormalMode.dG(on: focusedTextElement) {
               enterNormalMode()
               push(element: element)
           } else {
               parseOperatorCommandForNormalModeUsingKeyboardStrategy()
           }
        case [.d, .i]:
            ()
        case [.d, .j]:
            if let element = asNormalMode.dj(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .k]:
            if let element = asNormalMode.dk(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .t]:
            ()
        case [.d, .T]:
            ()
        case [.g, .caret]:
            if let element = asNormalMode.gCaret(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .dollarSign]:
            if let element = asNormalMode.gDollarSign(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .E]:
            enterNormalMode()
            
            if let element = asNormalMode.gE(on: focusedTextElement) {
                push(element: element)
            }
        case [.g, .e]:
            if let element = asNormalMode.ge(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .g]:
            if let element = asNormalMode.gg(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .I]:
            if let element = asNormalMode.gI(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .j]:
            if let element = asNormalMode.gj(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .k]:
            if let element = asNormalMode.gk(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .underscore]:
            if let element = asNormalMode.gUnderscore(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .zero]:
            if let element = asNormalMode.gZero(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.leftBracket, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftBrace(on: focusedTextElement) {
                push(element: element)
            }
        case [.leftBracket, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftParenthesis(on: focusedTextElement) {
                push(element: element)
            }
        case [.leftChevron, .leftChevron]:
            enterNormalMode()
            
            if let element = asNormalMode.leftChevronLeftChevron(on: focusedTextElement) {
                push(element: element)
            }
        case [.rightBracket, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightBrace(on: focusedTextElement) {
                push(element: element)
            }
        case [.rightBracket, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightParenthesis(on: focusedTextElement) {
                push(element: element)
            }
        case [.rightChevron, .rightChevron]:
            enterNormalMode()
            
            if let element = asNormalMode.rightChevronRightChevron(on: focusedTextElement) {
                push(element: element)
            }
        case [.y, .f]:
            ()
        case [.y, .F]:
            ()
        case [.y, .i]:
            ()
        case [.y, .i, .backtick]:
            enterNormalMode()
            
            if let element = asNormalMode.yiBacktick(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .doubleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.yiDoubleQuote(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.yiSingleQuote(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .leftBracket]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .rightBracket]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .w]:
            if let element = asNormalMode.yiw(on: focusedTextElement) {
                enterNormalMode()
                lastYankStyle = .characterwise
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .t]:
            ()
        case [.y, .T]:
            ()        
        case [.y, .y]:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                enterNormalMode()
                lastYankStyle = .linewise
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        default:
            // cf, cF, ct, cT
            if operatorPendingBuffer.first?.vimKey == .c {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cf(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cF(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.ct(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cT(to: character.character, on: focusedTextElement)
                }
                
                if let element = element, element.selectedText != nil {
                    push(element: element)
                    enterInsertMode()
                    
                    return
                }
            }
            
            // df, dF, dt, dT
            if operatorPendingBuffer.first?.vimKey == .d {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.df(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dF(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dt(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dT(to: character.character, on: focusedTextElement)
                }
                
                if let element = element {
                    push(element: element)
                }
            }
                            
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.f(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.F(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                if let element = asNormalMode.r(with: replacement.character, on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.t(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.T(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            // yf, yF, yt, yT
            if operatorPendingBuffer.first?.vimKey == .y {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yf(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yF(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yt(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yT(to: character.character, on: focusedTextElement)
                }
                
                if let element = element {
                    push(element: element)
                    lastYankStyle = .characterwise                    
                }
            }
                        
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }

}
