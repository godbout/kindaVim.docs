import Foundation
import AppKit
import SwiftUI
import KeyCombination


struct Display {

    private var hazeOverWindow = HazeOverWindow()
    private var charactersWindow = CharactersWindow()
    enum HazeOverStatus {
        case on
        case off
    }
    
    
    func hazeOver(_ status: HazeOverStatus) {
        switch status {
        case .on:
            hazeOverWindow.on()
        case .off:
            hazeOverWindow.off()
        }
    }
    
    func showKeysTyped(lastBeing keyCombination: KeyCombination?) {
        guard let keyCombination = keyCombination else { return }
        
        charactersWindow.show(lastKeyCombinationBeing: keyCombination)
    }
    
    func fadeOutCharactersWindow() {
        charactersWindow.hide()
    }
    
}
