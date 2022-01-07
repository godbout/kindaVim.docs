import KeyCombination
import AccessibilityStrategy


// AS Normal Mode
extension KindaVimEngine {
 
    func tryHandlingNormalModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {         
        if let currentElement = focusedTextElement {
            switch keyCombination.vimKey {
            case .A:
                let newElement = asNormalMode.A(on: currentElement)
                push(element: newElement)
                enterInsertMode()
            case .a:
                let newElement = asNormalMode.a(on: currentElement)
                push(element: newElement)
                enterInsertMode()
            case .B:
                let newElement = asNormalMode.B(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .b:
                let newElement = asNormalMode.b(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .C:
                let newElement = asNormalMode.cDollarSign(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case .c:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .caret:
                let newElement = asNormalMode.caret(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .colon:
                enterOperatorPendingForNormalMode(with: keyCombination)
            // to test (can dump info to console, send stuff to AX etc.)
            case .commandD:
                let newElement = AccessibilityStrategyNormalMode.test(element: currentElement)
                push(element: newElement)
                endCurrentMove()
            // currently for controlB, D, F, U we will send to KS as AS is not implemented yet
            case .controlB:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .controlD:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .controlF:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .controlR:
                let newElement = asNormalMode.controlR(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .controlU:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .D:
                let newElement = asNormalMode.dDollarSign(on: currentElement, &state)
                push(element: newElement)
                endCurrentMove()
            case .d:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .dollarSign:
                let newElement = asNormalMode.dollarSign(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .E:
                let newElement = asNormalMode.E(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .e:
                let newElement = asNormalMode.e(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .escape:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .F:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .f:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .G:
                let newElement = asNormalMode.G(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .g:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .h:
                let newElement = asNormalMode.h(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .I:
                let newElement = asNormalMode.I(on: currentElement)
                push(element: newElement)
                enterInsertMode()
            case .i:
                let newElement = asNormalMode.i(on: currentElement)
                push(element: newElement)
                enterInsertMode()
            case .J:
                let newElement = asNormalMode.J(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .j:
                if currentElement.role == .textField {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                } else {
                    if jkMapping == true {
                        let newElement = asNormalMode.gj(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()
                    } else {
                        let newElement = asNormalMode.j(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()
                    }
                }
            // TODO: testing if Alfred style or not will have to be done here, not in the move itself anymore
                // IMPORTANT!!!
                // maybe gj gk too
            case .k:
                if currentElement.role == .textField {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                } else {
                    if jkMapping == true {
                        let newElement = asNormalMode.gk(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()
                    } else {
                        let newElement = asNormalMode.k(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()
                    }
                }
            case .l:
                let newElement = asNormalMode.l(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .leftBracket:
                enterOperatorPendingForNormalMode(with: KeyCombination(key: .leftBracket))
            case .leftChevron:
                enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .leftChevron))
            case .O:
                let newElement = asNormalMode.O(on: currentElement, state)
                push(element: newElement)
                enterInsertMode()
            case .o:
                let newElement = asNormalMode.o(on: currentElement, state)
                push(element: newElement)
                enterInsertMode()
            case .P:
                switch state.lastYankStyle {
                case .characterwise:
                    let newElement = asNormalMode.PForLastYankStyleCharacterwise(on: currentElement, state)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    let newElement = asNormalMode.PForLastYankStyleLinewise(on: currentElement, state)
                    push(element: newElement)
                    endCurrentMove()
                }
            case .p:
                switch state.lastYankStyle {
                case .characterwise:
                    let newElement = asNormalMode.pForLastYankStyleCharacterwise(on: currentElement, state)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    let newElement = asNormalMode.pForLastYankStyleLinewise(on: currentElement, state)
                    push(element: newElement)
                    endCurrentMove()
                }
            case .percent:
                let newElement = asNormalMode.percent(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .r:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .return:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .rightBrace:
                let newElement = asNormalMode.rightBrace(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .rightBracket:
                enterOperatorPendingForNormalMode(with: KeyCombination(key: .rightBracket))
            case .rightChevron:
                enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .rightChevron))
            case .S:
                let newElement = asNormalMode.cc(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case .s:
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            case .T:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .t:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .tilde:
                let newElement = asNormalMode.tilde(times: count, on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .u:
                let newElement = asNormalMode.u(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .underscore:
                let newElement = asNormalMode.underscore(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .V:
                let newElement = asVisualMode.VForEnteringFromNormalMode(on: currentElement)
                push(element: newElement)
                visualStyle = .linewise
                enterVisualMode()
            case .v:
                let newElement = asVisualMode.vForEnteringFromNormalMode(on: currentElement)
                push(element: newElement)
                visualStyle = .characterwise
                enterVisualMode()
            case .W:
                let newElement = asNormalMode.W(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .w:
                let newElement = asNormalMode.w(times: count, on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .X:
                let newElement = asNormalMode.dh(on: currentElement, &state)
                push(element: newElement)
                endCurrentMove()
            case .x:
                let newElement = asNormalMode.dl(on: currentElement, &state)
                push(element: newElement)
                endCurrentMove()
            case .Y:
                let newElement = asNormalMode.yy(on: currentElement, &state)
                push(element: newElement)
                endCurrentMove()
            case .y:
                enterOperatorPendingForNormalMode(with: keyCombination)
            case .leftBrace:
                let newElement = asNormalMode.leftBrace(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .zero:
                let newElement = asNormalMode.zero(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            default:
                endCurrentMove()
            }
        } else {
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        }
    }
    
}


// Operator Pending for AS Normal Mode
extension KindaVimEngine {

    func tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst(appMode: AppMode) {
        if let currentElement = focusedTextElement {
            switch operatorPendingBuffer.map({ $0.vimKey }) {
            case [.c, .a]:
                ()
            case [.c, .a, .W]:
                let newElement = asNormalMode.caW(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .a, .w]:
                let newElement = asNormalMode.caw(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .B]:
                let newElement = asNormalMode.cB(times: count, on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .b]:
                let newElement = asNormalMode.cb(times: count, on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .c]:
                let newElement = asNormalMode.cc(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .dollarSign]:
                let newElement = asNormalMode.cDollarSign(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .E]:
                let newElement = asNormalMode.cE(times: count, on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .e]:
                let newElement = asNormalMode.ce(times: count, on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .F]:
                ()
            case [.c, .f]:
                ()
            case [.c, .G]:
                let newElement = asNormalMode.cG(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .g]:
                ()
            case [.c, .g, .g]:
                let newElement = asNormalMode.cgg(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .i]:
                ()
            case [.c, .i, .B]:
                let newElement = asNormalMode.ciB(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .b]:
                let newElement = asNormalMode.cib(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .backtick]:
                let newElement = asNormalMode.ciBacktick(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .doubleQuote]:
                let newElement = asNormalMode.ciDoubleQuote(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .leftBrace]:
                let newElement = asNormalMode.ciLeftBrace(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .leftBracket]:
                let newElement = asNormalMode.ciLeftBracket(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .leftParenthesis]:
                let newElement = asNormalMode.ciLeftParenthesis(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .rightBrace]:
                let newElement = asNormalMode.ciRightBrace(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .rightBracket]:
                let newElement = asNormalMode.ciRightBracket(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .rightParenthesis]:
                let newElement = asNormalMode.ciRightParenthesis(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .singleQuote]:
                let newElement = asNormalMode.ciSingleQuote(on: currentElement, &state)
                push(element: newElement)
                state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
            case [.c, .i, .W]:
                let newElement = asNormalMode.ciW(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .i, .w]:
                let newElement = asNormalMode.ciw(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .t]:
                ()
            case [.c, .T]:
                ()
            case [.c, .W]:
                let newElement = asNormalMode.cW(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case [.c, .w]:
                let newElement = asNormalMode.cw(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
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
            case [.colon, .x]:
                ()
            case [.colon, .x, .return]:
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            case [.d, .a]:
                ()
            case [.d, .a, .W]:
                let newElement = asNormalMode.daW(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .a, .w]:
                let newElement = asNormalMode.daw(on: currentElement, &state)
                push(element: newElement)
                // TODO: remove lastYankStyle
                state.lastMoveBipped == false ? state.lastYankStyle = .characterwise : ()
                enterNormalMode()
            case [.d, .B]:
                let newElement = asNormalMode.dB(times: count, on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .b]:
                let newElement = asNormalMode.db(times: count, on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .d]:
                let newElement = asNormalMode.dd(on: currentElement, &state)
                push(element: newElement)
                state.lastYankStyle = .linewise
                enterNormalMode()
            case [.d, .dollarSign]:
                let newElement = asNormalMode.dDollarSign(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .E]:
                let newElement = asNormalMode.dE(times: count, on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .e]:
                let newElement = asNormalMode.de(times: count, on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .f]:
                ()
            case [.d, .F]:
                ()
            case [.d, .G]:
                let newElement = asNormalMode.dG(on: currentElement, pgR: appMode == .pgR)
                push(element: newElement)
                state.lastYankStyle = .linewise
                enterNormalMode()
            case [.d, .g]:
                ()
            case [.d, .g, .g]:
                let newElement = asNormalMode.dgg(on: currentElement, pgR: appMode == .pgR)
                push(element: newElement)
                enterNormalMode()
            case [.d, .h]:
                let newElement = asNormalMode.dh(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .i]:
                ()
            case [.d, .i, .W]:
                let newElement = asNormalMode.diW(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .i, .w]:
                let newElement = asNormalMode.diw(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .j]:
                let newElement = asNormalMode.dj(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .k]:
                let newElement = asNormalMode.dk(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .l]:
                let newElement = asNormalMode.dl(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .T]:
                ()
            case [.d, .t]:
                ()
            case [.d, .W]:
                let newElement = asNormalMode.dW(times: count, on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.d, .w]:
                let newElement = asNormalMode.dw(times: count, on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.g, .caret]:
                let newElement = asNormalMode.gCaret(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .dollarSign]:
                let newElement = asNormalMode.gDollarSign(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .E]:
                let newElement = asNormalMode.gE(times: count, on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .e]:
                let newElement = asNormalMode.ge(times: count, on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .g]:
                let newElement = asNormalMode.gg(times: count, on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .I]:
                let newElement = asNormalMode.gI(on: currentElement)
                push(element: newElement)
                enterInsertMode()
            case [.g, .j]:
                let newElement = asNormalMode.gj(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .k]:
                let newElement = asNormalMode.gk(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .underscore]:
                let newElement = asNormalMode.gUnderscore(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.g, .zero]:
                let newElement = asNormalMode.gZero(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.leftBracket, .leftBrace]:
                let newElement = asNormalMode.leftBracketLeftBrace(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.leftBracket, .leftParenthesis]:
                let newElement = asNormalMode.leftBracketLeftParenthesis(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.leftChevron, .leftChevron]:
                let newElement = asNormalMode.leftChevronLeftChevron(on: currentElement, state)
                push(element: newElement)
                enterNormalMode()
            case [.rightBracket, .rightBrace]:
                let newElement = asNormalMode.rightBracketRightBrace(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.rightBracket, .rightParenthesis]:
                let newElement = asNormalMode.rightBracketRightParenthesis(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case [.rightChevron, .rightChevron]:
                let newElement = asNormalMode.rightChevronRightChevron(on: currentElement, state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .F]:
                ()
            case [.y, .f]:
                ()
            case [.y, .i]:
                ()
            case [.y, .i, .backtick]:
                let newElement = asNormalMode.yiBacktick(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .doubleQuote]:
                let newElement = asNormalMode.yiDoubleQuote(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .singleQuote]:
                let newElement = asNormalMode.yiSingleQuote(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .leftBrace]:
                let newElement = asNormalMode.yiLeftBrace(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .leftBracket]:
                let newElement = asNormalMode.yiLeftBracket(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .leftParenthesis]:
                let newElement = asNormalMode.yiLeftParenthesis(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .rightBrace]:
                let newElement = asNormalMode.yiRightBrace(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .rightBracket]:
                let newElement = asNormalMode.yiRightBracket(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .rightParenthesis]:
                let newElement = asNormalMode.yiRightParenthesis(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case [.y, .i, .w]:
                let newElement = asNormalMode.yiw(on: currentElement, &state)
                push(element: newElement)
                state.lastYankStyle = .characterwise
                enterNormalMode()
            case [.y, .T]:
                ()
            case [.y, .t]:
                ()
            case [.y, .y]:
                let newElement = asNormalMode.yy(on: currentElement, &state)
                push(element: newElement)
                state.lastYankStyle = .linewise
                enterNormalMode()
            default:
                // cf, cF, ct, cT
                guard operatorPendingBuffer.first?.vimKey != .c else {
                    var newElement: AccessibilityTextElement?
                    
                    switch operatorPendingBuffer[1].vimKey {
                    case .F:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.cF(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .f:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.cf(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .T:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.cT(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .t:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.ct(times: count, to: character.character, on: currentElement, &state)
                        }
                    default: ()
                    }

                    if let newElement = newElement {
                        push(element: newElement)
                        state.lastMoveBipped == false ? enterInsertMode() : enterNormalMode()
                    } else {
                        parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                    }

                    return
                }

                // df, dF, dt, dT
                guard operatorPendingBuffer.first?.vimKey != .d else {
                    var newElement: AccessibilityTextElement?

                    switch operatorPendingBuffer[1].vimKey {
                    case .F:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.dF(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .f:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.df(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .T:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.dT(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .t:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.dt(times: count, to: character.character, on: currentElement, &state)
                        }
                    default: ()
                    }

                    if let newElement = newElement {
                        push(element: newElement)
                        enterNormalMode()
                    } else {
                        parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                    }

                    return
                }

                guard operatorPendingBuffer.first?.vimKey != .F else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asNormalMode.F(times: count, to: character.character, on: currentElement)
                        push(element: newElement)
                        enterNormalMode()
                    }

                    return
                }

                guard operatorPendingBuffer.first?.vimKey != .f else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asNormalMode.f(times: count, to: character.character, on: currentElement)
                        push(element: newElement)
                        enterNormalMode()
                    }

                    return
                }

                guard operatorPendingBuffer.first?.vimKey != .r else {
                    if let replacement = operatorPendingBuffer.last {
                        let newElement = asNormalMode.r(times: count, with: replacement.character, on: currentElement, state)
                        push(element: newElement)
                        enterNormalMode()
                    }

                    return
                }

                guard operatorPendingBuffer.first?.vimKey != .T else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asNormalMode.T(times: count, to: character.character, on: currentElement)
                        push(element: newElement)
                        enterNormalMode()
                    }

                    return
                }

                guard operatorPendingBuffer.first?.vimKey != .t else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asNormalMode.t(times: count, to: character.character, on: currentElement)
                        push(element: newElement)
                        enterNormalMode()
                    }

                    return
                }


                // yf, yF, yt, yT
                guard operatorPendingBuffer.first?.vimKey != .y else {
                    var newElement: AccessibilityTextElement?

                    switch operatorPendingBuffer[1].vimKey {
                    case .F:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.yF(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .f:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.yf(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .T:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.yT(times: count, to: character.character, on: currentElement, &state)
                        }
                    case .t:
                        if let character = operatorPendingBuffer.last {
                            newElement = asNormalMode.yt(times: count, to: character.character, on: currentElement, &state)
                        }
                    default: ()
                    }

                    if let newElement = newElement {
                        push(element: newElement)
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
        } else {
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        }
    }

}
