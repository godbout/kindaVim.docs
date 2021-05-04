//
//  VimEngineController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

enum VimEngineMode {
    case command
    case insert
    case operatorPending
}

class VimEngineController {
    
    static var shared = VimEngineController()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = ""
    
    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        if currentMode != .operatorPending {
            switch keyCombination.vimKey {
            case .dollarSign:
                post(KeyboardStrategy.dollarSign())
            case .underscore:
                post(KeyboardStrategy.underscore())
            case .zero:
                post(KeyboardStrategy.zero())
            case .a:
                enterInsertMode()

                post(KeyboardStrategy.a())
            case .A:
                enterInsertMode()

                post(KeyboardStrategy.A())
            case .b:
                post(KeyboardStrategy.b())
            case .c:
                enterOperatorPendingMode(with: "c")
            case .C:
                enterInsertMode()

                post(KeyboardStrategy.C())
            case .d:
                enterOperatorPendingMode(with: "d")
            case .g:
                enterOperatorPendingMode(with: "g")
            case .G:
                post(KeyboardStrategy.G())
            case .h:
                if let element = AccessibilityStrategy.h(on: focusedElement()) {
                    // ugly, need to refactor
                    if write(element: element) == false {
                        post(KeyboardStrategy.h())
                    }
                }

                post(KeyboardStrategy.h())
            case .i:
                enterInsertMode()
            case .I:
                enterInsertMode()

                post(KeyboardStrategy.I())
            case .j:
                post(KeyboardStrategy.j())
            case .k:
                post(KeyboardStrategy.k())
            case .l:
                if let element = AccessibilityStrategy.l(on: focusedElement()) {
                    if write(element: element) == false {
                        post(KeyboardStrategy.l())
                    }
                }

                post(KeyboardStrategy.l())
            case .o:
                enterInsertMode()

                post(KeyboardStrategy.o())
            case .O:
                enterInsertMode()

                post(KeyboardStrategy.O())
            case .controlR:
                post(KeyboardStrategy.controlR())
            case .u:
                post(KeyboardStrategy.u())
            case .w:
                post(KeyboardStrategy.w())
            case .x:
                post(KeyboardStrategy.x())
            case .X:
                post(KeyboardStrategy.X())
            default:
                ()
            }
        } else {
            switch keyCombination.key {
            case .c:
                operatorPendingBuffer.append("c")
            case .g:
                operatorPendingBuffer.append("g")
            case .d:
                operatorPendingBuffer.append("d")
            case .i:
                operatorPendingBuffer.append("i")
            case .w:
                operatorPendingBuffer.append("w")
            default:
                // TODO: handle this better
                // this is to avoid repeating the
                // resetOperatorPendingBuffer() and enterCommandMode()
                // of the default case of operatorCommand
                operatorPendingBuffer.append("69 LOL")
            }

            if let operatorCommand = operatorCommand() {
                post(operatorCommand)
            }
        }
    }
    
    private func operatorCommand() -> [KeyCombination]? {
        print(operatorPendingBuffer)
        
        switch operatorPendingBuffer {
        case "cc":
            enterInsertMode()
            
            return KeyboardStrategy.cc()
        case "gg":
            enterCommandMode()
            
            return KeyboardStrategy.gg()
        case "dd":
            enterCommandMode()
            
            return KeyboardStrategy.dd()
        case "ci":
            return []
        case "ciw":
            enterInsertMode()
            
            return KeyboardStrategy.ciw()
        default:
            resetOperatorPendingBuffer()
            enterCommandMode()
            
            return nil
        }        
    }
    
    func enterCommandMode() {
        currentMode = .command
        resetOperatorPendingBuffer()

        Display.tint()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        Display.reset()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = ""
    }
    
    private func enterOperatorPendingMode(with operator: String) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(`operator`)
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityElement? {
        return AccessibilityStrategy.focusedElement()
    }

    private func write(element: AccessibilityElement) -> Bool {
        return AccessibilityStrategy.write(element: element)
    }
    
}
