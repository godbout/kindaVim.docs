import Foundation

enum VimEngineMode {
    case normal
    case insert
    case operatorPending
}

class VimEngine {
    
    static var shared = VimEngine()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()

    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()

    private init() {
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        if currentMode != .operatorPending {
            switch keyCombination.vimKey {
            // temporary for escape to enter Command Mode
            // and escape again to send escape key to macOS
            case .escape:
                enterInsertMode()

                post(keyboardStrategy.escape())
            // temporary for pressing enter in Command Mode
            // to act like an enter in Insert Mode
            // checking if it feels better (like in Alfred)
            case .enter:
                enterInsertMode()

                post(keyboardStrategy.enter())
            case .dollarSign:
                // ugly af; need to refactor
                if let element = accessibilityStrategy.dollarSign(on: focusedElement()) {
                    if push(element: element) == false {
                        post(keyboardStrategy.dollarSign())
                    }
                } else {
                    post(keyboardStrategy.dollarSign())
                }
            case .underscore:
                post(keyboardStrategy.underscore())
            case .zero:
                // ugly af; need to refactor
                if let element = accessibilityStrategy.zero(on: focusedElement()) {
                    if push(element: element) == false {
                        post(keyboardStrategy.zero())
                    }
                } else {
                    post(keyboardStrategy.zero())
                }
            case .a:
                enterInsertMode()

                post(keyboardStrategy.a())
            case .A:
                enterInsertMode()

                post(keyboardStrategy.A())
            case .b:
                post(keyboardStrategy.b())
            case .c:
                enterOperatorPendingMode(with: keyCombination)
            case .C:
                enterInsertMode()

                post(keyboardStrategy.C())
            case .d:
                enterOperatorPendingMode(with: keyCombination)
            case .controlD:
                post(keyboardStrategy.controlD())
            case .g:
                enterOperatorPendingMode(with: keyCombination)
            case .G:
                post(keyboardStrategy.G())
            case .h:
                // ugly af; need to refactor
                if let element = accessibilityStrategy.h(on: focusedElement()) {
                    if push(element: element) == false {
                        post(keyboardStrategy.h())
                    }
                } else {
                    post(keyboardStrategy.h())
                }
            case .i:
                enterInsertMode()
            case .I:
                enterInsertMode()

                post(keyboardStrategy.I())
            case .j:
                post(keyboardStrategy.j())
            case .k:
                post(keyboardStrategy.k())
            case .l:
                // ugly af; need to refactor
                if let element = accessibilityStrategy.l(on: focusedElement()) {
                    if push(element: element) == false {
                        post(keyboardStrategy.l())
                    }
                } else {
                    post(keyboardStrategy.l())
                }
            case .o:
                enterInsertMode()

                post(keyboardStrategy.o())
            case .O:
                enterInsertMode()

                post(keyboardStrategy.O())
            case .r:
                enterOperatorPendingMode(with: keyCombination)
            case .controlR:
                post(keyboardStrategy.controlR())
            case .s:
                enterInsertMode()
                
                post(keyboardStrategy.s())
            case .u:
                post(keyboardStrategy.u())
            case .controlU:
                post(keyboardStrategy.controlU())
            case .w:
                post(keyboardStrategy.w())
            case .x:
                post(keyboardStrategy.x())
            case .X:
                post(keyboardStrategy.X())
            case .y:
                enterOperatorPendingMode(with: keyCombination)
            default:
                ()
            }
        } else {
            operatorPendingBuffer.append(keyCombination)

            if let operatorCommand = operatorCommand() {
                post(operatorCommand)
                resetOperatorPendingBuffer()
            }
        }
    }
    
    private func operatorCommand() -> [KeyCombination]? {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            return nil
        case [.c, .a, .w]:
            return nil
        case [.c, .b]:
            enterInsertMode()

            return keyboardStrategy.cb()
        case [.c, .c]:
            enterInsertMode()
            
            return keyboardStrategy.cc()
        case [.c, .g]:
            return nil
        case [.c, .g, .g]:
            enterInsertMode()

            return keyboardStrategy.cgg()
        case [.c, .G]:
            enterInsertMode()
            
            return keyboardStrategy.cG()
        case [.c, .i]:
            return nil
        case [.c, .i, .w]:
            enterInsertMode()

            return keyboardStrategy.ciw()
        case [.d, .a]:
            return nil
        case [.d, .a, .w]:
            return nil
        case [.d, .b]:
            enterNormalMode()

            return keyboardStrategy.db()
        case [.d, .d]:
            enterNormalMode()

            return keyboardStrategy.dd()
        case [.d, .g]:
            return nil
        case [.d, .g, .g]:
            enterNormalMode()
            
            return keyboardStrategy.dgg()
        case [.d, .i]:
            return nil
        case [.d, .i, .w]:
            return nil
        case [.d, .j]:
            enterNormalMode()
            
            return keyboardStrategy.dj()
        case [.d, .G]:
            enterNormalMode()
            
            return keyboardStrategy.dG()
        case [.g, .g]:
            enterNormalMode()
            
            return keyboardStrategy.gg()
        case [.y, .i]:
            return nil
        case [.y, .i, .w]:
            enterNormalMode()

            return keyboardStrategy.yiw()
        case [.y, .y]:
            enterNormalMode()

            return keyboardStrategy.yy()
        default:
            // special case of the simple-change r command
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {
                enterNormalMode()

                return keyboardStrategy.r(with: replacement)
            }

            enterNormalMode()
            
            return nil
        }
    }
    
    func enterNormalMode() {
        if currentMode == .insert, let element = accessibilityStrategy.blockCursor(.on, on: focusedElement()) {
            _ = push(element: element)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()

        Display.tint()
    }


    func enterInsertMode() {
        if let element = accessibilityStrategy.blockCursor(.off, on: focusedElement()) {
            _ = push(element: element)
        }
        
        currentMode = .insert
        resetOperatorPendingBuffer()

        Display.reset()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }
    
    private func enterOperatorPendingMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(keyCombination)
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityStrategy.focusedElement()
    }

    private func push(element: AccessibilityTextElement) -> Bool {
        return AccessibilityStrategy.push(element: element)
    }
    
}
