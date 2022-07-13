<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>kindaVim brings Vim moves to macOS Input Fields and UI Elements.</h1>
</div>

![awesome stuff happening in there](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/gif.gif "hehe")

---

# The Site

[kindavim.app](https://kindavim.app) for all the fancy stuff.

# Why kindaVim

Vim moves anywhere? That's fucking cool.
Also kV makes using the keyboard more consistent on the whole macOS, where sometimes CTRL-P/CTRL-N works to go up/down lists, and sometimes it doesn't.
Very annoying.

# License

Unlimited trial.
The trial is: without a coffee a month kindaVim sleeps in the mornings. (It will scold you from the Menu Bar when you'll try to use it.)
You're still able to use it fully-featured the afternoons. (Until 5am the next day. Those are long afternoons, yes.)
So if you're like me and you spend your mornings reading, swimming in the open sea or climbing rocks, then kV is basically free.

# Current Vim Implementation

## Motions

### kV Accessibility Strategy: text manipulation; accurate.

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI.

[See the current implementation.](https://github.com/godbout/kindaVim.theapp/blob/master/AccessibilityStrategyImplementation.md#accessibility-strategy)

### kV Keyboard Strategy: keyboard remapping; less accurate.

[See the current implementation.](https://github.com/godbout/kindaVim.theapp/blob/master/KeyboardStrategyImplementation.md#keyboard-strategy)

## Commands

[See the current implementation.](https://github.com/godbout/kindaVim.theapp/blob/master/CommandsImplementation.md#commands)

# Sync your Preferences

Currently the Preferences are a plist file located at `~/Library/Preferences/mo.com.sleeplessmind.kindaVim.plist`.
You can add this to your [dotfiles](https://dotfiles.github.io), or use a tool like [Mackup](https://github.com/lra/mackup). (Mackup explicitely supports kindaVim.) 

# Feedback

* whether you need a missing move, want to report a bug or ask for a feature, just [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new).

# AccessibilityStrategyTestApp

Testing the Vim moves when using the macOS Accessibility requires building an external app. This app, as well as the tests of each move in the context of the Accessibility Strategy, are open source and available here: [AccessibilityStrategyTestApp](https://github.com/godbout/AccessibilityStrategyTestApp)

# Acknowledgments

* [Takayama Fumihiko](https://github.com/tekezo) for [Karabiner-Elements](https://karabiner-elements.pqrs.org), my first experience of Vim moves on macOS. Great option if you need lots of customizations.
* [David Balatero](https://github.com/dbalatero) for [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon), showing there's a way to make this work. Great option if you're looking for free/open source.
* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches.
* [Sparkle](https://sparkle-project.org) for the Sofware Updater. this is great shit.
* [Clipy](https://github.com/Clipy) for [Sauce](https://github.com/Clipy/Sauce), a magnificent Swift package to handle Keyboard Layouts headaches.
