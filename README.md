<div align="center">
    <img src="https://github.com/godbout/kindaVim.theapp/blob/master/assets/icon.png">
    <h1>brings Vim moves to macOS input fields. and non input fields. is that everywhere yet?</h1>
</div>

![awesome stuff happening in there](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/gif.gif "hehe")

---

# WHY

brain space and energy are limited. why learning six hundred thousand new keyboard shortcuts when you can use Vim moves everywhere. also macOS is widely inconsistent like sometimes you can go up and down with ctrl+n/ctrl+p but also sometimes not. even in Apple's own apps. so jk FTW.

and also it's fucking cool.

# LOVED THE GIF?

maybe [watch the videos](https://www.youtube.com/channel/UC3ZP3QFMhNn3ivJgqoEW4Ug) first if you're not sure you wanna read further.

# HOW DOES IT WORK

by default kindaVim uses the `Auto Family` and tries to read the text of the app focused:

1. if it can read and modify the text, it uses the [kV Accessibility Strategy](#user-content-kv-accessibility-strategy). it's text manipulation. theoritically you can have a full Vim experience. pragmatically some stuff will currently be missing so please [ask](https://github.com/godbout/kindaVim.theapp/issues/new) for what you need!
2. if it can't read the text, it uses the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) and tries to impersonate Vim through keys remapping. it's a little more wonky than the kV Accessibility Strategy.
3. if it's not text, it also uses the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy), remap keys, and if the app uses the default macOS keyboard shortcuts you should just get what you expect (e.g. `G` scrolls to the end of a webpage, reaches the last email of a list, goes to the last item of a dropdown, etc.)

in the `Preferences` you can also:
* ask kindaVim to ignore any app completely
* bypass macOS Accessibility restrictions with the `PG-R` Mode for apps where you can read the text but not modify it. you'll experience this mostly in browsers and some Catalyst apps
* make Electron apps behave
* enforce the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) for the biggest fattest liar Electron apps that they say they're implementing the macOS Accessibility but send back wrong data
* enforce the [kV Keyboard Strategy](#user-content-kv-keyboard-strategy) Text Elements for apps that are even worse than Electron's (not even kidding)

there's now also a [video](https://www.youtube.com/watch?v=3dTNQ-XMDPI) about this.

# WAIT A MINUTE. WHAT DATA DO YOU STEAL???

see [DA FUQ](https://kindavim.app/fuq#what-data-steal).

# HOW 'BOUT THE $$$

you can use kindaVim fully for USD$0 a lifetime, but everyday from 5am to 1pm (Winter Schedule) it'll need its 8 hours of sleep. if you wanna torture kV 24/7, you'll need to get him a [good cup of ☕️ a month](https://subscribe.kindavim.app) (USD$3.69). 

(also see [DA FUQ](https://kindavim.app/fuq#why-sub) for why a sub.)

P.S.: if you're happy with the state of the old betas you can always download them on GitHub. they don't need coffee. last one is [1b25](https://github.com/godbout/kindaVim.theapp/releases/tag/1b.25).

other P.S.: the number of Awesome Humans currently subscribed is updated daily on [kindaVim.app](https://kindavim.app) 😀️

# CURRENT VIM IMPLEMENTATION

## Motions

### kV Accessibility Strategy

| Normal Mode | including count | copies deletion | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | including count | copies deletion 
| :---:       | :---:           |  :---:          | :---:                                | :---:       | :---:           | :---:           
| `_`         | ❌️              |                 |                                      | `_`         | ❌️              |                 
| `,`         |  ✅️             |                 |                                      | `^`         |                 |
| `;`         |  ✅️             |                 |                                      | `$`         | ❌️              |
| `?`         |  ✅️             |                 |                                      | `~`         |                 |
| `[(`        | ❌️              |                 |                                      | `0`         |                 |
| `[(`        | ❌️              |                 |                                      | `B`          | ❌️             |
| `[{`        | ❌️              |                 |                                      | `<BS>`       | ❌️             |
| `])`        | ❌️              |                 |                                      | `b`          | ❌️             |
| `]}`        | ❌️              |                 |                                      | `C`          |                | ✅️️
| `{`        | ❌️               |                 |                                      | `CTRL-H`     | ❌️             |
| `}`        | ❌️               |                 |                                      | `c`          |                | ✅️️
| `/`        | ✅️               |                 |                                      | `D`          |                | ✅️️
| `%`        |                  |                 |                                      | `d`          |                | ✅️️
| `^`        |                  |                 |                                      | `E`          | ❌️             |
| `<<`        | ❌️              |                 |                                      | `e`          | ❌️             |
| `>>`        | ❌️              |                 |                                      | `F`          | ✅️             |
| `~`        | ✅️              |                  |                                      | `f`          | ✅️             |
| `$`        | ❌️              |                  |                                      | `G`          | ❌️             |
| `0`        |                 |                  |                                      | `g^`          |              | 
| `A`        | ️❌️              |                  |                                      | `g$`          | ❌️             | 
| `a`        | ❌️              |                  |                                      | `g0`          |              |
| `B`        | ✅️️              |                  |                                      | `gE`          | ❌️             |
| `<BS>`     | ✅️️              |                  |                                      | `ge`          | ❌️             |
| `b`        | ✅️️              |                  |                                      | `gg`          | ❌️             |
| `C`        | ❌️              | ✅️️               |                                      | `gI`          |               |
| `CTRL-H`   | ✅️️              |                  |                                      | `gj`          | ❌️              |
| `CTRL-R`   | ❌️              |                  |                                      | `gk`          | ❌️              |
| `c$`       | ❌️              | ✅️️               |                                      | `h`          | ❌️              |
| `caW`      | ❌️              |       ✅️️         |                                      | `iW`          | ❌️              |
| `caw`      | ❌️              |        ✅️️        |                                      | `iw`          | ❌️              |
| `cB`      | ✅️️              |        ✅️️         |                                      | `j`          | ❌️              |
| `cb`      | ✅️️              |        ✅️️         |                                      | `k`          | ❌️              |
| `cc`      | ❌️              |        ✅️️         |                                      | `l`          | ❌️              |
| `cE`      | ✅️️              |        ✅️️         |                                      | `<Left>`     | ❌️              | 
| `ce`      | ✅️️              |        ✅️️         |                                      | `o`          |                 |
| `cF`      | ✅️              |        ✅️         |                                      | `R`          |                 |  ✅️️ 
| `cf`      | ✅️              |        ✅️         |                                      | `S`          |                 |  ✅️️ 
| `cG`      | ❌️              |        ✅️️         |                                      | `s`          |                 |  ✅️️ 
| `cgg`      | ❌️              |       ✅️         |                                      | `T`          | ✅️              |
| `ci'`      | ❌️              |       ✅️️         |                                      | `t`          | ✅️️              |
| `ci"`      | ❌️              |       ✅️️         |                                      | `V`          | ❌️              |
| `ci(`      | ❌️              |       ✅️         |                                      | `v`          | ❌️              |
| `ci)`      | ❌️              |       ✅️         |                                      | `W`          | ❌️              |
| `ci[`      | ❌️              |       ✅️         |                                      | `w`          | ❌️              |
| `ci]`      | ❌️              |       ✅️         |                                      | `X`          |                 | ✅️️ 
| `ci{`      | ❌️              |       ✅️        |                                       | `x`          |                 |  ✅️️
| `ci}`      | ❌️              |       ✅️         |                                      | `Y`          |                 |
| <code>ci`</code> | ❌️        |        ✅️️       |                                       | `y`          |                 |
| `ciB`      |   ❌️            | ✅️              |                                       
| `cib`      |   ❌️            | ✅️              |                                       
| `ciW`      |   ❌️            | ✅️️              |                                       
| `ciw`      |  ❌️             | ✅️️              |                                       
| `cl`       | ❌️              | ✅️️              |                                       
| `cT`       | ✅️              | ✅️ 
| `ct`       | ✅️              | ✅️ 
| `cW`       | ❌️              | ✅️️ 
| `cw`       | ❌️              | ✅️️ 
| `D`       | ❌️              | ✅️️
| `d$`      | ❌️               | ✅️️
| `daW`     | ❌️               | ✅️️
| `daw`     | ❌️               | ✅️️
| `dB`     | ✅️️               | ✅️️
| `db`     | ✅️️               | ✅️️
| `dd`     | ❌️               | ✅️️
| `dE`     | ✅️️               | ✅️️
| `de`     | ✅️️               | ✅️️
| `dF`     | ✅️               | ✅️
| `df`     | ✅️               | ✅️
| `dG`     | ❌️               | ✅️️
| `dgg`     | ❌️               | ✅️
| `dh`     | ❌️               | ✅️️
| `diW`     | ❌️               | ✅️️
| `diw`     | ❌️               | ✅️️
| `dj`     | ❌️               | ✅️️
| `dk`     | ❌️               | ✅️️
| `dl`     | ❌️               | ✅️️
| `dT`     | ✅️               | ✅️ 
| `dt`     | ✅️               | ✅️
| `dW`     | ✅️                | ✅️
| `dw`     | ✅️                | ✅️
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
| `gj`     | ❌️                 
| `gk`     | ❌️                 
| `h`      | ✅️                 
| `I`      | ❌️                 
| `i`      | ❌️               
| `J`      | ❌️                 
| `j`      | ❌️                 
| `k`      | ❌️                 
| `l`      | ✅️                 
| `<Left>` | ✅️️
| `O`      | ❌️                 
| `o`      | ❌️                 
| `P`      | ❌️                 
| `p`      | ❌️                 
| `r`      | ✅️                 
| `S`      | ❌️                  | ✅️️  
| `s`      | ❌️                  | ✅️️
| `T`      | ✅️                 
| `t`      | ✅️                 
| `u`      | ❌️                 
| `W`      | ✅️️                 
| `w`      | ✅️️                 
| `X`      | ❌️                  | ✅️️  
| `x`      | ❌️                  | ✅️️
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

| Normal Mode | including count | copies deletion | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | including count | copies deletion
| :---:       | :---:           |  :---:          | :---:                                | :---:       |     :---:       | :---:
| `_`         | ❌️              |                 |                                      | `_`         | ❌️              |
| `^`         |               |                  |                                       | `^`         |                 |
| `$`         | ❌️              |                  |                                     | `$`         | ❌️              |
| `0`         |               |                  |                                       | `0`         |                 |
| `A`         | ❌️              |                  |                                     | `b`         | ❌️              |
| `a`         | ❌️              |                  |                                     | `C`         |                 |  ✅️️
| `<BS>`      | ✅️️              |                  |                                     | `c`         |                 |  ✅️️
| `b`         | ❌️              |                  |                                     | `D`         |                 |  ✅️️
| `C`         | ❌️              |      ✅️️          |                                     | `d`         |                 |  ✅️️
| `CTRL-B`    | ❌️              |                  |                                     | `e`          | ❌️              |
| `CTRL-D`    | ❌️              |                  |                                     | `G`          | ❌️              |
| `CTRL-F`    | ❌️              |                  |                                     | `g^`          |                 |
| `CTRL-H`    | ✅️️              |                  |                                     | `g$`          | ❌️              |
| `CTRL-R`    | ❌️              |                  |                                     | `g0`          |                 |
| `CTRL-U`    | ❌️              |                  |                                     | `ge`          | ❌️              |
| `c$`        | ❌️              |      ✅️️          |                                     | `gg`          | ❌️              |
| `cb`        | ❌️              |      ✅️          |                                     | `gI`          |                | 
| `cc`        | ❌️              |      ✅️️          |                                     | `gj`          | ❌️              | 
| `ce`        | ❌️              |      ✅️️          |                                     | `gk`          | ❌️              |
| `cG`        | ❌️              |      ✅️️          |                                     | `h`           | ✅️              |                                    
| `cgg`        | ❌️              |     ✅️          |                                     | `iw`          | ❌️
| `ciw`        | ❌️              |     ✅️️          |                                     | `j`           | ❌️              |                                    
| `cl`         | ❌️               |   ✅️             |                                   | `k`           | ❌️              |
| `cw`        | ❌️              |      ✅️️           |                                    | `l`           | ✅️              |
| `D`        | ❌️              |       ✅️️           |                                    | `R`           | ❌️              | ✅️ 
| `d$`       | ❌️               |      ✅️            |                                   | `S`           | ❌️              | ✅️ 
| `db`        | ❌️              |      ✅️           |                                    | `s`           | ❌️              | ✅️    
| `dd`        | ❌️              |      ✅️️           |                                    | `V`           | ❌️              |
| `de`        | ❌️              |      ✅️           |                                    | `v`           | ❌️              |
| `dG`        | ❌️              |      ✅️️           |                                    | `w`           | ❌️              |
| `dgg`       | ❌️              |      ✅️           |                                    | `X`           |                 |  ✅️️
| `dh`       | ❌️              |       ✅️️           |                                    | `x`           |                 |  ✅️️
| `diw`       | ❌️              |      ✅️️           |                                    | `Y`           |                 |  
| `dj`       | ❌️              |       ✅️           |                                    | `y`           |                 |
| `dk`       | ❌️              |       ✅️           |                                    
| `dl`       | ❌️              |       ✅️️           |                                    
| `dw`       | ❌️              |       ✅️️           |                                    
| `e`        | ❌️              |                    |                                    
| `G`        | ❌️              |                    |                                    
| `g_`        | ❌️              |
| `g^`        |                 |
| `g$`        | ❌️              |
| `g0`        |                 |
| `ge`        | ❌️              |
| `gg`        | ❌️              |
| `gI`        | ❌️              |
| `gj`        | ❌️              |
| `gk`        | ❌️              |
| `h`         | ✅️              |
| `l`         | ✅️              |
| `i`         | ❌️              |
| `J`         | ❌️              |
| `j`         | ✅              |
| `k`         | ✅              |
| `l`         | ❌️              |
| `<Left>`    | ✅              |
| `O`         | ❌️              |
| `o`         | ❌️              |
| `P`         | ❌️              |
| `p`         | ❌️              |
| `r`         | ❌️              |
| `S`         | ❌️              |       ✅️️
| `s`         | ❌️              |       ✅️
| `u`         | ❌️              |
| `w`         | ❌️              |
| `X`         | ❌️              |✅️️
| `x`         | ❌️              |✅️️
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

# DID YOU KNOW?

![bye bye caps lock](https://raw.githubusercontent.com/godbout/kindaVim.theapp/master/assets/did-you-know.png "haha")

# ROADMAP
* add a plethora of missing Vim moves ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* update all moves to support new global count system ([ask!](https://github.com/godbout/kindaVim.theapp/issues/new))
* exploring the idea of letting non Vim moves pass through and go back to macOS (so that you can run your PH shortcut in Normal Mode)

# KNOWN ISSUES

* issues regarding End User Experience will be reported here: https://github.com/godbout/kindaVim.theapp/issues

kindaVim uses the macOS Accessibility API extensively. it's an old and buggy API. unfortunately there's a lot that we don't control. the API sometimes sends back wrong data. it also requires macOS apps to implement the Accessibility in order to work. so even if i strive to make things consistent as much as possible, it is not always a success. all API bugs are reported to, and talked with Apple. please report if something does not seem to work properly, and i'll see what i can do.

in native apps that implement the macOS Accessibility the experience is consistent and we could basically build a whole Vim. in browsers, Electron apps and other native apps that don't implement the macOS Accessibility results may, well, vary. 😬️

# REQUESTS

* to request a missing move, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)
* to request a feature, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)
* to report a bug, wait. yes, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)
* in case you just want to open an issue though, [open an issue](https://github.com/godbout/kindaVim.theapp/issues/new)

# OPEN SOURCE

the [tests](https://github.com/godbout/AccessibilityStrategyTestApp) describing the Vim moves are open source. you can use those to build your own implementation, or if you just want to learn more about Vim moves, or if you just can't get enough good self-induced migraines.

# ACKNOWLEDGMENTS, THANKS, AND KISSES

* [Takayama Fumihiko](https://github.com/tekezo) for [Karabiner-Elements](https://karabiner-elements.pqrs.org), my first experience of Vim moves on macOS. great option if you need lots of customizations
* [David Balatero](https://github.com/dbalatero) for [VimMode.spoon](https://github.com/dbalatero/VimMode.spoon), showing there's a way to make that shit work. great option if you're looking for free/open source
* [Sindre Sorhus](https://github.com/sindresorhus) for [LaunchAtLogin](https://github.com/sindresorhus/LaunchAtLogin) and [KeyboardShortcuts](https://github.com/sindresorhus/KeyboardShortcuts), that saved me countless of hours of headaches
* [Sparkle](https://sparkle-project.org) for the Sofware Updater. this is good shit
* [Clipy](https://github.com/Clipy) for [Sauce](https://github.com/Clipy/Sauce), a magnificent Swift package to handle Keyboard Layouts headaches shits
