import Foundation
import AppKit


enum KeyCode: Int64, RawRepresentable {
    
    case a = 0
    case b = 11
    case c = 8
    case d = 2
    case e = 14
    case f = 3
    case g = 5
    case h = 4
    case i = 34
    case j = 38
    case k = 40
    case l = 37
    case m = 46
    case n = 45
    case o = 31
    case p = 35
    case q = 12
    case r = 15
    case s = 1
    case t = 17
    case u = 32
    case v = 9
    case w = 13
    case x = 7
    case y = 16
    case z = 6

    case zero = 29
    case one = 18
    case two = 19
    case three = 20
    case four = 21
    case five = 23
    case six = 22
    case seven = 26
    case eight = 28
    case nine = 25

    case backslash = 42
    case backtick = 50
    case comma = 43
    case delete = 51
    case dot = 47
    case down = 125
    case enter = 36
    case escape = 53
    case equal = 24
    case fnDown = 121
    case fnLeft = 115
    case fnRight = 119
    case fnUp = 116
    case left = 123
    case leftBracket = 33
    case minus = 27
    case right = 124
    case rightBracket = 30
    case semicolon = 41
    case singleQuote = 39
    case slash = 44
    case space = 49
    case up = 126
    
}


enum KeyCombinationAction {
    
    case press
    case release
    case both
    
}


enum VimKey {
    
    // for dumping data
    case commandD
    
    case a, A
    case b, B
    case c, C
    case d, controlD
    case e, E

    case f, F

    case g, G
    case h
    case i, I
    case j
    case k
    case l
    
    case leftBrace
    case leftBracket   
    case leftParenthesis

    case o, O
    case p, P
    
    case percent

    case r, controlR
    
    case rightBrace
    case rightBracket
    case rightParenthesis
    
    case s
    case t, T

    case u, controlU
    case v, V
    case w, W

    case x, X
    case y, Y

    case backtick
    case caret
    case doubleQuote
    case dollarSign

    // temporary for escape to enter Command Mode
    // and escape again to send escape key to macOS
    case escape

    // temporary for pressing enter in Command Mode
    // to act like an enter in Insert Mode
    // checking if it feels better (like in Alfred)
    case enter
    
    case rightChevron
    case singleQuote
    
    case underscore
    case zero
    
}


struct KeyCombination {
    
    let vimKey: VimKey?
    let key: KeyCode
    var control: Bool = false
    var option: Bool = false
    var shift: Bool = false
    var command: Bool = false
    var character: Character {
        let cgEvents = KeyCombinationAdaptor.toCGEvents(from: self)
        
        guard let cgEvent = cgEvents.first else { return "?" }
        guard let nsEvent = NSEvent(cgEvent: cgEvent) else { return "?" }
        
        return Character(nsEvent.charactersIgnoringModifiers ?? "?")
    }
    var action: KeyCombinationAction = .both
    
    
    init(key: KeyCode, control: Bool = false, option: Bool = false, shift: Bool = false, command: Bool = false, action: KeyCombinationAction = .both) {
        self.key = key
        self.control = control
        self.option = option
        self.shift = shift
        self.command = command
        self.action = action

        self.vimKey = Self.vimKeyFrom(key: key, control: control, option: option, shift: shift, command: command)
    }
    
    init(vimKey: VimKey, action: KeyCombinationAction = .both) {
        control = false
        option = false
        shift = false
        command = false
        self.action = action
        self.vimKey = vimKey
        
        switch vimKey {
        case .commandD:
            key = .d
            command = true
        case .a:
            key = .a
        case .A:
            key = .a
            shift = true
        case .b:
            key = .b
        case .B:
            key = .b
            shift = true
        case .c:
            key = .c
        case .C:
            key = .c
            shift = true
        case .d:
            key = .d
        case .controlD:
            key = .d
            control = true
        case .e:
            key = .e
        case .E:
            key = .e
            shift = true
        case .f:
            key = .f
        case .F:
            key = .f
            shift = true
        case .g:
            key = .g
        case .G:
            key = .g
            shift = true
        case .h:
            key = .h
        case .i:
            key = .i
        case .I:
            key = .i
            shift = true
        case .j:
            key = .j
        case .k:
            key = .k
        case .l:
            key = .l        
        case .o:
            key = .o
        case .O:
            key = .o
            shift = true
        case .p:
            key = .p
        case .P:
            key = .p
            shift = true
        case .percent:
            key = .five
            shift = true
        case .r:
            key = .r
        case .controlR:
            key = .r
            control = true        
        case .s:
            key = .s
        case .t:
            key = .t
        case .T:
            key = .t
            shift = true
        case .u:
            key = .u
        case .controlU:
            key = .u
            control = true
        case .v:
            key = .v
        case .V:
            key = .v
            shift = true
        case .w:
            key = .w
        case .W:
            key = .w
            shift = true
        case .x:
            key = .x
        case .X:
            key = .x
            shift = true
        case .y:
            key = .y
        case .Y:
            key = .y
            shift = true
        case .backtick:
            key = .backtick
        case .caret:
            key = .six
            shift = true        
        case .doubleQuote:
            key = .singleQuote
            shift = true
        case .dollarSign:
            key = .four
            shift = true
        case .escape:
            key = .escape
        case .enter:
            key = .enter  
        case .leftBrace:
            key = .leftBracket
            shift = true
        case .leftBracket:
            key = .leftBracket
        case .leftParenthesis:
            key = .nine
            shift = true
        case .rightBrace:
            key = .rightBracket
            shift = true
        case .rightBracket:
            key = .rightBracket
        case .rightChevron:
            key = .dot
            shift = true
        case .rightParenthesis:
            key = .zero
            shift = true
        case .singleQuote:
            key = .singleQuote
        case .underscore:
            key = .minus
            shift = true
        case .zero:
            key = .zero
        }
    }

