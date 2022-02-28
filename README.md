<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>brings Vim moves to macOS input fields. and non input fields. is that everywhere yet?</h1>
</div>

![awesome stuff happening in there](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/gif.gif "hehe")

---

# WHY THAT SHIT

brain space and energy are limited. why learning six hundred thousand new keyboard shortcuts when you can use Vim moves everywhere. also macOS is widely inconsistent like sometimes you can go up and down with ctrl+n/ctrl+p but also sometimes not. even in Apple's own apps. so jk FTW.

and also it's fucking cool.

# LOVED THE GIF?

maybe [watch the videos](https://www.youtube.com/channel/UC3ZP3QFMhNn3ivJgqoEW4Ug) first if you're not sure you wanna read further.

# WHAT APPS DOES THAT SHIT SUPPORT

## native apps with macOS Accessibility support

![Xcode input](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Xcode-input.gif "Xcode input")

## native apps without macOS Accessibility support

![Mail input](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Mail-input.gif "Mail input")

## restricted apps with some macOS Accessibility support

![Safari input](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Safari-input.gif "Safari input")

## Electron apps with (kinda) proper macOS Accessibility support

![Logseq input](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Logseq-input.gif "Logseq input")

## Electron apps with bad bad bad macOS Accessibility support

![ClickUp input](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/ClickUp-input.gif "ClickUp input")

## UI Elements

![Xcode UI1](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Xcode-UI1.gif "Xcode UI1")
![Xcode UI2](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Xcode-UI2.gif "Xcode UI2")
![Mail UI](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Mail-UI.gif "Mail UI")
![Alfred UI](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Alfred-UI.gif "Alfred UI")
![Help Menu UI](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/Help-Menu-UI.gif "Help Menu UI")

# HOW DOES THAT SHIT WORK

because the goal of kV is to bring Vim moves in **any** situation under macOS, it cannot use an already-existing Vim backend (that would have been way easier 😅️😭️). hence, every single move is handcrafted to work in the following conditions:
* text is programmatically [readable and writable](#native-apps-with-macos-accessibility-support). in this condition kV does [text manipulation](#kV-accessibility-strategy). in theory we can have the full Vim experience. in practice there are MANY moves so some may currently be missing. feel free to [request](#feedback-%EF%B8%8F) the ones you need.
* text is programmatically [not readable](#native-apps-without-macOS-accessibility-support). in this condition kV achieves a Vim move through [key remapping](#kv-keyboard-strategy). it's not as precise as text manipulation.
* text is programmatically [readable but not writable](#restricted-apps-with-some-macOS-accessibility-support). in this condition kV uses a mix of text manipulation and key remapping. full Vim experience possible.
* text is part of an Electron app that returns [correct text data](#electron-apps-with-kinda-proper-macOS-accessibility-support), or [not](#electron-apps-with-bad-bad-bad-macOS-accessibility-support). in these conditions kV uses altered versions of the text manipulation and key remapping engines.
* [input is not text](#ui-elements). in this condition kV uses another type of key remapping, specific to UI Elements.

this whole mess allows for that awesome UX:

e.g. `/the`:

* input is text readable

![input text readable](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/search-AS.gif "input text readable")

* input is text not readable

![input text not readable](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/search-KSTE.gif "input text not readable")

* input is not text

![input not text](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/search-KSNTE.gif "input not text")

straight from your Vim brain to the underlying macOS. kV takes care of the mess in the middle.

# HOW 'BOUT THE MONEY SHIT

you can use kindaVim fully for USD$0 a lifetime, but everyday from 5am to 1pm (Winter Schedule) it'll need its 8 hours of sleep. if you wanna torture kV 24/7, you'll need to get him a [good cup of ☕️ a month](https://subscribe.kindavim.app) (USD$3.69). 

P.S.: if you're happy with the state of the old betas you can always download them on GitHub. they don't need coffee. last one is [1b25](https://github.com/godbout/kindaVim.theapp/releases/tag/1b.25).

other P.S.: the number of Awesome Humans currently subscribed is updated daily on [kindaVim.app](https://kindavim.app) 😀️

# CURRENT VIM IMPLEMENTATION

## Motions

### kV Accessibility Strategy

| Normal Mode | including count | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | including count |
| :---:       | :---:           | :---:                                | :---:       | :---:           |
| `_`         | ❌️              |                                      | `_`         | ❌️              |
| `,`         |  ✅️             |                                      | `,`         | ✅️              |
| `;`         |  ✅️             |                                      | `;`         | ✅️              |
| `?`         |  ✅️             |                                      | `^`         |                 |
| `?<CR>`     |  ✅️             |                                      | `+`         | ✅️️              |
| `[(`        | ❌️              |                                      | `$`         | ❌️              |
| `[(`        | ❌️              |                                      | `~`         |                 |
| `[{`        | ❌️              |                                      | `0`         |                 |
| `])`        | ❌️              |                                      | `B`          | ❌️             |
| `]}`        | ❌️              |                                      | `<BS>`       | ❌️             |
| `{`        | ❌️               |                                      | `b`          | ❌️             |
| `}`        | ❌️               |                                      | `C`          |                |
| `/`        | ✅️               |                                      | `<CR>`       | ✅️️             |
| `/<CR>`    | ✅️               |                                      | `CTRL-H`     | ❌️             |
| `%`        |                  |                                      | `CTRL-J`     | ✅️️             |
| `^`        |                  |                                      | `CTRL-M`     | ✅️️             |
| `<<`        | ❌️              |                                      | `CTRL-N`     | ✅️️             |
| `>>`        | ❌️              |                                      | `CTRL-P`     | ✅️️             |
| `~`        | ✅️               |                                      | `c`          |                |
| `$`        | ❌️               |                                      | `D`          |                |
| `0`        |                  |                                      | `<Down>`     | ✅️️             | 
| `A`        | ️❌️               |                                      | `d`          |                |
| `a`        | ❌️               |                                      | `E`          | ❌️             |
| `B`        | ✅️️               |                                      | `e`          | ❌️             |
| `<BS>`     | ✅️️               |                                      | `F`          | ✅️             |
| `b`        | ✅️️               |                                      | `f`          | ✅️             |
| `C`        | ❌️              |                                       | `G`          | ❌️             |
| `<CR>`     | ✅️               |                                      | `g^`          |               | 
| `CTRL-H`   | ✅️️               |                                      | `g$`          | ❌️            | 
| `CTRL-R`   | ❌️               |                                      | `g<Down>`     | ✅️️            | 
| `c$`       | ❌️              |                                       | `g0`          |               |
| `caW`      | ❌️              |                                       | `gE`          | ❌️            |
| `caw`      | ❌️              |                                       | `ge`          | ❌️            |
| `cB`      | ✅️️               |                                       | `gg`          | ❌️            |
| `cb`      | ✅️️               |                                       | `gI`          |               |
| `cc`      | ❌️               |                                       | `gj`          | ❌️            |
| `cE`      | ✅️️               |                                       | `gk`          | ❌️            |
| `ce`      | ✅️️               |                                       | `g<Up>`      | ✅️️             |
| `cF`      | ✅️               |                                       | `h`          | ❌️              |
| `cf`      | ✅️               |                                       | `iW`          | ❌️              |
| `cG`      | ❌️               |                                       | `iw`          | ❌️              |
| `cgg`      | ❌️              |                                       | `j`          | ❌️              |
| `ci'`      | ❌️              |                                       | `k`          | ❌️              |
| `ci"`      | ❌️              |                                       | `<Left>`     | ❌️              |
| `ci(`      | ❌️              |                                       | `l`          | ❌️              |
| `ci)`      | ❌️              |                                       | `o`          |                 |
| `ci[`      | ❌️              |                                       | `R`          |                 |
| `ci]`      | ❌️              |                                       | `<Right>`    | ✅️️              |
| `ci{`      | ❌️              |                                       | `S`          |                 |
| `ci}`      | ❌️              |                                       | `<Space>`    | ✅️️              |
| <code>ci`</code> | ❌️       |                                        | `s`          |                 |
| `ciB`      |   ❌️           |                                        | `T`          | ✅️              |
| `cib`      |   ❌️           |                                        | `t`          | ✅️️              |
| `ciW`      |   ❌️           |                                        | `<Up>`       | ✅️️              | 
| `ciw`      |  ❌️            |                                        | `V`          | ❌️              |
| `cl`       | ❌️             |                                        | `v`          | ❌️              |
| `cT`       | ✅️                                                      | `W`          | ❌️              |
| `ct`       | ✅️                                                      | `w`          | ❌️              |
| `cW`       | ❌️                                                      | `X`          |                 |
| `cw`       | ❌️                                                      | `x`          |                 |
| `D`       | ❌️                                                       | `Y`          |                 |
| `d$`      | ❌️                                                       | `y`          |                 |   
| `daW`     | ❌️            
| `daw`     | ❌️            
| `dB`     | ✅️️             
| `db`     | ✅️️             
| `dd`     | ❌️             
| `dE`     | ✅️️             
| `de`     | ✅️️             
| `dF`     | ✅️             
| `df`     | ✅️             
| `dG`     | ❌️             
| `dgg`     | ❌️            
| `dh`     | ❌️             
| `diW`     | ❌️            
| `diw`     | ❌️            
| `dj`     | ❌️             
| `dk`     | ❌️             
| `dl`     | ❌️             
| `dT`     | ✅️             
| `dt`     | ✅️             
| `dW`     | ✅️             
| `dw`     | ✅️             
| `E`     | ✅️️                 
| `e`     | ✅️️                 
| `F`     | ✅️                 
| `f`     | ✅️                 
| `G`     | ✅️                 
| `g_`     | ❌️     
| `g^`     | 
| `g$`     | ❌️                 
| `g0`     |                  
| `gE`     | ✅️️                 
| `ge`     | ✅️️                 
| `gg`     | ✅️                 
| `gI`     | ❌️              
| `gj`     | ✅️               
| `gk`     | ✅️                 
| `g<Up>`  | ✅️                 
| `h`      | ✅️                 
| `I`      | ❌️                 
| `i`      | ❌️               
| `J`      | ❌                 
| `j`      | ✅️                 
| `k`      | ✅️                 
| `<Left>` | ✅️️
| `l`      | ✅️
| `N`      | ✅️               
| `n`      | ✅️               
| `O`      | ❌️                 
| `o`      | ❌️                 
| `P`      | ❌️                 
| `p`      | ❌️                 
| `<Right>`| ✅️                 
| `r`      | ✅️                 
| `S`      | ❌️                  
| `<Space>`| ✅️                 
| `s`      | ❌️                  
| `T`      | ✅️                 
| `t`      | ✅️                 
| `<Up>`   | ✅️                 
| `u`      | ❌️                 
| `W`      | ✅️️                 
| `w`      | ✅️️                 
| `X`      | ❌️                 
| `x`      | ❌️                  
| `yF`     | ✅️                 
| `yf`     | ✅️                 
| `yi'`     | ❌️                 
| `yi"`    | ❌️                 
| `yi(`     | ❌️                 
| `yi)`     | ❌️                 
| `yi[`     | ❌️                 
| `yi]`     | ❌️                 
| `yi{`     | ❌️                 
| `yi}`     | ❌️                 
|  <code>yi`</code> | ❌️ | 
| `yiw` | ❌️ | 
| `yT` | ✅️ | 
| `yt` | ✅️ | 
| `yy` | ❌️ | 

### kV Keyboard Strategy

| Normal Mode | including count | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | including count | 
| :---:       | :---:           | :---:                                | :---:       |     :---:       | 
| `_`         | ❌️              |                                      | `_`         | ❌️              |
| `?`         | ❌️              |                                      | `^`         |                 |
| `?<CR>`     | ❌️              |                                      | `+`         | ✅️              |
| `/`         | ❌️              |                                      | `$`         | ❌️              |
| `/<CR>`     | ❌️              |                                      | `0`         |                 |
| `^`         |                 |                                      | `<BS>`      | ✅              |
| `+`         | ✅️️              |                                      | `b`         | ✅️️              |
| `$`         | ❌️              |                                      | `C`         |                 |
| `0`         |                 |                                      | `<CR>`      | ✅️              | 
| `A`         | ❌️              |                                      | `CTRL-H`    | ✅              |
| `a`         | ❌️              |                                      | `CTRL-J`    | ✅️              |
| `<BS>`      | ✅️️              |                                      | `CTRL-M`    | ✅️              |
| `b`         | ✅️️              |                                      | `CTRL-N`    | ✅️              |
| `C`         | ❌️              |                                      | `CTRL-P`    | ✅️              |
| `<CR>`      | ✅️              |                                      | `c`         |                 |
| `CTRL-B`    | ❌️              |                                      | `D`         |                 |
| `CTRL-D`    | ❌️              |                                      | `<Down>`    | ✅️              |
| `CTRL-F`    | ❌️              |                                      | `d`         |                 | 
| `CTRL-H`    | ✅️️              |                                      | `e`          | ✅️️              |
| `CTRL-J`    | ✅️️              |                                      | `G`          | ❌️              |
| `CTRL-M`    | ✅️️              |                                      | `g^`          |                 |
| `CTRL-N`    | ✅️️              |                                      | `g$`          | ❌️              |
| `CTRL-P`    | ✅️️              |                                      | `g0`          |                 |
| `CTRL-R`    | ❌️              |                                      | `g<Down>`     | ✅️              |
| `CTRL-U`    | ❌️              |                                      | `ge`          | ✅️️              |
| `c$`        | ❌️              |                                      | `gg`          | ❌️              |
| `cb`        | ✅️️              |                                      | `gI`          |                | 
| `cc`        | ❌️              |                                      | `gj`          | ✅️              | 
| `ce`        | ✅️️              |                                      | `gk`          | ✅️              |
| `cG`        | ❌️              |                                      | `g<Up>`       | ✅️ 
| `cgg`        | ❌️             |                                      | `h`           | ✅️              |                                    
| `ch`         | ✅️️             |                                      | `iw`          | ❌️              |
| `ciw`        | ❌️             |                                      | `j`           | ✅️              |                                    
| `cl`         | ✅️️             |                                      | `k`           | ✅️              |
| `cw`        | ✅️️              |                                      | `<Left>`      | ✅              |
| `D`        | ❌️               |                                      | `l`           | ✅️              |
| `<Down>`      | ✅️️            |                                      | `R`           | ❌️              | 
| `d$`       | ❌️               |                                      | `<Right>`     | ✅️
| `db`        | ✅️️              |                                      | `S`           | ❌️              |  
| `dd`        | ❌️              |                                      | `<Space>`     | ✅️
| `de`        | ✅️️              |                                      | `s`           | ❌️              |     
| `dG`        | ❌️              |                                      | `<Up>`        | ✅️ 
| `dgg`       | ❌️              |                                      | `V`           | ❌️              |
| `dh`       | ✅️️               |                                      | `v`           | ❌️              |
| `diw`       | ❌️              |                                      | `w`           | ✅️️              |
| `dj`       | ❌️               |                                      | `X`           |                 | 
| `dk`       | ❌️               |                                      | `x`           |                 | 
| `dl`       | ✅️️               |                                      | `Y`           |                 |  
| `dw`       | ❌️               |                                      | `y`           |                 |
| `e`        | ✅️️               |                                      
| `G`        | ❌️               |                                      
| `g_`        | ❌️              |                                      
| `g^`        |                 |                                      
| `g$`        | ❌️              |                                      
| `g0`        |                 |                                      
| `g<Down>`   | ✅️              |
| `ge`        | ✅️️              |
| `gg`        | ❌️              |
| `gI`        | ❌️              |
| `gj`        | ✅️              |
| `gk`        | ✅️              |
| `g<Up>`     | ✅️              |
| `h`         | ✅️              |
| `i`         | ❌️              |
| `J`         | ❌️              |
| `j`         | ✅              |
| `k`         | ✅              |
| `<Left>`    | ✅              |
| `l`         | ✅              |
| `N`         | ✅️              |
| `n`         | ✅️              |
| `O`         | ❌️              |
| `o`         | ❌️              |
| `P`         | ❌️              |
| `p`         | ❌️              |
| `<Right>`   | ✅️️              |
| `r`         | ❌️              |
| `S`         | ❌️              | ️
| `<Space>`   | ✅️️              |
| `s`         | ✅️️              |
| `<Up>`      | ✅️️              |
| `u`         | ❌️              |
| `w`         | ✅️️              |
| `X`         | ✅️️              |
| `x`         | ✅️️              |
| `yiw`       | ❌️              |
| `yy`       | ❌️               |

### Commands

| Command |
| :---:   |
| `:q`       
| `:q!`
| `:w`         
| `:wq`        
| `:x`
| `ZZ`

# SHIT, DID YOU KNOW?

![bye bye caps lock](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/did-you-know.png "haha")

# ROADMAP SHIT
* add a plethora of missing Vim moves ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* update all moves to support new global count system ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* users' requests

# FEEDBACK 💩️

* whether you need a missing move, want to report a bug or ask for a feature, just [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new).

# TESTS SHIT AND OPEN SOURCE SHIT

the [tests](https://github.com/godbout/AccessibilityStrategyTestApp) describing the Vim moves are open source. you can use those to build your own implementation, or if you just want to learn more about Vim moves, or if you just can't get enough good self-induced migraines.

# ACKNOWLEDGMENTS, THANKS, AND KISSES

* [Takayama Fumihiko](https://github.com/tekezo) for [Karabiner-Elements](https://karabiner-elements.pqrs.org), my first experience of Vim moves on macOS. great option if you need lots of customizations
* [David Balatero](https://github.com/dbalatero) for [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon), showing there's a way to make that shit work. great option if you're looking for free/open source
* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches
* [Sparkle](https://sparkle-project.org) for the Sofware Updater. this is good shit
* [Clipy](https://github.com/Clipy) for [Sauce](https://github.com/Clipy/Sauce), a magnificent Swift package to handle Keyboard Layouts headaches shits
