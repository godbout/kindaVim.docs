import KeyCombination


protocol CommandLineModeProtocol {
    
    func q() -> [KeyCombination]
    func qExclamationMark() -> [KeyCombination]
    func w() -> [KeyCombination]
    func wq() -> [KeyCombination]
    func x() -> [KeyCombination]
    
}


// TODO: should we do a CommandLine package?
// current what those moves return are not tested.
struct CommandLineMode: CommandLineModeProtocol {

    func q() -> [KeyCombination] {
        return [
            KeyCombination(key: .q, command: true)
        ]
    }
    
    func qExclamationMark() -> [KeyCombination] {
        return q()
    }
        
    func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .s, command: true)
        ]
    }
    
    func wq() -> [KeyCombination] {
        return [
            KeyCombination(key: .s, command: true),
            KeyCombination(key: .q, command: true)
        ]
    }
    
    func x() -> [KeyCombination] {
        return wq()
    }
    
}
