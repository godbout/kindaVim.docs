import Foundation

protocol KeyboardStrategyProtocol {

    func a() -> [KeyCombination]
    func A() -> [KeyCombination]
    func b() -> [KeyCombination]
    func C() -> [KeyCombination]
    func cb() -> [KeyCombination]
    func cc() -> [KeyCombination]
    func cgg() -> [KeyCombination]
    func cG() -> [KeyCombination]
    func ciw() -> [KeyCombination]
    func controlD() -> [KeyCombination]
    func db() -> [KeyCombination]
    func dd() -> [KeyCombination]
    func dj() -> [KeyCombination]
    func dgg() -> [KeyCombination]
    func dG() -> [KeyCombination]
    func G() -> [KeyCombination]
    func gg() -> [KeyCombination]
    func h() -> [KeyCombination]
    func I() -> [KeyCombination]
    func j() -> [KeyCombination]
    func k() -> [KeyCombination]
    func l() -> [KeyCombination]
    func o() -> [KeyCombination]
    func O() -> [KeyCombination]
    func r(with: KeyCombination) -> [KeyCombination]
    func controlR() -> [KeyCombination]
    func s() -> [KeyCombination]
    func u() -> [KeyCombination]
    func controlU() -> [KeyCombination]
    func w() -> [KeyCombination]
    func x() -> [KeyCombination]
    func X() -> [KeyCombination]
    func yy() -> [KeyCombination]
    func yiw() -> [KeyCombination]
    func dollarSign() -> [KeyCombination]

    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    func escape() -> [KeyCombination]

    // temporary for pressing enter in Command Mode
    // to act like an enter in Insert Mode
    // checking if it feels better (like in Alfred)
    func enter() -> [KeyCombination]

    func underscore() -> [KeyCombination]
    func zero() -> [KeyCombination]

}

struct KeyboardStrategy: KeyboardStrategyProtocol {
    
    static var proxy: CGEventTapProxy!

    func a() -> [KeyCombination] {
        return [
            KeyCombination(key: .right)
        ]
    }

    func A() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true)
        ]
    }

    func b() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true)
        ]
    }

    func C() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }

    func cb() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete, option: true)
        ]
    }

    func cc() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }

    func cgg() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .up, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }
    
    func cG() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .left, command: true),
            KeyCombination(key: .down, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }

    func ciw() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .left, option: true, shift: true),
            KeyCombination(key: .delete)
        ]
    }
    
    func controlD() -> [KeyCombination] {
        return [
            KeyCombination(key: .fnDown)
        ]
    }

    func db() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete, option: true)
        ]
    }

    // TODO
    func dd() -> [KeyCombination] {
        return [
            KeyCombination(key: .e, control: true),
            KeyCombination(key: .a, control: true, shift: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .down),
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }

    // TODO
    func dj() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .down, shift: true),
            KeyCombination(key: .down, shift: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }

    // TODO
    func dgg() -> [KeyCombination] {
        return [
            KeyCombination(key: .down),
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .up, shift: true, command: true),
            KeyCombination(key: .delete),
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }

    // TODO
    func dG() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .down, shift: true, command: true),
            KeyCombination(key: .delete)
        ]
    }

    func G() -> [KeyCombination] {
        return [
            KeyCombination(key: .down, command: true)
        ]
    }

    func gg() -> [KeyCombination] {
        return [
            KeyCombination(key: .up, command: true)
        ]
    }

    func h() -> [KeyCombination] {
        return [
            KeyCombination(key: .left)
        ]
    }

    func I() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, command: true)
        ]
    }

    func j() -> [KeyCombination] {
        return [
            KeyCombination(key: .down)
        ]
    }
    
    func k() -> [KeyCombination] {
        return [
            KeyCombination(key: .up)
        ]
    }
    
    func l() -> [KeyCombination] {
        return [
            KeyCombination(key: .right)
        ]
    }

    func o() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .enter)
        ]
    }

    // TODO
    func O() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .enter),
            KeyCombination(key: .up)
        ]
    }

    func r(with replacement: KeyCombination) -> [KeyCombination] {
        return [
            KeyCombination(key: .d, control: true),
            replacement,
            KeyCombination(key: .left)

        ]
    }

    func controlR() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, shift: true, command: true)
        ]
    }

    func s() -> [KeyCombination] {
        return [
            KeyCombination(key: .d, control: true)
        ]
    }
    
    func u() -> [KeyCombination] {
        return [
            KeyCombination(key: .z, command: true)
        ]
    }
    
    func controlU() -> [KeyCombination] {
        return [
            KeyCombination(key: .fnUp)
        ]
    }

    func w() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .left, option: true)
        ]
    }

    func x() -> [KeyCombination] {
        return [
            KeyCombination(key: .d, control: true),
        ]
    }
    
    func X() -> [KeyCombination] {
        return [
            KeyCombination(key: .delete)
        ]
    }

    func yy() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .left, shift: true, command: true),
            KeyCombination(key: .c, command: true),
            KeyCombination(key: .right)
        ]
    }

    func yiw() -> [KeyCombination] {
        return [
            KeyCombination(key: .left, option: true),
            KeyCombination(key: .right, option: true, shift: true),
            KeyCombination(key: .c, command: true),
            KeyCombination(key: .right)
        ]
    }

    func dollarSign() -> [KeyCombination] {
        return [
            KeyCombination(key: .right, command: true)
        ]
    }

    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    func escape() -> [KeyCombination] {
        return [
            KeyCombination(key: .escape)
        ]
    }

    // temporary for pressing enter in Command Mode
    // to act like an enter in Insert Mode
    // checking if it feels better (like in Alfred)
    func enter() -> [KeyCombination] {
        return [
            KeyCombination(key: .enter)
        ]
    }

    func underscore() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true),
            KeyCombination(key: .right, option: true),
            KeyCombination(key: .left, option: true)
        ]
    }

    func zero() -> [KeyCombination] {
        return [
            KeyCombination(key: .a, control: true)
        ]
    }

    static func post(_ keyCombinations: [KeyCombination]) {
        print("move using Keyboard Strategy")
        
        for keyCombination in keyCombinations {
            let cgEvents = KeyCombinationAdaptor.toCGEvents(from: keyCombination)
            
            for cgEvent in cgEvents {
                cgEvent.tapPostEvent(proxy)
            }
        }
    }
    
}
