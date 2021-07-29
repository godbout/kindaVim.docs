import Foundation
import AppKit
import SwiftUI


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
        guard let character = keyCombination?.character else { return }
        
        charactersWindow.show(lastCharacterBeing: character)
    }
    
    func fadeOutCharactersWindow() {
        charactersWindow.hide()
    }
    
}
