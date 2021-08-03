import CoreGraphics

protocol KeyboardStrategyNormalModeProtocol {
    
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
    func G(on role: AXElementRole?) -> [KeyCombination]
    func gg(on role: AXElementRole?) -> [KeyCombination]
    func h() -> [KeyCombination]
    func I() -> [KeyCombination]
    func j() -> [KeyCombination]
    func k() -> [KeyCombination]
    func l() -> [KeyCombination]
    func o() -> [KeyCombination]
    func O() -> [KeyCombination]
    func r(with replacement: KeyCombination) -> [KeyCombination]
    func controlR() -> [KeyCombination]
    func s() -> [KeyCombination]
    func u() -> [KeyCombination]
    func controlU() -> [KeyCombination]
    func w() -> [KeyCombination]
    func x() -> [KeyCombination]
    func X() -> [KeyCombination]
    func yy() -> [KeyCombination]
    func yiw() -> [KeyCombination]
    func caret() -> [KeyCombination]
    func dollarSign() -> [KeyCombination]
    func underscore() -> [KeyCombination]
    func zero() -> [KeyCombination]
    
    func enter() -> [KeyCombination]
    func escape() -> [KeyCombination]

}


struct KeyboardStrategyNormalMode: KeyboardStrategyNormalModeProtocol {}
