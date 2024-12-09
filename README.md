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

### kV's Accessibility Strategy: text manipulation; accurate.

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                                        | count | repeat | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode                                                    | count | repeat |
| ---:                                                               | :---: | :---:  | :---:                                            | ---:                                                           | :---: |  :---: |
| [`_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#_)                                                          | ✅️    |        |                                                  | [`_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#_)                                                      | ✅️️    |
| [`-`](https://vimdoc.sourceforge.net/htmldoc/motion.html#-)                                                          | ✅️    |        |                                                  | [`,`](https://vimdoc.sourceforge.net/htmldoc/motion.html#,)                                                      | ✅️    |
| [`,`](https://vimdoc.sourceforge.net/htmldoc/motion.html#,)                                                          | ✅️    |        |                                                  | [`;`](https://vimdoc.sourceforge.net/htmldoc/motion.html#;)                                                      | ✅️    |
| [`;`](https://vimdoc.sourceforge.net/htmldoc/motion.html#;)                                                          | ✅️    |        |                                                  | [`(`](https://vimdoc.sourceforge.net/htmldoc/motion.html#\()                                                      | ❌️    |
| [`?`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#?)                                                          | ✅️    |        |                                                  | [`)`](https://vimdoc.sourceforge.net/htmldoc/motion.html#\))                                                      | ❌️    |
| [`?<CR>`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#?%3CCR%3E)                                                      | ✅️    |        |                                                  | [`{`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%7B)                                                      | ❌️    |
| [`(`](https://vimdoc.sourceforge.net/htmldoc/motion.html#\()                                                          | ❌️    |        |                                                  | [`}`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%7D)                                                      | ❌️    |
| [`)`](https://vimdoc.sourceforge.net/htmldoc/motion.html#\))                                                          | ❌    |        |                                                  | [`^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5E)                                                      |       |
| [`[(`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5B\()                                                         | ❌️    |        |                                                  | [`+`](https://vimdoc.sourceforge.net/htmldoc/motion.html#+), [`<CR>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CCR%3E), [`CTRL-M`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-M), [`<Enter>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEnter%3E)       | ✅️    |
| [`[{`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5B%7B)                                                         | ❌️    |        |                                                  | [`<`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3C)                                                      | ✅️    | ❌
| [`])`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5D\))                                                         | ❌️    |        |                                                  | [`>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3E)                                                      | ✅️    | ❌
| [`]}`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5D%7D)                                                         | ❌️    |        |                                                  | [`$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#$), [`<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CEnd%3E)                                       | ✅️️    |
| [`{`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%7B)                                                          | ❌️    |        |                                                  | [`~`](https://vimdoc.sourceforge.net/htmldoc/change.html#~)                                                      |       | ❌
| [`}`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%7D)                                                          | ❌️    |        |                                                  | [`0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#0)                                                      |       |
| [`/`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#/)                                                          | ✅️    |        |                                                  | [`a'`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a')                                                     | ❌️    |
| [`/<CR>`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#/%3CCR%3E)                                                      | ✅️    |        |                                                  | `a"`                                                           | ❌️    |
| [`%`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%25)                                                          |       |        |                                                  | [`a[`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%5B), [`a]`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%5D)                                         | ❌️    |
| [`^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5E)                                                          |       |        |                                                  | [`a<`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%3C), [`a>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%3E)                                         | ❌️    |
| [`+`](https://vimdoc.sourceforge.net/htmldoc/motion.html#+), [`<CR>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CCR%3E), [`<CTRL-M>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-M), [`<Enter>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEnter%3E)         | ✅️️    |        |                                                  | [<code>a`</code>](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%60)                                          | ❌️    |
| [`<<`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3C%3C)                                                         | ✅️️    | ✅️️     |                                                  | [`aB`](https://vimdoc.sourceforge.net/htmldoc/motion.html#aB), [`a{`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%7B), [`a}`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a%7D)                             | ❌️    |
| [`>>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3E%3E)                                                         | ✅️️    | ✅️️     |                                                  | [`ab`](https://vimdoc.sourceforge.net/htmldoc/motion.html#ab), [`a(`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a\)), [`a)`](https://vimdoc.sourceforge.net/htmldoc/motion.html#a\))                             | ❌️    |
| [`~`](https://vimdoc.sourceforge.net/htmldoc/change.html#~)                                                          | ✅️    |        |                                                  | [`ap`](https://vimdoc.sourceforge.net/htmldoc/motion.html#ap)                                                     | ❌️    |
| [`$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#$), [`<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CEnd%3E)                                           | ✅️    |        |                                                  | [`B`](https://vimdoc.sourceforge.net/htmldoc/motion.html#B), [`<C-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CC-Left%3E)                                    | ✅️    |
| [`0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#0)                                                          |       |        |                                                  | [`b`](https://vimdoc.sourceforge.net/htmldoc/motion.html#b), [`<S-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Left%3E)                                    | ✅️    |
| [`A`](https://vimdoc.sourceforge.net/htmldoc/insert.html#A)                                                          | ❌️    | ❌️     |                                                  | [`C`](https://vimdoc.sourceforge.net/htmldoc/change.html#C)                                                      |       | ❌
| [`a`](https://vimdoc.sourceforge.net/htmldoc/insert.html#a)                                                          | ❌️    | ❌     |                                                  | `CTRL-[`, [`<Esc>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEsc%3E)                                        |       |
| [`B`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CC-Left%3E), [`<C-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CC-Left%3E)                                        | ✅️️    |        |                                                  | [`c`](https://vimdoc.sourceforge.net/htmldoc/change.html#c), [`s`](https://vimdoc.sourceforge.net/htmldoc/change.html#s)                                           |       | ❌
| [`b`](https://vimdoc.sourceforge.net/htmldoc/motion.html#b), [`<S-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Left%3E)                                        | ✅️️    |        |                                                  | [`D`](https://vimdoc.sourceforge.net/htmldoc/change.html#D)                                                      |       | ❌
| [`C`](https://vimdoc.sourceforge.net/htmldoc/change.html#C), [`c$`](https://vimdoc.sourceforge.net/htmldoc/change.html#C), [`c<End>`](https://vimdoc.sourceforge.net/htmldoc/change.html#C)                              | ❌️    | ❌️     |                                                  | [`d`](https://vimdoc.sourceforge.net/htmldoc/change.html#d), [`<Del>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3CDel%3E), [`x`](https://vimdoc.sourceforge.net/htmldoc/change.html#x)                            |       | ❌
| [`CTRL-B`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-B), [`<PageUp>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CPageUp%3E), [`<S-Up>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CS-Up%3E)                   |       |        |                                                  | [`E`](https://vimdoc.sourceforge.net/htmldoc/motion.html#E)                                                      | ✅️    |
| [`CTRL-D`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-D)                                                     |       |        |                                                  | [`e`](https://vimdoc.sourceforge.net/htmldoc/motion.html#e)                                                      | ✅️    |
| [`CTRL-F`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-F), [`<PageDown>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CPageDown%3E), [`<S-Down>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CS-Down%3E)               |       |        |                                                  | [`F`](https://vimdoc.sourceforge.net/htmldoc/motion.html#F)                                                      | ✅️    |
| [`CTRL-R`](https://vimdoc.sourceforge.net/htmldoc/undo.html#CTRL-R)                                                     | ✅️    |        |                                                  | [`f`](https://vimdoc.sourceforge.net/htmldoc/motion.html#f)                                                      | ✅️    |
| [`CTRL-U`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-U)                                                     |       |        |                                                  | [`G`](https://vimdoc.sourceforge.net/htmldoc/motion.html#G)                                                      | ✅️    |
| `c0`                                                               |       | ❌️     |                                                  | [`g_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g_)                                                     | ✅️    |
| `ca'`                                                              | ❌️    | ❌️     |                                                  | [`g^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%5E)                                                     |       |
| `ca"`                                                              | ❌️    | ❌️     |                                                  | [`g$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g$), [`g<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CEnd%3E)                                     | ✅️️    |
| `ca[`, `ca]`                                                       | ❌️    | ❌️     |                                                  | [`g0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g0), [`g<Home>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CHome%3E)                                    |       |
| `ca<`, `ca>`                                                       | ❌️    | ❌️     |                                                  | `gE`                                                           | ✅️    |
| <code>ca`</code>                                                   | ❌️    | ❌️     |                                                  | `ge`                                                           | ✅️    |
| `caB`, `ca{`, `ca}`                                                | ❌️    | ❌️     |                                                  | `gg`                                                           | ✅️    |
| `cab`, `ca(`, `ca)`                                                | ❌️    | ❌️     |                                                  | `gI`                                                           |       |
| `cap`                                                              | ❌️    | ❌️     |                                                  | `gj`, `g<Down>`                                                | ✅️    |
| `caW`                                                              | ❌️    | ❌️     |                                                  | `gk`, `g<Up>`                                                  | ✅️    |
| `caw`                                                              | ❌️    | ❌️     |                                                  | `gx`                                                           |       |
| `cB`                                                               | ✅️️    | ❌️     |                                                  | `h`, `<BS>`, `CTRL-H`, `<Left>`                                | ✅️    |
| `cb`                                                               | ✅️️    | ❌️     |                                                  | `i'`                                                           | ❌️    |
| [`cc`](https://vimdoc.sourceforge.net/htmldoc/change.html#cc)                                                         | ❌️    | ❌️     |                                                  | `i"`                                                           | ❌️    |
| `cE`                                                               | ✅️️    | ❌️     |                                                  | `i[`, `i]`                                                     | ❌️    |
| `ce`                                                               | ✅️️    | ❌️     |                                                  | `i<`, `i>`                                                     | ❌️    |
| `cF`                                                               | ✅️    | ❌️     |                                                  | <code>i`</code>                                                | ❌️    |
| `cf`                                                               | ✅️    | ❌️     |                                                  | `iB`, `i{`, `i}`                                               | ❌️    |
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`                                | ✅️    | ❌️     |                                                  | `ib`, `i(`, `i)`                                               | ❌️    |
| `cG`                                                               | ❌️    | ❌️     |                                                  | `ip`                                                           | ❌️    |
| `cg$`, `cg<End>`                                                   | ❌️    | ❌️     |                                                  | `iW`                                                           | ❌️    |
| `cg0`, `cg<Home>`                                                  |   ️    | ❌️     |                                                  | `iw`                                                           | ❌️    |
| `cgg`                                                              | ❌️    | ❌️     |                                                  | `j`, `CTRL-J`, `CTRL-N`, `<Down>`                              | ✅️    |
| `ci'`                                                              | ❌️    | ❌️     |                                                  | `k`, `CTRL-P`, `<Up>`                                          | ✅️    |
| `ci"`                                                              | ❌️    | ❌️     |                                                  | `l`, `<Right>`, `<Space>`                                      | ✅️    |
| `ci[`, `ci]`                                                       | ❌️    | ❌️     |                                                  | `o`                                                            |       |  
| `ci<`, `ci>`                                                       | ❌️    | ❌️     |                                                  | `P`                                                            | ❌️    |
| <code>ci`</code>                                                   | ❌️    | ❌️     |                                                  | `p`                                                            | ❌️    |
| `ciB`, `ci{`, `ci}`                                                | ❌️    | ❌️     |                                                  | `R`                                                            |       | ❌
| `cib`, `ci(`, `ci)`                                                | ❌️    | ❌️     |                                                  | `S`                                                            |       | ❌
| `cip`                                                              | ❌️    | ❌️     |                                                  | `T`                                                            | ✅️    |
| `ciW`                                                              | ❌️    | ❌️     |                                                  | `t`                                                            | ✅️️    |   
| `ciw`                                                              | ❌️    | ❌️     |                                                  | `U`                                                            |       | ❌ 
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`                              | ❌️    | ❌️     |                                                  | `u`                                                            |       | ❌
| `ck`, `cCTRL-P`, `c<Up>`                                           | ❌️    | ❌️     |                                                  | `V`                                                            | ❌️    |
| `cT`                                                               | ✅️    | ❌️     |                                                  | `v`                                                            | ❌️    |
| `ct`                                                               | ✅️    | ❌️     |                                                  | `W`, `<C-Right>`                                               | ✅️    |
| `cW`                                                               | ❌️    | ❌️     |                                                  | `w`, `<S-Right>`                                               | ✅️    |
| `cw`                                                               | ❌️    | ❌️     |                                                  | `X`                                                            |       | ❌    
| [`D`](https://vimdoc.sourceforge.net/htmldoc/change.html#D), [`d$`](https://vimdoc.sourceforge.net/htmldoc/change.html#D), [`d<End>`](https://vimdoc.sourceforge.net/htmldoc/change.html#D)                              | ❌️    | ✅️️     |                                                  | `Y`                                                            |       |     
| `d0`                                                               |       | ✅️️     |                                                  | `y`                                                            |       |         
| `da'`                                                              | ❌️    | ✅️️     |
| `da"`                                                              | ❌️    | ✅️️     |
| `da[`, `da]`                                                       | ❌️    | ✅     |
| `da<`, `da>`                                                       | ❌️    | ✅     |
| <code>da`<code>                                                    | ❌️    | ✅️️     |
| `daB`, `da{`, `da}`                                                | ❌️    | ✅     |                                      
| `dab`, `da(`, `da)`                                                | ❌️    | ✅     |                              
| `dap`                                                              | ❌️    | ✅️️     |
| `daW`                                                              | ❌️    | ✅️️     |                              
| `daw`                                                              | ❌️    | ✅️️     |                              
| `dB`                                                               | ✅️️    | ✅️️     |                              
| `db`                                                               | ✅️️    | ✅️️     |                              
| `dd`                                                               | ❌️    | ✅️     |
| `dE`                                                               | ✅️️    | ✅️     |
| `de`                                                               | ✅️️    | ✅️     |
| `dF`                                                               | ✅️    | ✅     |
| `df`                                                               | ✅️    | ✅     |
| `dG`                                                               | ❌️    | ✅️     |
| `dg$`, `dg<End>`                                                   | ❌️    | ✅️     |
| `dg0`, `dg<Home>`                                                  |       | ✅️     |
| `dgg`                                                              | ❌️    | ✅️     |
| `di'`                                                              | ❌️    | ✅️     |
| `di"`                                                              | ❌️    | ✅️     |
| `di[`, `di]`                                                       | ❌️    | ✅️     |                                      
| `di<`, `di>`                                                       | ❌️    | ✅️     |                                      
| <code>di`</code>                                                   | ❌️    | ✅️     |                                      
| `diB`, `di{`, `di}`                                                | ❌️    | ✅️     |                                      
| `dib`, `di(`, `di)`                                                | ❌️    | ✅️     |                                      
| `dip`                                                              | ❌️    | ✅️     |
| `diW`                                                              | ❌️    | ✅️     |       
| `diw`                                                              | ❌️    | ✅️     |       
| `dj`, `dCTRL-J`, `dCTRL-N`, `d<Down>`                              | ❌️    | ✅     |        
| `dk`, `dCTRL-P`, `d<Up>`                                           | ❌️    | ✅     |        
| `dT`                                                               | ✅️    | ✅     |        
| `dt`                                                               | ✅️    | ✅     |        
| `dW`                                                               | ✅️    | ✅️     |        
| `dw`                                                               | ✅️    | ✅️     |                 
| [`E`](https://vimdoc.sourceforge.net/htmldoc/motion.html#E)                                                          | ✅️️    |        |                     
| [`e`](https://vimdoc.sourceforge.net/htmldoc/motion.html#e)                                                          | ✅️️    |        |                     
| [`F`](https://vimdoc.sourceforge.net/htmldoc/motion.html#F)                                                          | ✅️    |        |                     
| [`f`](https://vimdoc.sourceforge.net/htmldoc/motion.html#f)                                                          | ✅️    |        |                     
| [`G`](https://vimdoc.sourceforge.net/htmldoc/motion.html#G)                                                          | ✅️    |        |             
| [`g_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g_)                                                         | ✅️    |        |
| [`g^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%5E)                                                         |       |        |
| [`g$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g$), [`g<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CEnd%3E)                                         | ✅️    |        |            
| [`g0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g0), [`g<Home>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CHome%3E)                                        |       |        |          
| [`gE`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gE)                                                         | ✅️️    |        |            
| [`ge`](https://vimdoc.sourceforge.net/htmldoc/motion.html#ge)                                                         | ✅️️    |        |            
| [`gg`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gg)                                                         | ✅️    |        |            
| [`gI`](https://vimdoc.sourceforge.net/htmldoc/insert.html#gI)                                                         | ❌️    |        |         
| [`gj`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gj), [`g<Down>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CDown%3E)                                        | ✅️    |        |          
| [`gk`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gk), [`g<Up>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CUp%3E)                                          | ✅️    |        |            
| [`gm`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gm)                                                         |       |        |
| [`gx`](https://vimdoc.sourceforge.net/htmldoc/pi_netrw.html#netrw-gx)                                                         |       |        |
| [`H`](https://vimdoc.sourceforge.net/htmldoc/motion.html#H)                                                          | ✅️    |        |
| [`h`](https://vimdoc.sourceforge.net/htmldoc/motion.html#h), [`<BS>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CBS%3E), [`CTRL-H`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-H), [`<Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CLeft%3E)           | ✅️    |        |            
| [`I`](https://vimdoc.sourceforge.net/htmldoc/insert.html#I)                                                          | ❌️    | ❌     |    
| [`i`](https://vimdoc.sourceforge.net/htmldoc/insert.html#i)                                                          | ❌️    | ❌     |          
| [`J`](https://vimdoc.sourceforge.net/htmldoc/change.html#J)                                                          | ❌    |        |            
| [`j`](https://vimdoc.sourceforge.net/htmldoc/motion.html#j), [`CTRL-J`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-J), [`CTRL-N`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-N), [`<Down>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CDown%3E)         | ✅️    |        |            
| [`k`](https://vimdoc.sourceforge.net/htmldoc/motion.html#k), [`CTRL-P`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-P), [`<Up>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CUp%3E)                           | ✅️    |        |            
| [`L`](https://vimdoc.sourceforge.net/htmldoc/motion.html#L)                                                          | ✅    |        |
| [`l`](https://vimdoc.sourceforge.net/htmldoc/motion.html#l), [`<Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CRight%3E), [`<Space>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CSpace%3E)                        | ✅️    |        |
| [`M`](https://vimdoc.sourceforge.net/htmldoc/motion.html#M)                                                          |       |        |
| [`N`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#N)                                                          | ✅️    |        |               
| [`n`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#n)                                                          | ✅️    |        |               
| [`O`](https://vimdoc.sourceforge.net/htmldoc/insert.html#O)                                                          | ❌️    | ❌     |                 
| [`o`](https://vimdoc.sourceforge.net/htmldoc/insert.html#o)                                                          | ❌️    | ❌     |                 
| [`P`](https://vimdoc.sourceforge.net/htmldoc/change.html#P)                                                          | ❌️    | ❌     |                 
| [`p`](https://vimdoc.sourceforge.net/htmldoc/change.html#p)                                                          | ❌️    | ❌     |                 
| [`r`](https://vimdoc.sourceforge.net/htmldoc/change.html#r)                                                          | ✅️    | ❌     |                 
| [`S`](http://vimdoc.sourceforge.net/htmldoc/change.html#S)                                                          | ❌️    | ❌     |                  
| [`s`](https://vimdoc.sourceforge.net/htmldoc/change.html#s), [`cl`](https://vimdoc.sourceforge.net/htmldoc/change.html#s), `c<Right>`, `c<Space>`                      | ✅️    | ❌     |                  
| [`T`](https://vimdoc.sourceforge.net/htmldoc/motion.html#T)                                                          | ✅️    |        |                 
| [`t`](https://vimdoc.sourceforge.net/htmldoc/motion.html#t)                                                          | ✅️    |        |                 
| [`u`](https://vimdoc.sourceforge.net/htmldoc/undo.html#u)                                                          | ✅️    | ❌     |                 
| [`W`](http://vimdoc.sourceforge.net/htmldoc/motion.html#W), [`<C-Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CC-Right%3E)                                       | ✅️️    |        |                 
| [`w`](https://vimdoc.sourceforge.net/htmldoc/motion.html#w), [`<S-Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Right%3E)                                       | ✅️️    |        |                 
| [`X`](https://vimdoc.sourceforge.net/htmldoc/change.html#X), [`dh`](https://vimdoc.sourceforge.net/htmldoc/change.html#dh), `d<BS>`, `dCTRL-H`, `d<Left>`               | ✅️    | ✅️     |                 
| [`x`](https://vimdoc.sourceforge.net/htmldoc/change.html#x), [`<Del>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3CDel%3E), [`dl`](https://vimdoc.sourceforge.net/htmldoc/change.html#dl), `d<Right>`, `d<Space>`       | ✅️    | ✅️     |                  
| [`Y`](https://vimdoc.sourceforge.net/htmldoc/change.html#Y)                                                          | ✅️    |        |                  
| `y$`, `y<End>`                                                     | ️❌️    |        |
| `y0`                                                               | ️      |        |
| `ya'`                                                              | ❌️    |        | 
| `ya"`                                                              | ❌️    |        | 
| `ya[`, `ya]`                                                       | ❌️    |        | 
| `ya<`, `ya>`                                                       | ❌️    |        |                 
| <code>ya`</code>                                                   | ❌️    |        |
| `yaB`, `ya{`, `ya}`                                                | ❌️    |        |                 
| `yab`, `ya(`, `ya)`                                                | ❌️    |        |                 
| `yap`                                                              | ❌️    |        |                 
| `yaW`                                                              | ❌️    |        |                 
| `yaw`                                                              | ❌️    |        |                 
| `yF`                                                               | ✅️    |        |                 
| `yf`                                                               | ✅️    |        |                 
| `yg$`, `yg<End>`                                                   | ️️❌️    |        |
| `yg0`, `yg<Home>`                                                  | ️️      |        |
| `yh`, `y<BS>`, `y<Left>`, `yCTRL-H`                                | ❌️    |        |
| `yi'`                                                              | ❌️    |        |
| `yi"`                                                              | ❌️    |        |            
| `yi[`, `yi]`                                                       | ❌️    |        |            
| `yi<`, `yi>`                                                       | ❌️    |        |             
|  <code>yi`</code>                                                  | ❌️    |        |
| `yiB`, `yi{`, `yi}`                                                | ❌️    |        |            
| `yib`, `yi(`, `yi)`                                                | ❌️    |        |            
| `yip`                                                              | ❌️    |        |
| `yiW`                                                              | ❌️    |        |
| `yiw`                                                              | ❌️    |        |
| `yl`, `y<Right>`, `y<Space>`                                       | ❌️    |        |
| `yT`                                                               | ✅️    |        | 
| `yt`                                                               | ✅️    |        |
| [`yy`](https://vimdoc.sourceforge.net/htmldoc/change.html#yy)                                                         | ✅️    |        |
| [`z-`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#z-)                                                         | ❌️    |        |                
| [`z.`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#z.)                                                         | ❌️    |        |                
| [`zb`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#zb)                                                         | ❌️    |        |                
| [`z<CR>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#z%3CCR%3E)                                                      | ❌️    |        |                
| [`zt`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#zt)                                                         | ❌️    |        |                
| [`zz`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#zz)                                                         | ❌️    |        |                

### kV's Keyboard Strategy: keyboard remapping; less accurate.

This is the fallback mode.
If the app you're on doesn't handle the macOS Accessibility properly, then kV will use different sets of key remapping (depending on whether you're on a Text Element, Non Text Element, TextField Element, TextArea Element, etc.) to impersonate a Vim move.
Most of the time the fallback happens automatically, but some apps (usually Electron) falsely advertise their support of the macOS Accessibility, and need the Keyboard Strategy to be manually enforced through the Preferences, Families Pane.

| Normal Mode                                                    | count | repeat | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode                                                    | count | repeat | 
| ---:                                                           | :---: | :---:  | :---:                                            | ---:                                                           | :---: | :---:
| [`_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#_)                                                      | ❌️    |        |                                                  | [`_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#_)                                                      | ❌️    |          
| [`-`](https://vimdoc.sourceforge.net/htmldoc/motion.html#-)                                                      | ✅️️    |        |                                                  | [`^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5E)                                                      |       |          
| [`?`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#?)                                                      | ❌️    |        |                                                  | [`+`](https://vimdoc.sourceforge.net/htmldoc/motion.html#+), [`<CR>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CCR%3E), [`CTRL-M`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-M), [`<Enter>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEnter%3E)       | ✅️    |          
| [`?<CR>`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#?%3CCR%3E)                                                  | ❌️    |        |                                                  | [`$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#$), [`<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CEnd%3E)                                       | ❌️    |          
| [`/`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#/)                                                      | ❌️    |        |                                                  | [`0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#0)                                                      |       |          
| [`/<CR>`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#/%3CCR%3E)                                                  | ❌️    |        |                                                  | [`b`](https://vimdoc.sourceforge.net/htmldoc/motion.html#b), [`<S-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Left%3E)                                    | ✅️️    |          
| [`^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5E)                                                      |       |        |                                                  | [`C`](https://vimdoc.sourceforge.net/htmldoc/change.html#C)                                                      |       |  ❌️
| [`+`](https://vimdoc.sourceforge.net/htmldoc/motion.html#+), [`<CR>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CCR%3E), [`CTRL-M`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-M), [`<Enter>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEnter%3E)       | ✅️️    |        |                                                  | [`CTRL-[`](https://vimdoc.sourceforge.net/htmldoc/cmdline.html#c_CTRL-%5B), [`<Esc>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEsc%3E)                                 |       |
| [`<<`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3C%3C)                                                     | ✅️️    | ✅     |                                                  | [`c`](https://vimdoc.sourceforge.net/htmldoc/change.html#s), [`s`](https://vimdoc.sourceforge.net/htmldoc/change.html#s)                                           |       |  ❌️      
| [`>>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3E%3E)                                                     | ✅️️    | ✅     |                                                  | [`D`](https://vimdoc.sourceforge.net/htmldoc/change.html#D)                                                      |       |  ❌️      
| [`$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#$), [`<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CEnd%3E)                                       | ❌️    |        |                                                  | [`d`](https://vimdoc.sourceforge.net/htmldoc/change.html#d), [`<Del>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3CDel%3E), [`x`](https://vimdoc.sourceforge.net/htmldoc/change.html#x)                            |       |  ❌️      
| [`0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#0)                                                      |       |        |                                                  | [`e`](https://vimdoc.sourceforge.net/htmldoc/motion.html#e)                                                      | ✅️️    |          
| [`A`](https://vimdoc.sourceforge.net/htmldoc/insert.html#A)                                                      | ❌️    | ❌️     |                                                  | [`G`](https://vimdoc.sourceforge.net/htmldoc/motion.html#G)                                                      | ❌️    |         
| [`a`](https://vimdoc.sourceforge.net/htmldoc/insert.html#a)                                                      | ❌️    | ❌️     |                                                  | [`g^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%5E)                                                     |       |         
| [`b`](https://vimdoc.sourceforge.net/htmldoc/motion.html#b), [`<S-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Left%3E)                                    | ✅️️    |        |                                                  | [`g_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g_)                                                     | ❌️    |
| [`C`](https://vimdoc.sourceforge.net/htmldoc/change.html#C), [`c$`](https://vimdoc.sourceforge.net/htmldoc/change.html#C), `c<End>`                                | ❌️    | ❌️     |                                                  | [`g$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g$), [`g<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CEnd%3E)                                     | ❌️    |         
| [`CTRL-B`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-B), [`<PageUp>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CPageUp%3E), [`<S-Up>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CS-Up%3E)               | ❌️    |        |                                                  | [`g0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g0), [`g<Home>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CHome%3E)                                    |       |         
| [`CTRL-D`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-D)                                                 | ❌️    |        |                                                  | [`ge`](https://vimdoc.sourceforge.net/htmldoc/motion.html#ge)                                                     | ✅️️    |         
| [`CTRL-F`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-F), [`<PageDown>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CPageDown%3E), [`<S-Down>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CS-Down%3E)           | ❌️    |        |                                                  | [`gg`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gg)                                                     | ❌️    |         
| [`CTRL-R`](https://vimdoc.sourceforge.net/htmldoc/undo.html#CTRL-R)                                                 | ✅️️    |        |                                                  | [`gI`](https://vimdoc.sourceforge.net/htmldoc/insert.html#gI)                                                     |       | ️
| [`CTRL-U`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-U)                                                 | ❌️    |        |                                                  | [`gj`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gj), [`g<Down>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CDown%3E)                                    | ✅️    |         
| `c0`                                                           |       | ❌️     |                                                  | [`gk`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gk), [`g<Up>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CUp%3E)                                      | ✅️    |         
| `cb`                                                           | ✅️️    | ❌️     |                                                  | [`h`](https://vimdoc.sourceforge.net/htmldoc/motion.html#h), [`<BS>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CBS%3E), [`CTRL-H`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-H), [`<Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CLeft%3E)        | ✅️    |
| [`cc`](https://vimdoc.sourceforge.net/htmldoc/change.html#cc)                                                     | ❌️    | ❌️     |                                                  | [`iw`](https://vimdoc.sourceforge.net/htmldoc/motion.html#iw)                                                     | ❌️    |         
| `ce`                                                           | ✅️️    | ❌️     |                                                  | [`j`](https://vimdoc.sourceforge.net/htmldoc/motion.html#j), [`CTRL-J`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-J), [`CTRL-N`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-N), [`<Down>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CDown%3E)     | ✅️    |         
| `cG`                                                           | ❌️    | ❌️     |                                                  | [`k`](https://vimdoc.sourceforge.net/htmldoc/motion.html#k), [`CTRL-P`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-P), [`<Up>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CUp%3E)                       | ✅️    |         
| `cg$`, `cg<End>`                                               | ❌️    | ❌️     |                                                  | [`l`](https://vimdoc.sourceforge.net/htmldoc/motion.html#l), [`<Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CRight%3E), [`<Space>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CSpace%3E)                   | ✅️    |         
| `cg0`, `cg<Home>`                                              |       | ❌️     |                                                  | [`P`](https://vimdoc.sourceforge.net/htmldoc/change.html#P)                                                      | ❌️    |         
| `cgg`                                                          | ❌️    | ❌️     |                                                  | [`p`](https://vimdoc.sourceforge.net/htmldoc/change.html#p)                                                      | ❌️    |         
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`                            | ✅️️    | ❌️     |                                                  | [`R`](https://vimdoc.sourceforge.net/htmldoc/change.html#R)                                                      | ❌️    | ❌️        
| `ciw`                                                          | ❌️    | ❌️     |                                                  | [`S`](https://vimdoc.sourceforge.net/htmldoc/change.html#S)                                                      | ❌️    | ❌️       
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`                          | ❌️    | ❌️     |                                                  | [`V`](https://vimdoc.sourceforge.net/htmldoc/visual.html#V)                                                      | ❌️    |         
| `ck`, `cCTRL-P`, `c<Up>`                                       | ❌️    | ❌️     |                                                  | [`v`](https://vimdoc.sourceforge.net/htmldoc/visual.html#v)                                                      | ❌️    |         
| `cw`                                                           | ✅️️    | ❌️     |                                                  | [`w`](https://vimdoc.sourceforge.net/htmldoc/motion.html#w), [`<S-Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Right%3E)                                   | ✅️️    |         
| [`D`](https://vimdoc.sourceforge.net/htmldoc/change.html#D), [`d$`](https://vimdoc.sourceforge.net/htmldoc/change.html#D), `d<End>`                                | ❌️    | ✅     |                                                  | [`X`](https://vimdoc.sourceforge.net/htmldoc/change.html#X)                                                      |       | ❌️      
| `d0`                                                           |       | ✅     |                                                  | [`Y`](https://vimdoc.sourceforge.net/htmldoc/change.html#Y)                                                       |       |                                
| `db`                                                           | ✅️️    | ✅     |                                                  | [`y`](https://vimdoc.sourceforge.net/htmldoc/change.html#y)                                                       |       |          
| [`dd`](https://vimdoc.sourceforge.net/htmldoc/change.html#dd)                                                     | ❌️    | ✅     |                                                  
| `de`                                                           | ✅️️    | ✅     |                                      
| `dG`                                                           | ❌️    | ✅     |                                      
| `dg$`, `dg<End>`                                               | ❌️    | ✅     |
| `dg0`, `dg<Home>`                                              |       | ✅     |
| `dgg`                                                          | ❌️    | ✅     |                                      
| `diw`                                                          | ❌️    | ✅     |                                      
| `dj`, `dCTRL-J`, `dCTRL-N`, `d<Down>`                          | ❌️    | ✅     |                                      
| `dk`, `dCTRL-P`, `d<Up>`                                       | ❌️    | ✅     |                                      
| `dw`                                                           | ❌️    | ✅     |                                     
| [`e`](https://vimdoc.sourceforge.net/htmldoc/motion.html#e)                                                      | ✅️️    |        |                                      
| [`G`](https://vimdoc.sourceforge.net/htmldoc/motion.html#G)                                                      | ❌️    |        |                                      
| [`g_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g_)                                                     | ❌️    |        |                                        
| [`g^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%5E)                                                     |       |        |                                      
| [`g$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g$), [`g<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CEnd%3E)                                     | ❌️    |        |                                      
| [`g0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g0), [`g<Home>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CHome%3E)                                    |       |        |                                      
| [`ge`](https://vimdoc.sourceforge.net/htmldoc/motion.html#ge)                                                     | ✅️️    |        |
| [`gg`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gg)                                                     | ❌️    |        |
| [`gI`](https://vimdoc.sourceforge.net/htmldoc/insert.html#gI)                                                     | ❌️    | ❌️     |
| [`gj`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gj), [`g<Down>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CDown%3E)                                    | ✅️    |        |
| [`gk`](https://vimdoc.sourceforge.net/htmldoc/motion.html#gk), [`g<Up>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#g%3CUp%3E)                                      | ✅️    |        |
| [`h`](https://vimdoc.sourceforge.net/htmldoc/motion.html#h), [`<BS>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CBS%3E), [`CTRL-H`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-H), [`<Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CLeft%3E)        | ✅️    |        |
| [`I`](https://vimdoc.sourceforge.net/htmldoc/insert.html#I)                                                      | ❌️    | ❌️     |    
| [`i`](https://vimdoc.sourceforge.net/htmldoc/insert.html#i)                                                      | ❌️    | ❌️     |
| [`J`](https://vimdoc.sourceforge.net/htmldoc/change.html#J)                                                      | ❌️    |        |
| [`j`](https://vimdoc.sourceforge.net/htmldoc/motion.html#j), [`CTRL-J`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-J), [`CTRL-N`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-N), [`<Down>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CDown%3E)     | ✅    |        |
| [`k`](https://vimdoc.sourceforge.net/htmldoc/motion.html#k), [`CTRL-P`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-P), [`<Up>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CUp%3E)                       | ✅    |        |
| [`l`](https://vimdoc.sourceforge.net/htmldoc/motion.html#l), [`<Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CRight%3E), [`<Space>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CSpace%3E)                    | ✅    |        |
| [`N`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#N)                                                      | ✅️    |        |
| [`n`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#n)                                                      | ✅️    |        |
| [`O`](https://vimdoc.sourceforge.net/htmldoc/insert.html#O)                                                      | ❌️    | ❌️     |
| [`o`](https://vimdoc.sourceforge.net/htmldoc/insert.html#o)                                                      | ❌️    | ❌️     |
| [`P`](https://vimdoc.sourceforge.net/htmldoc/change.html#P)                                                      | ❌️    | ❌️     |
| [`p`](https://vimdoc.sourceforge.net/htmldoc/change.html#p)                                                      | ❌️    | ❌️     |
| [`r`](https://vimdoc.sourceforge.net/htmldoc/change.html#r)                                                      | ❌️    | ❌️     |
| [`S`](https://vimdoc.sourceforge.net/htmldoc/change.html#S)                                                      | ❌️    | ❌️     | ️
| [`s`](https://vimdoc.sourceforge.net/htmldoc/change.html#s), [`cl`](https://vimdoc.sourceforge.net/htmldoc/change.html#s), `c<Right>`, `c<Space>`                  | ✅️️    | ❌️     |
| [`u`](https://vimdoc.sourceforge.net/htmldoc/undo.html#u)                                                      | ✅️️    | ❌️     |
| [`w`](https://vimdoc.sourceforge.net/htmldoc/motion.html#w), [`<S-Right>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Right%3E)                                   | ✅️️    |        |
| [`X`](https://vimdoc.sourceforge.net/htmldoc/change.html#X), [`dh`](https://vimdoc.sourceforge.net/htmldoc/change.html#dh), `d<BS>`, `dCTRL-H`, `d<Left>`           | ✅️️    | ✅     |
| [`x`](https://vimdoc.sourceforge.net/htmldoc/change.html#x), [`<Del>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3CDel%3E), [`dl`](https://vimdoc.sourceforge.net/htmldoc/change.html#dl), `d<Right>`, `d<Space>`   | ✅️️    | ✅     |
| [`Y`](https://vimdoc.sourceforge.net/htmldoc/change.html#Y)                                                      | ❌️    |        |
| `y$`, `y<End>`                                                 | ❌️    |        |
| `y0`                                                           |       |        |
| `yg$`, `yg<End>`                                               | ❌️    |        |
| `yg0`, `yg<Home>`                                              |   ️    |        |
| `yh`, `y<BS>`, `y<Left>`, `yCTRL-H`                            | ❌️    |        |
| `yiw`                                                          | ❌️    |        |
| `yl`, `y<Right>`, `y<Space>`                                   | ❌️    |        |
| [`yy`](https://vimdoc.sourceforge.net/htmldoc/change.html#yy)                                                     | ❌️    |        |
| [`zz`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#zz)                                                     | ❌️    |        |

## Commands

| Command          | count |
| :---:            | :---: |
| [`:q`](https://vimdoc.sourceforge.net/htmldoc/editing.html#:q)       |
| [`:q!`](https://vimdoc.sourceforge.net/htmldoc/editing.html#:q)      |
| [`:w`](https://vimdoc.sourceforge.net/htmldoc/editing.html#:w)       |            
| [`:wq`](https://vimdoc.sourceforge.net/htmldoc/editing.html#:wq)      |            
| [`:x`](https://vimdoc.sourceforge.net/htmldoc/editing.html#:x)       |
| [`gT`](https://vimdoc.sourceforge.net/htmldoc/tabpage.html#gT)       | ✅️️
| [`gt`](https://vimdoc.sourceforge.net/htmldoc/tabpage.html#gt)       | ❌️
| [`ZZ`](https://vimdoc.sourceforge.net/htmldoc/editing.html#ZZ)       |

## Missing something?

Make a [request](https://github.com/godbout/kindaVim.docs/issues/139).

# APIs

kindaVim writes the current environment information in a `json` file at `~/Library/Application\ Support/kindaVim/environment.json`.

You can be notified of changes in the file with tools like [watchman](https://github.com/facebook/watchman) and directly read the environment state with tools like [jq](https://github.com/jqlang/jq).
With that information you could for example remap keys differently depending on kindaVim's Mode with tools like [Hammerspoon](https://github.com/Hammerspoon/hammerspoon) or [BetterTouchTool](https://folivora.ai).

# Sync your Preferences

Currently the Preferences are a plist file located at `~/Library/Preferences/mo.com.sleeplessmind.kindaVim.plist`.
You can add it to your [dotfiles](https://dotfiles.github.io), or simply copy paste the file to your new computers.

P.S.: for security reasons Apple is now blocking the use of symlinks for App Preferences since macOS Ventura, so you cannot use anymore tools like [Mackup](https://github.com/lra/mackup) to keep your Preferences synced. You can currently only paste and replace files manually.

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
