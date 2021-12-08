import KeyCombination
import AccessibilityStrategy
import AppKit


// AS Normal Mode
extension KindaVimEngine {
 
    func tryHandlingNormalModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination, appMode: AppMode) {         
        switch keyCombination.vimKey {
        case .a:
            if let element = asNormalMode.a(on: focusedTextElement) {
                push(element: element)
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .A:
            if let element = asNormalMode.A(on: focusedTextElement) {                
                push(element: element)
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .b:
            if let element = asNormalMode.b(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .B:
            if let element = asNormalMode.B(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            if let element = asNormalMode.C(on: focusedTextElement, pgR: appMode == .pgR) {                
                push(element: element)
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .D:
            if let element = asNormalMode.D(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .controlD:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .e:
            if let element = asNormalMode.e(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .E:
            if let element = asNormalMode.E(on: focusedTextElement) {
                push(element: element)                
            }
            
            endCurrentMove()
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            if let element = asNormalMode.G(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .h:
            if let element = asNormalMode.h(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
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
                push(element: element)
                enterInsertMode()                
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .j:
            if jkMapping == true {
                if let element = asNormalMode.gj(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            } else {
                if let element = asNormalMode.j(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }    
            }
        case .k:
            if jkMapping == true {
                if let element = asNormalMode.gk(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            } else {
                if let element = asNormalMode.k(on: focusedTextElement) {
                    push(element: element)
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }    
            }
        case .l:
            if let element = asNormalMode.l(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .o:
            if let element = asNormalMode.o(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()                
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .O:
            if let element = asNormalMode.O(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()                
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .p:
            switch lastYankStyle {
            case .characterwise:
                if let element = asNormalMode.pForLastYankStyleCharacterwise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element) 
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asNormalMode.pForLastYankStyleLinewise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element) 
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            }   
        case .P:
            switch lastYankStyle {
            case .characterwise:
                if let element = asNormalMode.PForLastYankStyleCharacterwise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element) 
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asNormalMode.PForLastYankStyleLinewise(on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element) 
                    endCurrentMove()
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            if let element = asNormalMode.controlR(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
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
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .controlU:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .v:
            if let element = asVisualMode.vForEnteringFromNormalMode(on: focusedTextElement) {
                push(element: element)
                visualStyle = .characterwise
                enterVisualMode()
            } else { 
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .V:
            if let element = asVisualMode.VForEnteringFromNormalMode(on: focusedTextElement) {
                push(element: element)
                visualStyle = .linewise
                enterVisualMode()
            } else { 
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .w:
            if let element = asNormalMode.w(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .W:
            if let element = asNormalMode.W(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }            
        case .x:
            if let element = asNormalMode.x(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }                
        case .X:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .linewise
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        // to test (can dump info to console, send stuff to AX etc.)
        case .commandD:
            if let element = AccessibilityStrategyNormalMode.test(element: focusedTextElement) {
                push(element: element)
            }
            
            endCurrentMove()
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
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .dollarSign:
            if let element = asNormalMode.dollarSign(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .leftBrace:
            if let element = asNormalMode.leftBrace(on: focusedTextElement) {
                push(element: element)
            }
            
            endCurrentMove()
        case .leftBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .leftBracket))
        case .leftChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .leftChevron))
        case .percent:
            if let element = asNormalMode.percent(on: focusedTextElement) {
                push(element: element)
            }
            
            endCurrentMove()
        case .rightBrace:
            if let element = asNormalMode.rightBrace(on: focusedTextElement) {
                push(element: element)
            }
            
            endCurrentMove()
        case .rightBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .rightBracket))
        case .rightChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .rightChevron))
        case .underscore:
            if let element = asNormalMode.underscore(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .zero:
            if let element = asNormalMode.zero(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        default:
            endCurrentMove()
        }
    }
    
}


// Operator Pending for AS Normal Mode
extension KindaVimEngine {

    func tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst(appMode: AppMode) {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            enterNormalMode()
            
            if let element = asNormalMode.caw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                
                if element.selectedLength == 0 {
                    enterInsertMode()
                }
            }
        case [.c, .b]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.c, .c]:
            if let element = asNormalMode.cc(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .F]:
            ()
        case [.c, .f]:
            ()
        case [.c, .G]:
            if let element = asNormalMode.cG(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            if let element = asNormalMode.cgg(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i]:
            ()
        case [.c, .i, .doubleQuote]:
            enterNormalMode()
                        
            // if element.selectedLength is equal to 0 that means that a pair was found and deleted, so we can carry on
            // else we don't do shit
            if let element = asNormalMode.ciDoubleQuote(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            }
        case [.c, .i, .leftBrace]:
            enterNormalMode()
            
            // same as above. if element.selectedLength is equal to 0 that means the move found a pair and deleted it
            if let element = asNormalMode.ciLeftBrace(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftBracket]:
            enterNormalMode()
            
            // see ciLeftBrace
            if let element = asNormalMode.ciLeftBracket(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftParenthesis]:
            enterNormalMode()
            
            // see ciLeftBrace
            if let element = asNormalMode.ciLeftParenthesis(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBrace]:
            enterNormalMode()
            
            // see ciLeftBrace
            if let element = asNormalMode.ciRightBrace(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBracket]:
            enterNormalMode()
            
            // see ciLeftBrace
            if let element = asNormalMode.ciRightBracket(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightParenthesis]:
            enterNormalMode()
            
            // see ciLeftBrace
            if let element = asNormalMode.ciRightParenthesis(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .singleQuote]:
            enterNormalMode()
            
            // see ciDoubleQuote
            if let element = asNormalMode.ciSingleQuote(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }            
        case [.c, .i, .backtick]:
            enterNormalMode()
            
            // see ciDoubleQuote
            if let element = asNormalMode.ciBacktick(on: focusedTextElement, pgR: appMode == .pgR), element.selectedLength == 0 {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .w]:
            if let element = asNormalMode.ciw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
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
            if let element = asNormalMode.daw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .b]:
            enterNormalMode()
        case [.d, .d]:
            if let element = asNormalMode.dd(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
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
            if let element = asNormalMode.dgg(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .G]:
            if let element = asNormalMode.dG(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
           } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
           }
        case [.d, .i]:
            ()
        case [.d, .j]:
            if let element = asNormalMode.dj(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .k]:
            if let element = asNormalMode.dk(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .t]:
            ()
        case [.d, .T]:
            ()
        case [.g, .caret]:
            if let element = asNormalMode.gCaret(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .dollarSign]:
            if let element = asNormalMode.gDollarSign(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .E]:
            if let element = asNormalMode.gE(on: focusedTextElement) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.g, .e]:
            if let element = asNormalMode.ge(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .g]:
            if let element = asNormalMode.gg(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .I]:
            if let element = asNormalMode.gI(on: focusedTextElement) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .j]:
            if let element = asNormalMode.gj(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .k]:
            if let element = asNormalMode.gk(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .underscore]:
            if let element = asNormalMode.gUnderscore(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .zero]:
            if let element = asNormalMode.gZero(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.leftBracket, .leftBrace]:
            if let element = asNormalMode.leftBracketLeftBrace(on: focusedTextElement) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.leftBracket, .leftParenthesis]:
            if let element = asNormalMode.leftBracketLeftParenthesis(on: focusedTextElement) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.leftChevron, .leftChevron]:
            if let element = asNormalMode.leftChevronLeftChevron(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.rightBracket, .rightBrace]:
            if let element = asNormalMode.rightBracketRightBrace(on: focusedTextElement) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.rightBracket, .rightParenthesis]:
            if let element = asNormalMode.rightBracketRightParenthesis(on: focusedTextElement) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.rightChevron, .rightChevron]:
            if let element = asNormalMode.rightChevronRightChevron(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .f]:
            ()
        case [.y, .F]:
            ()
        case [.y, .i]:
            ()
        case [.y, .i, .backtick]:
            if let element = asNormalMode.yiBacktick(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
            
            enterNormalMode()
        case [.y, .i, .doubleQuote]:
            if let element = asNormalMode.yiDoubleQuote(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
            
            enterNormalMode()
        case [.y, .i, .singleQuote]:
            if let element = asNormalMode.yiSingleQuote(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
            
            enterNormalMode()
        case [.y, .i, .leftBrace]:
            if let element = asNormalMode.yiLeftBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .i, .leftBracket]:
            if let element = asNormalMode.yiLeftBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .i, .leftParenthesis]:
            if let element = asNormalMode.yiLeftParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .i, .rightBrace]:
            if let element = asNormalMode.yiRightBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .i, .rightBracket]:
            if let element = asNormalMode.yiRightBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .i, .rightParenthesis]:
            if let element = asNormalMode.yiRightParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
            
            enterNormalMode()
        case [.y, .i, .w]:
            if let element = asNormalMode.yiw(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .t]:
            ()
        case [.y, .T]:
            ()        
        case [.y, .y]:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .linewise
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        default:
            // cf, cF, ct, cT
            if operatorPendingBuffer.first?.vimKey == .c {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cf(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cF(to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.ct(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cT(to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if let element = element, element.selectedLength == 0 {
                    push(element: element)
                    enterInsertMode()
                    
                    return
                }
            }
            
            // df, dF, dt, dT
            if operatorPendingBuffer.first?.vimKey == .d {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.df(to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dF(to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dt(to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dT(to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                }
                
                if let element = element {
                    push(element: element)
                }
            }
                            
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.f(times: count, to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.F(times: count, to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                if let element = asNormalMode.r(with: replacement.character, on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.t(times: count, to: character.character, on: focusedTextElement) {
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
