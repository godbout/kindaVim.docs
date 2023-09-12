<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>kindaVim brings Vim moves to macOS Input Fields and UI Elements.</h1>
</div>

![awesome stuff happening in there](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/gif.gif "hehe")

---

# The Site

[kindavim.app](https://kindavim.app) for all the fancy stuff.

# Why kindaVim

Because Vim moves anywhere is fucking cool.
And also kV makes using the keyboard more consistent on the whole macOS, where sometimes CTRL-P/CTRL-N go up/down lists, but sometimes it doesn't.
Thanks Apple.

# License

Unlimited trial.
The trial is: without a coffee a month kindaVim sleeps in the mornings. (It will scold you from the Menu Bar when you'll try to use it.)
You're still able to use it fully-featured the afternoons. (Until 5am the next day. Those are long afternoons, yes.)
So if you're like me and spend your mornings reading, swimming in the open sea or climbing rocks, then kV is basically free.

# Current Vim Implementation

> **Note**  
> If you find that you're missing a motion, command, a count support, or a repeat, just make a [request](https://github.com/godbout/kindaVim.docs/issues/139).

## Motions

> **Note**  
> For motions that accept regexes, kV uses the [ICU Regular Expressions](https://unicode-org.github.io/icu/userguide/strings/regexp.html) (Perl) rather than Vim's own flavor ones.

### kV Accessibility Strategy: text manipulation; accurate.

[See the motions implemented.](https://github.com/godbout/kindaVim.theapp/blob/master/AccessibilityStrategyImplementation.md#accessibility-strategy)

### kV Keyboard Strategy: keyboard remapping; less accurate.

[See the motions implemented.](https://github.com/godbout/kindaVim.theapp/blob/master/KeyboardStrategyImplementation.md#keyboard-strategy)

## Commands

[See the commands implementation.](https://github.com/godbout/kindaVim.theapp/blob/master/CommandsImplementation.md#commands)

## Missing something?

Make a [request](https://github.com/godbout/kindaVim.docs/issues/139).

# APIs

kindaVim sends [Distributed Notifications](https://developer.apple.com/documentation/foundation/distributednotificationcenter) to macOS when the Vim Mode changes, so that you can hook an external tool like [BetterTouchTool](https://www.google.com/search?q=bettertouchtool) or [Hammerspoon](https://www.hammerspoon.org) and respond to those changes.
The Notifications Names should be self-explanatory:
* kindaVimDidEnterInsertMode
* kindaVimDidExitInsertMode
* kindaVimDidEnterNormalMode
* kindaVimDidExitNormalMode
* kindaVimDidEnterVisualMode
* kindaVimDidExitVisualMode

# Sync your Preferences

Currently the Preferences are a plist file located at `~/Library/Preferences/mo.com.sleeplessmind.kindaVim.plist`.
You can add it to your [dotfiles](https://dotfiles.github.io), or use a tool like [Mackup](https://github.com/lra/mackup) to keep the Preferences in sync between your computers. (Mackup explicitely supports kindaVim.) 

# Feedback

* whether you need a missing move, want to report a bug or ask for a feature, just [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new).

# AccessibilityStrategyTestApp

Testing the Vim moves when using the macOS Accessibility requires building an external app. This app, as well as the tests of each move in the context of the Accessibility Strategy, are open source and available here: [AccessibilityStrategyTestApp](https://github.com/godbout/AccessibilityStrategyTestApp)

# Alternatives

* [Karabiner-Elements](https://karabiner-elements.pqrs.org) (open source, free)
* [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon) (open source, free)
* [SketchyVim](https://github.com/FelixKratz/SketchyVim) (open source, free)
* [ti-vim](https://vim.tonisives.com) (closed source, one time purchase)
* [ShadowVim](https://github.com/mickael-menu/ShadowVim) (open source, free, for Xcode)

# Roadmap

* adding new motions
* adding new apps to The Wizard

# Acknowledgments

* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches
* [Sparkle](https://sparkle-project.org) for the Sofware Updater. this is great shit.
* [Clipy](https://github.com/Clipy) for [Sauce](https://github.com/Clipy/Sauce), a magnificent Swift package to handle Keyboard Layouts headaches
