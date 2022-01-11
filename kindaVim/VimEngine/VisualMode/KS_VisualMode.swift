import KeyCombination


// KS Visual Mode
extension KindaVimEngine {
    
    func handleVisualModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .a:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .b:
            post(ksVisualMode.b(state))
            endCurrentMove()
        case .C:
            post(ksVisualMode.C(&state))
            enterInsertMode()
        case .c:
            post(ksVisualMode.c(&state))
            enterInsertMode()
        case .caret:
            post(ksVisualMode.caret(state))
            endCurrentMove()
        case .D:
            post(ksVisualMode.D(&state))
            enterNormalMode()
        case .d:
            post(ksVisualMode.d(&state))
            enterNormalMode()
        case .dollarSign:
            post(ksVisualMode.dollarSign(state))
            endCurrentMove()
        case .e:
            post(ksVisualMode.e(state))
            endCurrentMove()
        case .escape:
            enterInsertMode()
        case .G:
            post(ksVisualMode.G(state))
            endCurrentMove()
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .h:
            post(ksVisualMode.h(state))
            endCurrentMove()
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .j:
            post(ksVisualMode.j(state))
            endCurrentMove()
        case .k:
            post(ksVisualMode.k(state))
            endCurrentMove()
        case .l:
            post(ksVisualMode.l(state))
            endCurrentMove()
        case .R:
            post(ksVisualMode.R(&state))
            enterInsertMode()
        case .S:
            post(ksVisualMode.S(&state))
            enterInsertMode()
        case .s:
            post(ksVisualMode.c(&state))
            enterInsertMode()
        case .underscore:
            post(ksVisualMode.underscore(state))
            endCurrentMove()
        case .V:
            post(ksVisualMode.VFromVisualMode(state))
            
            switch state.visualStyle {
            case .characterwise:
                state.visualStyle = .linewise
                endCurrentMove()
            case .linewise:
                enterNormalMode()
            }
        case .v:
            post(ksVisualMode.vFromVisualMode(state))
            
            switch state.visualStyle {
            case .characterwise:
                enterNormalMode()
            case .linewise:
                state.visualStyle = .characterwise
                endCurrentMove()
            }
        case .w:    
            post(ksVisualMode.w(state))
            endCurrentMove()
        case .X:
            post(ksVisualMode.D(&state))
            enterNormalMode()
        case .x:
            post(ksVisualMode.d(&state))
            enterNormalMode()
        case .Y:
            post(ksVisualMode.Y(&state))
            enterNormalMode()
        case .y:
            post(ksVisualMode.y(&state))
            enterNormalMode()
        case .zero:
            post(ksVisualMode.zero(state))
            endCurrentMove()
        default:
            endCurrentMove()
        }
    }
    
}


// Operator Pending for KS Visual Mode
extension KindaVimEngine {
    
    func parseOperatorCommandForVisualModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.g, .caret]:
            post(ksVisualMode.gCaret(state))
            enterVisualMode()
        case [.g, .dollarSign]:
            post(ksVisualMode.gDollarSign(state))
            enterVisualMode()
        case [.g, .e]:
            post(ksVisualMode.ge(state))
            enterVisualMode()
        case [.g, .g]:
            post(ksVisualMode.gg(state))
            enterVisualMode()
        case [.g, .I]:
            post(ksVisualMode.gI(state))
            enterVisualMode()
        case [.g, .j]:
            post(ksVisualMode.gj(state))
            enterVisualMode()
        case [.g, .k]:
            post(ksVisualMode.gk(state))
            enterVisualMode()
        case [.g, .zero]:
            post(ksVisualMode.gZero(state))
            enterVisualMode()
        default:
            // if we don't recognize any operator move
            // go back to visual mode
            enterVisualMode()
        }
    }
    
}
