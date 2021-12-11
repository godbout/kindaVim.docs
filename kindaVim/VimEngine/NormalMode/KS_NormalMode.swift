import KeyCombination


// KS Normal Mode
extension KindaVimEngine {
    
    func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .A:
            post(ksNormalMode.A())
            enterInsertMode()
        case .a:
            post(ksNormalMode.a())
            enterInsertMode()
        case .b:
            post(ksNormalMode.b())
            endCurrentMove()
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            post(ksNormalMode.C())
            enterInsertMode()
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .D:
            post(ksNormalMode.D())
            endCurrentMove()
        case .controlD:
            post(ksNormalMode.controlD())
            endCurrentMove()
        case .e:
            post(ksNormalMode.e())
            endCurrentMove()
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.GForTextElement())
            case .nonTextElement:
                post(ksNormalMode.GForNonTextElement())
            }
            
            endCurrentMove()
        case .h:
            post(ksNormalMode.h())
            endCurrentMove()
        case .i:
            post(ksNormalMode.i())
            enterInsertMode()
        case .I:
            post(ksNormalMode.I())
            enterInsertMode()
        case .j:
            post(ksNormalMode.j())
            endCurrentMove()
        case .k:
            post(ksNormalMode.k())
            endCurrentMove()
        case .l:
            post(ksNormalMode.l(times: count))
            endCurrentMove()
        case .o:
            post(ksNormalMode.o())
            enterInsertMode()            
        case .O:
            post(ksNormalMode.O())
            enterInsertMode()
        case .p:
            post(ksNormalMode.p())
            endCurrentMove()
        case .P:
            post(ksNormalMode.P())
            endCurrentMove()
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            post(ksNormalMode.controlR())
            endCurrentMove()
        case .s:
            post(ksNormalMode.s())
            enterInsertMode()
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            post(ksNormalMode.u())
            endCurrentMove()
        case .controlU:
            post(ksNormalMode.controlU())
            endCurrentMove()
        case .v:            
            visualStyle = .characterwise
            
            post(ksVisualMode.vForEnteringFromNormalMode())
            enterVisualMode()
        case .V:
            visualStyle = .linewise
            
            post(ksVisualMode.VForEnteringFromNormalMode())
            enterVisualMode()
        case .w:
            post(ksNormalMode.w())
            endCurrentMove()
        case .x:
            post(ksNormalMode.x())
            endCurrentMove()
        case .X:
            post(ksNormalMode.X())
            endCurrentMove()
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            lastYankStyle = .linewise

            post(ksNormalMode.yy())
            endCurrentMove()
        case .escape:
            post(ksNormalMode.escape())
            enterInsertMode()            
        case .enter:
            post(ksNormalMode.enter())
            enterInsertMode()
        case .caret:
            post(ksNormalMode.caret())
            endCurrentMove()
        case .dollarSign:
            post(ksNormalMode.dollarSign())
            endCurrentMove()
        case .underscore:
            post(ksNormalMode.underscore())
            endCurrentMove()
        case .zero:
            post(ksNormalMode.zero())
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
            post(ksNormalMode.cb())
            enterInsertMode()
        case [.c, .c]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ccForTextElement())
            default:
                post(ksNormalMode.ccForNonTextElement())
            }
                        
            enterInsertMode()
        case [.c, .e]:
            post(ksNormalMode.ce())
            enterInsertMode()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            post(ksNormalMode.cgg())            
            enterInsertMode()
        case [.c, .G]:
            post(ksNormalMode.cG())
            enterInsertMode()
        case [.c, .i]:
            ()
        case [.c, .i, .w]:
            post(ksNormalMode.ciw())
            enterInsertMode()    
        case [.c, .w]:
            post(ksNormalMode.cw())
            enterInsertMode()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            enterNormalMode()
        case [.d, .b]:
            post(ksNormalMode.db())
            enterNormalMode()            
        case [.d, .d]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ddForTextElement())
            default:
                post(ksNormalMode.ddForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            post(ksNormalMode.dgg())
            enterNormalMode()            
        case [.d, .G]:            
            post(ksNormalMode.dG())
            enterNormalMode()
        case [.d, .j]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.djForTextElement())
            default:
                post(ksNormalMode.djForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .k]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dkForTextElement())
            default:
                post(ksNormalMode.dkForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .caret]:
            post(ksNormalMode.gCaret())
            enterNormalMode()
        case [.g, .dollarSign]:            
            post(ksNormalMode.gDollarSign())
            enterNormalMode()
        case [.g, .e]:            
            post(ksNormalMode.ge())
            enterNormalMode()
        case [.g, .g]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ggForTextElement())
            default:
                post(ksNormalMode.ggForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .I]:
            post(ksNormalMode.gI())
            enterInsertMode()
        case [.g, .j]:            
            post(ksNormalMode.gj())
            enterNormalMode()
        case [.g, .k]:            
            post(ksNormalMode.gk())
            enterNormalMode()
        case [.g, .underscore]:            
            post(ksNormalMode.gUnderscore())
            enterNormalMode()
        case [.g, .zero]:            
            post(ksNormalMode.gZero())
            enterNormalMode()
        case [.y, .i]:
            ()
        case [.y, .i, .w]:
            lastYankStyle = .characterwise
            
            post(ksNormalMode.yiw())
            enterNormalMode()
        case [.y, .y]:
            lastYankStyle = .linewise
            
            post(ksNormalMode.yy())
            enterNormalMode()
        default:
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                post(ksNormalMode.r(with: replacement))
            }
            
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
}
