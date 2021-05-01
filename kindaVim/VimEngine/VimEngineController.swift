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
    
    var keyboardStrategy = KeyboardStrategy()
    
    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func transform(from original: KeyCombination) -> [KeyCombination] {
        if VimEngineController.shared.currentMode != .operatorPending {
            switch original.key {
            case .c where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "c")
                
                return []
            case .c where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return keyboardStrategy.C()
            case .g where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "g")
                
                return []
            case .g where original.shift == true:
                return keyboardStrategy.G()
            case .x where original.shift == false:
                return keyboardStrategy.x()
            case .x where original.shift == true:
                return keyboardStrategy.X()                
            case .b where original.shift == false:
                return keyboardStrategy.b()
            case .r where original.control == true:
                return keyboardStrategy.controlR()                
            case .u:
                return keyboardStrategy.u()
            case .o where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return keyboardStrategy.o()
            case .o where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return keyboardStrategy.O()
            case .i where original.shift == false:
                VimEngineController.shared.enterInsertMode()

                return []
            case .i where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return keyboardStrategy.I()
            case .a where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return keyboardStrategy.a()
            case .a where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return keyboardStrategy.A()
            case .j:
                return keyboardStrategy.j()
            case .k:
                return keyboardStrategy.k()                
            case .h:
                return keyboardStrategy.h()
            case .l:
                return keyboardStrategy.l()
            default:
                return [original]
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
            
            return operatorCommand()
        }
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