    private static func vimKeyFrom(key: KeyCode, control: Bool, option: Bool, shift: Bool, command: Bool) -> VimKey? {
        switch key {
        case .a where control == false && option == false && shift == false && command == false:
            return .a
        case .a where control == false && option == false && shift == true && command == false:
            return .A
        case .b where control == false && option == false && shift == false && command == false:
            return .b
        case .b where control == false && option == false && shift == true && command == false:
            return .B
        case .c where control == false && option == false && shift == false && command == false:
            return .c
        case .c where control == false && option == false && shift == true && command == false:
            return .C
        case .d where control == false && option == false && shift == false && command == false:
            return .d
        case .d where control == true && option == false && shift == false && command == false:
            return .controlD
        case .d where control == false && option == false && shift == false && command == true:
            return .commandD
        case .e where control == false && option == false && shift == false && command == false:
            return .e
        case .e where control == false && option == false && shift == true && command == false:
            return .E
        case .f where control == false && option == false && shift == false && command == false:
            return .f
        case .f where control == false && option == false && shift == true && command == false:
            return .F
        case .g where control == false && option == false && shift == false && command == false:
            return .g
        case .g where control == false && option == false && shift == true && command == false:
            return .G
        case .h where control == false && option == false && shift == false && command == false:
            return .h
        case .i where control == false && option == false && shift == false && command == false:
            return .i
        case .i where control == false && option == false && shift == true && command == false:
            return .I
        case .j where control == false && option == false && shift == false && command == false:
            return .j
        case .k where control == false && option == false && shift == false && command == false:
            return .k
        case .l where control == false && option == false && shift == false && command == false:
            return .l
        case .o where control == false && option == false && shift == false && command == false:
            return .o
        case .o where control == false && option == false && shift == true && command == false:
            return .O
        case .p where control == false && option == false && shift == false && command == false:
            return .p
        case .p where control == false && option == false && shift == true && command == false:
            return .P
        case .r where control == false && option == false && shift == false && command == false:
            return .r
        case .r where control == true && option == false && shift == false && command == false:
            return .controlR
        case .s where control == false && option == false && shift == false && command == false:
            return .s
        case .t where control == false && option == false && shift == false && command == false:
            return .t
        case .t where control == false && option == false && shift == true && command == false:
            return .T
        case .u where control == false && option == false && shift == false && command == false:
            return .u
        case .u where control == true && option == false && shift == false && command == false:
            return .controlU
        case .v where control == false && option == false && shift == false && command == false:
            return .v
        case .v where control == false && option == false && shift == true && command == false:
            return .V
        case .w where control == false && option == false && shift == false && command == false:
            return .w
        case .w where control == false && option == false && shift == true && command == false:
            return .W
        case .x where control == false && option == false && shift == false && command == false:
            return .x
        case .x where control == false && option == false && shift == true && command == false:
            return .X
        case .y where control == false && option == false && shift == false && command == false:
            return .y
        case .y where control == false && option == false && shift == true && command == false:
            return .Y
        case .backtick where control == false && option == false && shift == false && command == false:
            return .backtick
        case .dot where control == false && option == false && shift == true && command == false:
            return .rightChevron
        // temporary for escape to enter Command Mode
        // and escape again to send escape key to macOS
        case .escape where control == false && option == false && shift == false && command == false:
            return .escape
        // temporary for pressing enter in Command Mode
        // to act like an enter in Insert Mode
        // checking if it feels better (like in Alfred)
        case .enter where control == false && option == false && shift == false && command == false:
            return .enter
        case .five where control == false && option == false && shift == true && command == false:
            return .percent
        case .four where control == false && option == false && shift == true && command == false:
            return .dollarSign 
        case .leftBracket where control == false && option == false && shift == false && command == false:
            return .leftBracket
        case .leftBracket where control == false && option == false && shift == true && command == false:
            return .leftBrace
        case .minus where control == false && option == false && shift == true && command == false:
            return .underscore
        case .nine where control == false && option == false && shift == true && command == false:
            return .leftParenthesis
        case .rightBracket where control == false && option == false && shift == false && command == false:
            return .rightBracket
        case .rightBracket where control == false && option == false && shift == true && command == false:
            return .rightBrace
        case .singleQuote where control == false && option == false && shift == true && command == false:
            return .doubleQuote
        case .singleQuote where control == false && option == false && shift == false && command == false:
            return .singleQuote
        case .six where control == false && option == false && shift == true && command == false:
            return .caret
        case .zero where control == false && option == false && shift == false && command == false:
            return .zero
        case .zero where control == false && option == false && shift == true && command == false:
            return .rightParenthesis
        default:
            return nil
        }
    }
}

extension KeyCombination: Equatable {
    public static func == (lhs: KeyCombination, rhs: KeyCombination) -> Bool {
        lhs.vimKey == rhs.vimKey
            && lhs.key == rhs.key
            && lhs.command == rhs.command
            && lhs.option == rhs.option
            && lhs.control == rhs.control
            && lhs.shift == rhs.shift
            && lhs.action == rhs.action
    }
}
