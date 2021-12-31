import KeyCombination
import AccessibilityStrategy
import AppKit


// AS Normal Mode
extension KindaVimEngine {
 
    func tryHandlingNormalModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination, appMode: AppMode) {         
        switch keyCombination.vimKey {
        case .A:
            if let element = asNormalMode.A(on: focusedTextElement) {                
                push(element: element)
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .a:
            if let element = asNormalMode.a(on: focusedTextElement) {
                push(element: element)
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .B:
            if let element = asNormalMode.B(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .b:
            if let element = asNormalMode.b(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .C:
            if let element = asNormalMode.C(on: focusedTextElement, pgR: appMode == .pgR) {                
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .caret:
            if let element = asNormalMode.caret(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .colon:
            enterOperatorPendingForNormalMode(with: keyCombination)
        // to test (can dump info to console, send stuff to AX etc.)
        case .commandD:
            if let element = AccessibilityStrategyNormalMode.test(element: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        // currently for controlB, D, F, U we will send to KS as AS is not implemented yet
        case .controlB:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .controlD:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .controlF:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .controlR:
            if let element = asNormalMode.controlR(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .controlU:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .D:
            if let element = asNormalMode.D(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .dollarSign:
            if let element = asNormalMode.dollarSign(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .E:
            if let element = asNormalMode.E(times: count, on: focusedTextElement) {
                push(element: element)                
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .e:
            if let element = asNormalMode.e(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .escape:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            if let element = asNormalMode.G(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .h:
            if let element = asNormalMode.h(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
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
        case .i:
            if let element = asNormalMode.i(on: focusedTextElement) {
                push(element: element)
                enterInsertMode()                
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .J:
            if let element = asNormalMode.J(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                endCurrentMove()                
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
        case .leftBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .leftBracket))
        case .leftChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .leftChevron))
        case .O:
            if let element = asNormalMode.O(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()                
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
        case .percent:
            if let element = asNormalMode.percent(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .return:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .rightBrace:
            if let element = asNormalMode.rightBrace(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .rightBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .rightBracket))
        case .rightChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .rightChevron))
        case .s:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            if let element = asNormalMode.u(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .underscore:
            if let element = asNormalMode.underscore(on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
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
        case .v:
            if let element = asVisualMode.vForEnteringFromNormalMode(on: focusedTextElement) {
                push(element: element)
                visualStyle = .characterwise
                enterVisualMode()
            } else { 
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .W:
            if let element = asNormalMode.W(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }            
        case .w:
            if let element = asNormalMode.w(times: count, on: focusedTextElement) {
                push(element: element)
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .X:
            if let element = asNormalMode.X(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .characterwise
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }  
        case .x:
            if let element = asNormalMode.x(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .characterwise
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }                
        case .Y:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .linewise
                endCurrentMove()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .leftBrace:
            if let element = asNormalMode.leftBrace(on: focusedTextElement) {
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
        case [.c, .a, .W]:
            if let element = asNormalMode.caW(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .a, .w]:
            var bipped = false
            
            if let element = asNormalMode.caw(on: focusedTextElement, pgR: appMode == .pgR, &bipped) {
                push(element: element)
                
                if bipped == false {
                    lastYankStyle = .characterwise
                    enterInsertMode()
                } else {
                    enterNormalMode()
                }
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .B]:
            if let element = asNormalMode.cB(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .b]:
            if let element = asNormalMode.cb(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
                
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .c]:
            if let element = asNormalMode.cc(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .linewise
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .E]:
            if let element = asNormalMode.cE(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .e]:
            if let element = asNormalMode.ce(on: focusedTextElement, pgR: appMode == .pgR) {
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
        case [.c, .i, .B]:
            if let element = asNormalMode.ciB(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .b]:
            if let element = asNormalMode.cib(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .doubleQuote]:
            var bipped = false
            
            if let element = asNormalMode.ciDoubleQuote(on: focusedTextElement, pgR: appMode == .pgR, &bipped) {
                push(element: element)
                
                if bipped == false {
                    lastYankStyle = .characterwise
                    enterInsertMode()
                } else {
                    enterNormalMode()
                }
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .leftBrace]:
            if let element = asNormalMode.ciLeftBrace(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .leftBracket]:
            if let element = asNormalMode.ciLeftBracket(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .leftParenthesis]:
            if let element = asNormalMode.ciLeftParenthesis(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .rightBrace]:
            if let element = asNormalMode.ciRightBrace(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .rightBracket]:
            if let element = asNormalMode.ciRightBracket(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .rightParenthesis]:
            if let element = asNormalMode.ciRightParenthesis(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .singleQuote]:
            var bipped = false
            
            if let element = asNormalMode.ciSingleQuote(on: focusedTextElement, pgR: appMode == .pgR, &bipped) {
                push(element: element)
                
                if bipped == false {
                    lastYankStyle = .characterwise
                    enterInsertMode()
                } else {
                    enterNormalMode()
                }
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .backtick]:
            var bipped = false
            
            if let element = asNormalMode.ciBacktick(on: focusedTextElement, pgR: appMode == .pgR, &bipped) {
                push(element: element)
                
                if bipped == false {
                    lastYankStyle = .characterwise
                    enterInsertMode()
                } else {
                    enterNormalMode()
                }
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i, .W]:
            if let element = asNormalMode.ciW(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }           
        case [.c, .i, .w]:
            if let element = asNormalMode.ciw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }           
        case [.c, .t]:
            ()
        case [.c, .T]:
            ()
        case [.c, .W]:
            if let element = asNormalMode.cW(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .w]:
            if let element = asNormalMode.cw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterInsertMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.colon, .q]:
            ()
        case [.colon, .q, .return]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.colon, .q, .exclamationMark]:
            ()
        case [.colon, .q, .exclamationMark, .return]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()        
        case [.colon, .w]:
            ()
        case [.colon, .w, .return]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.colon, .w, .q]:
            ()
        case [.colon, .w, .q, .return]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.d, .a]:
            ()
        case [.d, .a, .W]:
            if let element = asNormalMode.daW(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .a, .w]:
            var bipped = false
            
            if let element = asNormalMode.daw(on: focusedTextElement, pgR: appMode == .pgR, &bipped) {
                push(element: element)
                bipped == false ? lastYankStyle = .characterwise : ()
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .B]:
            if let element = asNormalMode.dB(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .b]:
            if let element = asNormalMode.db(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .d]:
            if let element = asNormalMode.dd(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .linewise
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .E]:
            if let element = asNormalMode.dE(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .e]:
            if let element = asNormalMode.de(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .f]:
            ()
        case [.d, .F]:
            ()
        case [.d, .G]:
            if let element = asNormalMode.dG(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
           } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
           }
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            if let element = asNormalMode.dgg(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .h]:
            if let element = asNormalMode.dh(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .characterwise
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .i]:
            ()
        case [.d, .i, .W]:
            if let element = asNormalMode.diW(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .i, .w]:
            if let element = asNormalMode.diw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
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
        case [.d, .l]:
            if let element = asNormalMode.dl(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                lastYankStyle = .characterwise
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .T]:
            ()
        case [.d, .t]:
            ()
        case [.d, .W]:
            if let element = asNormalMode.dW(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .w]:
            if let element = asNormalMode.dw(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
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
            if let element = asNormalMode.gE(times: count, on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .e]:
            if let element = asNormalMode.ge(times: count, on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .g]:
            if let element = asNormalMode.gg(times: count, on: focusedTextElement) {
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
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.leftBracket, .leftParenthesis]:
            if let element = asNormalMode.leftBracketLeftParenthesis(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.leftChevron, .leftChevron]:
            if let element = asNormalMode.leftChevronLeftChevron(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.rightBracket, .rightBrace]:
            if let element = asNormalMode.rightBracketRightBrace(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.rightBracket, .rightParenthesis]:
            if let element = asNormalMode.rightBracketRightParenthesis(on: focusedTextElement) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.rightChevron, .rightChevron]:
            if let element = asNormalMode.rightChevronRightChevron(on: focusedTextElement, pgR: appMode == .pgR) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .F]:
            ()
        case [.y, .f]:
            ()
        case [.y, .i]:
            ()
        case [.y, .i, .backtick]:
            if let element = asNormalMode.yiBacktick(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .doubleQuote]:
            if let element = asNormalMode.yiDoubleQuote(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .singleQuote]:
            if let element = asNormalMode.yiSingleQuote(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .leftBrace]:
            if let element = asNormalMode.yiLeftBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .leftBracket]:
            if let element = asNormalMode.yiLeftBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .leftParenthesis]:
            if let element = asNormalMode.yiLeftParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .rightBrace]:
            if let element = asNormalMode.yiRightBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .rightBracket]:
            if let element = asNormalMode.yiRightBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .rightParenthesis]:
            if let element = asNormalMode.yiRightParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .i, .w]:
            if let element = asNormalMode.yiw(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
                enterNormalMode()
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .T]:
            ()        
        case [.y, .t]:
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
            guard operatorPendingBuffer.first?.vimKey != .c else {
                var element: AccessibilityTextElement?
                
                switch operatorPendingBuffer[1].vimKey {
                case .F:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.cF(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                case .f:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.cf(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                case .T:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.cT(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                case .t:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.ct(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                default: ()
                }
                
                if let element = element {
                    push(element: element)
                    (element.selectedLength == 0 && element.isNotEmpty) ? enterInsertMode() : enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
            
            // df, dF, dt, dT
            guard operatorPendingBuffer.first?.vimKey != .d else {
                var element: AccessibilityTextElement?
                
                switch operatorPendingBuffer[1].vimKey {
                case .F:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.dF(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                case .f:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.df(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                case .T:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.dT(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                case .t:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.dt(times: count, to: character.character, on: focusedTextElement, pgR: appMode == .pgR)
                    }
                default: ()
                }
                
                if let element = element {
                    push(element: element)
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
                       
            guard operatorPendingBuffer.first?.vimKey != .F else {
                if let character = operatorPendingBuffer.last, let element = asNormalMode.F(times: count, to: character.character, on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
            
            guard operatorPendingBuffer.first?.vimKey != .f else {
                if let character = operatorPendingBuffer.last, let element = asNormalMode.f(times: count, to: character.character, on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
            
            guard operatorPendingBuffer.first?.vimKey != .r else {
                if let replacement = operatorPendingBuffer.last, let element = asNormalMode.r(with: replacement.character, on: focusedTextElement, pgR: appMode == .pgR) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
            
            guard operatorPendingBuffer.first?.vimKey != .T else {
                if let character = operatorPendingBuffer.last, let element = asNormalMode.T(times: count, to: character.character, on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
            
            guard operatorPendingBuffer.first?.vimKey != .t else {
                if let character = operatorPendingBuffer.last, let element = asNormalMode.t(times: count, to: character.character, on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
            
            
            // yf, yF, yt, yT
            guard operatorPendingBuffer.first?.vimKey != .y else {
                var element: AccessibilityTextElement?
                
                switch operatorPendingBuffer[1].vimKey {
                case .F:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.yF(times: count, to: character.character, on: focusedTextElement)
                    }
                case .f:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.yf(times: count, to: character.character, on: focusedTextElement)
                    }
                case .T:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.yT(times: count, to: character.character, on: focusedTextElement)
                    }
                case .t:
                    if let character = operatorPendingBuffer.last {
                        element = asNormalMode.yt(times: count, to: character.character, on: focusedTextElement)
                    }
                default: ()
                }
                
                if let element = element {
                    push(element: element)
                    // TODO: if the move hasn't found anything, we shouldn't change the LYS
                    lastYankStyle = .characterwise                    
                    enterNormalMode()
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
                                
                return
            }
                        
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }

}
