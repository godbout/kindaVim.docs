import KeyCombination


// KS Normal Mode
extension KindaVimEngine {
    
    func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .A:
            enterInsertMode()
            post(ksNormalMode.A())
        case .a:
            enterInsertMode()
            post(ksNormalMode.a())
        case .b:
            resetCountBuffers()
            post(ksNormalMode.b())
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            enterInsertMode()
            post(ksNormalMode.C())
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .D:
            resetCountBuffers()
            post(ksNormalMode.D())
        case .controlD:
            resetCountBuffers()
            post(ksNormalMode.controlD())
        case .e:
            resetCountBuffers()
            post(ksNormalMode.e())
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            resetCountBuffers()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.GForTextElement())
            case .nonTextElement:
                post(ksNormalMode.GForNonTextElement())
            }
        case .h:
            resetCountBuffers()
            post(ksNormalMode.h())
        case .i:
            enterInsertMode()
            post(ksNormalMode.i())
        case .I:
            enterInsertMode()
            post(ksNormalMode.I())
        case .j:
            resetCountBuffers()
            post(ksNormalMode.j())
        case .k:
            resetCountBuffers()
            post(ksNormalMode.k())
        case .l:
            post(ksNormalMode.l(times: count))
            resetCountBuffers()
        case .o:
            enterInsertMode()            
            post(ksNormalMode.o())
        case .O:
            enterInsertMode()
            post(ksNormalMode.O())
        case .p:
            resetCountBuffers()
            post(ksNormalMode.p())
        case .P:
            resetCountBuffers()
            post(ksNormalMode.P())
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            resetCountBuffers()
            post(ksNormalMode.controlR())
        case .s:
            enterInsertMode()
            post(ksNormalMode.s())
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            resetCountBuffers()
            post(ksNormalMode.u())
        case .controlU:
            resetCountBuffers()
            post(ksNormalMode.controlU())
        case .v:
            enterVisualMode()            
            visualStyle = .characterwise
            
            post(ksVisualMode.vForEnteringFromNormalMode())
        case .V:
            enterVisualMode()
            visualStyle = .linewise
            
            post(ksVisualMode.VForEnteringFromNormalMode())
        case .w:
            resetCountBuffers()
            post(ksNormalMode.w())
        case .x:
            resetCountBuffers()
            post(ksNormalMode.x())
        case .X:
            resetCountBuffers()
            post(ksNormalMode.X())
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            lastYankStyle = .linewise

            post(ksNormalMode.yy())
        case .escape:
            enterInsertMode()            
            post(ksNormalMode.escape())
        case .enter:
            enterInsertMode()
            post(ksNormalMode.enter())
        case .caret:
            post(ksNormalMode.caret())
            resetCountBuffers()
        case .dollarSign:
            resetCountBuffers()
            post(ksNormalMode.dollarSign())
        case .underscore:
            resetCountBuffers()
            post(ksNormalMode.underscore())
        case .zero:
            post(ksNormalMode.zero())
        default:
            resetCountBuffers()
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
            enterInsertMode()
            
            post(ksNormalMode.cb())
        case [.c, .c]:
            enterInsertMode()
            
            post(ksNormalMode.cc())
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            enterInsertMode()
            
            post(ksNormalMode.cgg())
        case [.c, .G]:
            enterInsertMode()
            
            post(ksNormalMode.cG())
        case [.c, .i]:
            ()
        case [.c, .i, .w]:
            enterInsertMode()
            
            post(ksNormalMode.ciw())
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            enterNormalMode()
        case [.d, .b]:
            enterNormalMode()
            
            post(ksNormalMode.db())
        case [.d, .d]:
            enterNormalMode()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ddForTextElement())
            default:
                post(ksNormalMode.ddForNonTextElement())
            }
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            enterNormalMode()
            
            post(ksNormalMode.dgg())
        case [.d, .G]:
            enterNormalMode()
            
            post(ksNormalMode.dG())
        case [.d, .j]:
            enterNormalMode()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.djForTextElement())
            default:
                post(ksNormalMode.djForNonTextElement())
            }
        case [.d, .k]:
            enterNormalMode()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dkForTextElement())
            default:
                post(ksNormalMode.dkForNonTextElement())
            }
        case [.g, .caret]:
            enterNormalMode()
            
            post(ksNormalMode.gCaret())
        case [.g, .dollarSign]:
            enterNormalMode()
            
            post(ksNormalMode.gDollarSign())
        case [.g, .e]:
            enterNormalMode()
            
            post(ksNormalMode.ge())
        case [.g, .g]:
            enterNormalMode()
                    
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ggForTextElement())
            default:
                post(ksNormalMode.ggForNonTextElement())
            }
        case [.g, .I]:
            enterInsertMode()
            
            post(ksNormalMode.gI())
        case [.g, .j]:
            enterNormalMode()
            
            post(ksNormalMode.gj())
        case [.g, .k]:
            enterNormalMode()
            
            post(ksNormalMode.gk())
        case [.g, .underscore]:
            enterNormalMode()
            
            post(ksNormalMode.gUnderscore())
        case [.g, .zero]:
            enterNormalMode()
            
            post(ksNormalMode.gZero())
        case [.y, .i]:
            ()
        case [.y, .i, .w]:
            enterNormalMode()
            lastYankStyle = .characterwise
            
            post(ksNormalMode.yiw())
        case [.y, .y]:
            enterNormalMode()
            lastYankStyle = .linewise
            
            post(ksNormalMode.yy())
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
