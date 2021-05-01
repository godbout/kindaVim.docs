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
    
    static var shared = VimEngineController.init()
    var currentMode: VimEngineMode = .insert
    var operatorPendingBuffer = ""
    var proxy: CGEventTapProxy!
    
    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func transform(from original: KeyCombination) -> Bool {
        if VimEngineController.shared.currentMode != .operatorPending {
            switch original.key {
            case .c where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "c")
                
                return true
            case .c where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return tap(KeyboardStrategy.C())
            case .g where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "g")
                
                return true
            case .g where original.shift == true:
                return tap(KeyboardStrategy.G())
            case .x where original.shift == false:
                return tap(KeyboardStrategy.x())
            case .x where original.shift == true:
                return tap(KeyboardStrategy.X())
            case .b where original.shift == false:
                return tap(KeyboardStrategy.b())
            case .r where original.control == true:
                return tap(KeyboardStrategy.controlR())
            case .u:
                return tap(KeyboardStrategy.u())
            case .o where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return tap(KeyboardStrategy.o())
            case .o where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return tap(KeyboardStrategy.O())
            case .i where original.shift == false:
                VimEngineController.shared.enterInsertMode()

                return true
            case .i where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return tap(KeyboardStrategy.I())
            case .a where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return tap(KeyboardStrategy.a())
            case .a where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return tap(KeyboardStrategy.A())
            case .h:
                if let element = AccessibilityStrategy.h(on: focusedElement()) {
                    return write(element: element)
                }
                
                return tap(KeyboardStrategy.h())
            case .j:
                return tap(KeyboardStrategy.j())
            case .k:
                return tap(KeyboardStrategy.k())
            case .l:
                return tap(KeyboardStrategy.l())
            default:
                return tap([original])
            }
        } else {
            switch original.key {
            case .c:
                operatorPendingBuffer.append("c")
            case .g:
                operatorPendingBuffer.append("g")
            default:
                ()
            }
            
            return tap(operatorCommand())
        }
    }
    
    private func focusedElement() -> AXUIElement {
        
    }
    
    private func write(element: AXUIElement?) -> Bool {
        print("write new AXUIElement")
        
        return false
    }
    
    private func tap(_ keyCombinations: [KeyCombination]) -> Bool {
        for keyCombination in keyCombinations {
            let cgEvent = KeyCombinationConverter.toCGEvent(from: keyCombination)
                    
            cgEvent?.tapPostEvent(proxy)
        }
        
        return true
    }
    
    private func operatorCommand() -> [KeyCombination] {
        switch operatorPendingBuffer {
        case "cc":
            VimEngineController.shared.enterInsertMode()
            
            return [
                KeyCombination(key: .right, command: true, action: .press),
                KeyCombination(key: .right, command: true, action: .release),
                KeyCombination(key: .left, command: true, shift: true, action: .press),
                KeyCombination(key: .left, command: true, shift: true, action: .release),
                KeyCombination(key: .delete, action: .press),
                KeyCombination(key: .delete, action: .release)                
            ]
        case "gg":
            VimEngineController.shared.enterCommandMode()
            
            return [
                KeyCombination(key: .up, command: true, action: .press),
                KeyCombination(key: .up, command: true, action: .release)
            ]
        default:
            VimEngineController.shared.enterCommandMode()
            
            return []
        }        
    }
    
    func enterCommandMode() {
        currentMode = .command
        resetOperatorPendingBuffer()

        barbaricallyTintDisplay()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        barbaricallyResetDisplayTint()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = ""
    }
    
    private func enterOperatorPendingMode(with operator: String) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(`operator`)
    }

    func barbaricallyTintDisplay() {
        let mainDisplayID = CGMainDisplayID()

        var redTable: [CGGammaValue] = [0.05, 0.7]
        var greenTable: [CGGammaValue] = [0.05, 0.7]
        var blueTable: [CGGammaValue] = [0.05, 0.7]

        CGSetDisplayTransferByTable(mainDisplayID, 2, &redTable, &greenTable, &blueTable)
    }

    func barbaricallyResetDisplayTint() {
        // barbaric for now yes
        CGDisplayRestoreColorSyncSettings()
    }
    
}
