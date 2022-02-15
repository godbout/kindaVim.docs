import KeyCombination
import Common


// KS Normal Mode
extension KindaVimEngine {
    
    func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .A:
            post(ksNormalMode.A(state))
            enterInsertMode()
        case .a:
            post(ksNormalMode.a(state))
            enterInsertMode()
        case .b:
            post(ksNormalMode.b(state))
            endCurrentMove()
        case .backspace:
            post(ksNormalMode.h(times: count))
            endCurrentMove()
        case .C:
            post(ksNormalMode.cDollarSign(&state))
            enterInsertMode()
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .caret:
            post(ksNormalMode.caret(state))
            endCurrentMove()
        case .colon:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlB:
            post(ksNormalMode.controlB())
            endCurrentMove()
        case .controlD:
            post(ksNormalMode.controlD())
            endCurrentMove()
        case .controlF:
            post(ksNormalMode.controlF())
            endCurrentMove()
        case .controlH:
            post(ksNormalMode.h(times: count))
            endCurrentMove()
        case .controlR:
            post(ksNormalMode.controlR())
            endCurrentMove()
        case .controlU:
            post(ksNormalMode.controlU())
            endCurrentMove()
        case .D:
            post(ksNormalMode.dDollarSign(&state))
            endCurrentMove()
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .dollarSign:
            post(ksNormalMode.dollarSign(state))
            endCurrentMove()
        case .e:
            post(ksNormalMode.e(state))
            endCurrentMove()
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            post(ksNormalMode.G(state))
            endCurrentMove()
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .h:
            post(ksNormalMode.h(times: count))
            endCurrentMove()
        case .I:
            post(ksNormalMode.I(state))
            enterInsertMode()
        case .i:
            post(ksNormalMode.i())
            enterInsertMode()
        case .J:
            post(ksNormalMode.J(state))
            endCurrentMove()
        case .j:
            post(ksNormalMode.j(times: count))
            endCurrentMove()
        case .k:
            post(ksNormalMode.k(times: count))
            endCurrentMove()
        case .l:
            post(ksNormalMode.l(times: count))
            endCurrentMove()
        case .leftArrow:
            post(ksNormalMode.h(times: count))
            endCurrentMove()
        case .O:
            post(ksNormalMode.O(state))
            enterInsertMode()
        case .o:
            post(ksNormalMode.o(state))
            enterInsertMode()
        case .P:
            post(ksNormalMode.P(state))
            endCurrentMove()
        case .p:
            post(ksNormalMode.p(state))
            endCurrentMove()
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .return:
            post(ksNormalMode.return())
            enterInsertMode()
        case .S:
            post(ksNormalMode.cc(&state))
            enterInsertMode()
        case .s:
            post(ksNormalMode.cl(&state))
            enterInsertMode()
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            post(ksNormalMode.u())
            endCurrentMove()
        case .underscore:
            post(ksNormalMode.underscore(state))
            endCurrentMove()
        case .V:
            post(ksVisualMode.VFromNormalMode(state))
            state.visualStyle = .linewise
            enterVisualMode()
        case .v:            
            post(ksVisualMode.vFromNormalMode(state))
            state.visualStyle = .characterwise
            enterVisualMode()
        case .w:
            post(ksNormalMode.w(state))
            endCurrentMove()
        case .X:
            post(ksNormalMode.dh(&state))
            endCurrentMove()
        case .x:
            post(ksNormalMode.dl(&state))
            endCurrentMove()
        case .Y:
            post(ksNormalMode.yy(&state))
            endCurrentMove()
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Z:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .zero:
            post(ksNormalMode.zero(state))
            endCurrentMove()
        default:
            endCurrentMove()
        }
    }
    
}


// Operator Pending for KS Normal Mode
extension KindaVimEngine {

    func parseOperatorCommandForNormalModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            enterNormalMode()
        case [.c, .b]:
            post(ksNormalMode.cb(&state))
            enterInsertMode()
        case [.c, .c]:            
            post(ksNormalMode.cc(&state))
            enterInsertMode()
        case [.c, .dollarSign]:
            post(ksNormalMode.cDollarSign(&state))
            enterInsertMode()
        case [.c, .e]:
            post(ksNormalMode.ce(&state))
            enterInsertMode()
        case [.c, .F]:
            ()
        case [.c, .f]:
            ()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            post(ksNormalMode.cgg(&state))
            enterInsertMode()
        case [.c, .G]:
            post(ksNormalMode.cG(&state))
            enterInsertMode()
        case [.c, .i]:
            ()
        case [.c, .i, .w]:
            post(ksNormalMode.ciw(&state))
            enterInsertMode()
        case [.c, .l]:
            post(ksNormalMode.cl(&state))
            enterInsertMode()
        case [.c, .w]:
            post(ksNormalMode.cw(&state))
            enterInsertMode()
        case [.colon, .q]:
            ()
        case [.colon, .q, .return]:
            post(commands.colonq())
            enterInsertMode()
        case [.colon, .q, .exclamationMark]:
            ()
        case [.colon, .q, .exclamationMark, .return]:
            post(commands.colonqBang())
            enterInsertMode()
        case [.colon, .w]:
            ()
        case [.colon, .w, .return]:
            post(commands.colonw())
            enterNormalMode()
        case [.colon, .w, .q]:
            ()
        case [.colon, .w, .q, .return]:
            post(commands.colonwq())
            enterInsertMode()
        case [.colon, .x]:
            ()
        case [.colon, .x, .return]:
            post(commands.colonx())
            enterInsertMode()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            enterNormalMode()
        case [.d, .b]:
            post(ksNormalMode.db(&state))
            enterNormalMode()
        case [.d, .d]:
            post(ksNormalMode.dd(&state))
            enterNormalMode()
        case [.d, .dollarSign]:
            post(ksNormalMode.dDollarSign(&state))
            enterNormalMode()
        case [.d, .e]:
            post(ksNormalMode.de(&state))
            enterNormalMode()
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            post(ksNormalMode.dgg(&state))
            enterNormalMode()            
        case [.d, .G]:            
            post(ksNormalMode.dG(&state))
            enterNormalMode()
        case [.d, .h]:
            post(ksNormalMode.dh(&state))
            enterNormalMode()
        case [.d, .i]:
            ()
        case [.d, .j]:
            post(ksNormalMode.dj(&state))
            enterNormalMode()
        case [.d, .k]:
            post(ksNormalMode.dk(&state))
            enterNormalMode()
        case [.d, .l]:
            post(ksNormalMode.dl(&state))
            enterNormalMode()
        case [.d, .w]:
            post(ksNormalMode.dw(&state))
            enterNormalMode()
        case [.g, .caret]:
            post(ksNormalMode.gCaret(state))
            enterNormalMode()
        case [.g, .dollarSign]:            
            post(ksNormalMode.gDollarSign(state))
            enterNormalMode()
        case [.g, .e]:            
            post(ksNormalMode.ge(state))
            enterNormalMode()
        case [.g, .g]:
            post(ksNormalMode.gg(state))
            enterNormalMode()
        case [.g, .I]:
            post(ksNormalMode.gI(state))
            enterInsertMode()
        case [.g, .j]:            
            post(ksNormalMode.gj())
            enterNormalMode()
        case [.g, .k]:            
            post(ksNormalMode.gk())
            enterNormalMode()
        case [.g, .underscore]:            
            post(ksNormalMode.gUnderscore(state))
            enterNormalMode()
        case [.g, .zero]:            
            post(ksNormalMode.gZero(state))
            enterNormalMode()
        case [.y, .F]:
            ()
        case [.y, .f]:
            ()
        case [.y, .i]:
            ()
        case [.y, .i, .w]:
            post(ksNormalMode.yiw(&state))
            enterNormalMode()
        case [.y, .T]:
            ()
        case [.y, .t]:
            ()
        case [.y, .y]:
            post(ksNormalMode.yy(&state))
            enterNormalMode()
        case [.Z, .Z]:
            post(commands.ZZ())
            enterInsertMode()
        default:
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                post(ksNormalMode.r(with: replacement, state))
            }
            
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
}
