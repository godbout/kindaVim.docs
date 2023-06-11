# Accessibility Strategy

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                                        | count | repeat | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode                                 | count | repeat |
| ---:                                                               | :---: | :---:  | :---:                                            | ---:                                        | :---: |  :---: |
| [`_`](https://vimdoc.sourceforge.net/htmldoc/motion.html#_)                                                          | ✅️    |        |                                                  | `_`                                         | ✅️️    |
| [`-`](https://vimdoc.sourceforge.net/htmldoc/motion.html#-)                                                          | ✅️    |        |                                                  | `,`                                         | ✅️    |
| [`,`](https://vimdoc.sourceforge.net/htmldoc/motion.html#,)                                                          | ✅️    |        |                                                  | `;`                                         | ✅️    |
| [`;`](https://vimdoc.sourceforge.net/htmldoc/motion.html#;)                                                          | ✅️    |        |                                                  | `(`                                         | ❌️    |
| [`?`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#?)                                                          | ✅️    |        |                                                  | `)`                                         | ❌️    |
| [`?<CR>`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#?%3CCR%3E)                                                      | ✅️    |        |                                                  | `{`                                         | ❌️    |
| [`(`](https://vimdoc.sourceforge.net/htmldoc/motion.html#\()                                                          | ❌️    |        |                                                  | `}`                                         | ❌️    |
| [`)`](https://vimdoc.sourceforge.net/htmldoc/motion.html#\))                                                          | ❌    |        |                                                  | `^`                                         |       |
| [`[(`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5B\()                                                         | ❌️    |        |                                                  | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️    |
| [`[{`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5B%7B)                                                         | ❌️    |        |                                                  | `<`                                         | ✅️    | ❌
| [`])`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5D\))                                                         | ❌️    |        |                                                  | `>`                                         | ✅️    | ❌
| [`]}`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5D%7D)                                                         | ❌️    |        |                                                  | `$`, `<End>`                                | ✅️️    |
| [`{`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%7B)                                                          | ❌️    |        |                                                  | `~`                                         |       | ❌
| [`}`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%7D)                                                          | ❌️    |        |                                                  | `0`                                         |       |
| [`/`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#/)                                                          | ✅️    |        |                                                  | `a'`                                        | ❌️    |
| [`/<CR>`](https://vimdoc.sourceforge.net/htmldoc/pattern.html#/%3CCR%3E)                                                      | ✅️    |        |                                                  | `a"`                                        | ❌️    |
| [`%`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%25)                                                          |       |        |                                                  | `a[`, `a]`                                  | ❌️    |
| [`^`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%5E)                                                          |       |        |                                                  | `a<`, `a>`                                  | ❌️    |
| [`+`](https://vimdoc.sourceforge.net/htmldoc/motion.html#+), [`<CR>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CCR%3E), [`<CTRL-M>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#CTRL-M), [`<Enter>`](https://vimdoc.sourceforge.net/htmldoc/intro.html#%3CEnter%3E)         | ✅️️    |        |                                                  | <code>a`</code>                             | ❌️    |
| [`<<`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3C%3C)                                                         | ✅️️    | ✅️️     |                                                  | `aB`, `a{`, `a}`                            | ❌️    |
| [`>>`](https://vimdoc.sourceforge.net/htmldoc/change.html#%3E%3E)                                                         | ✅️️    | ✅️️     |                                                  | `ab`, `a(`, `a)`                            | ❌️    |
| [`~`](https://vimdoc.sourceforge.net/htmldoc/change.html#~)                                                          | ✅️    |        |                                                  | `ap`                                        | ❌️    |
| [`$`](https://vimdoc.sourceforge.net/htmldoc/motion.html#$), [`<End>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CEnd%3E)                                           | ✅️    |        |                                                  | `B`, `<C-Left>`                             | ✅️    |
| [`0`](https://vimdoc.sourceforge.net/htmldoc/motion.html#0)                                                          |       |        |                                                  | `b`, `<S-Left>`                             | ✅️    |
| [`A`](https://vimdoc.sourceforge.net/htmldoc/insert.html#A)                                                          | ❌️    | ❌️     |                                                  | `C`                                         |       | ❌
| [`a`](https://vimdoc.sourceforge.net/htmldoc/insert.html#a)                                                          | ❌️    | ❌     |                                                  | `CTRL-[`, `<Esc>`                           |       |
| [`B`](https://vimdoc.sourceforge.net/htmldoc/motion.html#B), [`<C-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CC-Left%3E)                                        | ✅️️    |        |                                                  | `c`, `s`                                    |       | ❌
| [`b`](https://vimdoc.sourceforge.net/htmldoc/motion.html#b), [`<S-Left>`](https://vimdoc.sourceforge.net/htmldoc/motion.html#%3CS-Left%3E)                                        | ✅️️    |        |                                                  | `D`                                         |       | ❌
| [`C`](https://vimdoc.sourceforge.net/htmldoc/change.html#C), [`c$`](https://vimdoc.sourceforge.net/htmldoc/change.html#C), [`c<End>`](https://vimdoc.sourceforge.net/htmldoc/change.html#C)                              | ❌️    | ❌️     |                                                  | `d`, `<Del>`, `x`                           |       | ❌
| [`CTRL-B`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-B), [`<PageUp>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CPageUp%3E), [`<S-Up>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CS-Up%3E)                   |       |        |                                                  | `E`                                         | ✅️    |
| [`CTRL-D`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-D)                                                     |       |        |                                                  | `e`                                         | ✅️    |
| [`CTRL-F`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-F), [`<PageDown>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CPageDown%3E), [`<S-Down>`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#%3CS-Down%3E)               |       |        |                                                  | `F`                                         | ✅️    |
| [`CTRL-R`](https://vimdoc.sourceforge.net/htmldoc/undo.html#CTRL-R)                                                     | ✅️    |        |                                                  | `f`                                         | ✅️    |
| [`CTRL-U`](https://vimdoc.sourceforge.net/htmldoc/scroll.html#CTRL-U)                                                     |       |        |                                                  | `G`                                         | ✅️    |
| `c0`                                                               |       | ❌️     |                                                  | `g_`                                        | ✅️    |
| `ca'`                                                              | ❌️    | ❌️     |                                                  | `g^`                                        |       |
| `ca"`                                                              | ❌️    | ❌️     |                                                  | `g$`, `g<End>`                              | ✅️️    |
| `ca[`, `ca]`                                                       | ❌️    | ❌️     |                                                  | `g0`, `g<Home>`                             |       |
| `ca<`, `ca>`                                                       | ❌️    | ❌️     |                                                  | `gE`                                        | ✅️    |
| <code>ca`</code>                                                   | ❌️    | ❌️     |                                                  | `ge`                                        | ✅️    |
| `caB`, `ca{`, `ca}`                                                | ❌️    | ❌️     |                                                  | `gg`                                        | ✅️    |
| `cab`, `ca(`, `ca)`                                                | ❌️    | ❌️     |                                                  | `gI`                                        |       |
| `cap`                                                              | ❌️    | ❌️     |                                                  | `gj`, `g<Down>`                             | ✅️    |
| `caW`                                                              | ❌️    | ❌️     |                                                  | `gk`, `g<Up>`                               | ✅️    |
| `caw`                                                              | ❌️    | ❌️     |                                                  | `gx`                                        |       |
| `cB`                                                               | ✅️️    | ❌️     |                                                  | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️    |
| `cb`                                                               | ✅️️    | ❌️     |                                                  | `i'`                                        | ❌️    |
| `cc`                                                               | ❌️    | ❌️     |                                                  | `i"`                                        | ❌️    |
| `cE`                                                               | ✅️️    | ❌️     |                                                  | `i[`, `i]`                                  | ❌️    |
| `ce`                                                               | ✅️️    | ❌️     |                                                  | `i<`, `i>`                                  | ❌️    |
| `cF`                                                               | ✅️    | ❌️     |                                                  | <code>i`</code>                             | ❌️    |
| `cf`                                                               | ✅️    | ❌️     |                                                  | `iB`, `i{`, `i}`                            | ❌️    |
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`                                | ✅️    | ❌️     |                                                  | `ib`, `i(`, `i)`                            | ❌️    |
| `cG`                                                               | ❌️    | ❌️     |                                                  | `ip`                                        | ❌️    |
| `cg$`, `cg<End>`                                                   | ❌️    | ❌️     |                                                  | `iW`                                        | ❌️    |
| `cg0`, `cg<Home>`                                                  |   ️    | ❌️     |                                                  | `iw`                                        | ❌️    |
| `cgg`                                                              | ❌️    | ❌️     |                                                  | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️    |
| `ci'`                                                              | ❌️    | ❌️     |                                                  | `k`, `CTRL-P`, `<Up>`                       | ✅️    |
| `ci"`                                                              | ❌️    | ❌️     |                                                  | `l`, `<Right>`, `<Space>`                   | ✅️    |
| `ci[`, `ci]`                                                       | ❌️    | ❌️     |                                                  | `o`                                         |       |  
| `ci<`, `ci>`                                                       | ❌️    | ❌️     |                                                  | `P`                                         | ❌️    |
| <code>ci`</code>                                                   | ❌️    | ❌️     |                                                  | `p`                                         | ❌️    |
| `ciB`, `ci{`, `ci}`                                                | ❌️    | ❌️     |                                                  | `R`                                         |       | ❌
| `cib`, `ci(`, `ci)`                                                | ❌️    | ❌️     |                                                  | `S`                                         |       | ❌
| `cip`                                                              | ❌️    | ❌️     |                                                  | `T`                                         | ✅️    |
| `ciW`                                                              | ❌️    | ❌️     |                                                  | `t`                                         | ✅️️    |   
| `ciw`                                                              | ❌️    | ❌️     |                                                  | `U`                                         |       | ❌ 
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`                              | ❌️    | ❌️     |                                                  | `u`                                         |       | ❌
| `ck`, `cCTRL-P`, `c<Up>`                                           | ❌️    | ❌️     |                                                  | `V`                                         | ❌️    |
| `cT`                                                               | ✅️    | ❌️     |                                                  | `v`                                         | ❌️    |
| `ct`                                                               | ✅️    | ❌️     |                                                  | `W`, `<C-Right>`                            | ✅️    |
| `cW`                                                               | ❌️    | ❌️     |                                                  | `w`, `<S-Right>`                            | ✅️    |
| `cw`                                                               | ❌️    | ❌️     |                                                  | `X`                                         |       | ❌    
| `D`, `d$`, `d<End>`                                                | ❌️    | ✅️️     |                                                  | `Y`                                         |       |     
| `d0`                                                               |       | ✅️️     |                                                  | `y`                                         |       |         
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
| `E`                                                                | ✅️️    |        |                     
| `e`                                                                | ✅️️    |        |                     
| `F`                                                                | ✅️    |        |                     
| `f`                                                                | ✅️    |        |                     
| `G`                                                                | ✅️    |        |             
| `g_`                                                               | ✅️    |        |
| `g^`                                                               |       |        |
| `g$` , `g<End>`                                                    | ✅️    |        |            
| `g0`, `g<Home>`                                                    |       |        |          
| `gE`                                                               | ✅️️    |        |            
| `ge`                                                               | ✅️️    |        |            
| `gg`                                                               | ✅️    |        |            
| `gI`                                                               | ❌️    |        |         
| `gj`, `g<Down>`                                                    | ✅️    |        |          
| `gk`, `g<Up>`                                                      | ✅️    |        |            
| `gx`                                                               |       |        |
| `H`                                                                | ✅️    |        |
| `h`, `<BS>`, `CTRL-H`, `<Left>`                                    | ✅️    |        |            
| `I`                                                                | ❌️    | ❌     |    
| `i`                                                                | ❌️    | ❌     |          
| `J`                                                                | ❌    |        |            
| `j`, `CTRL-J`, `CTRL-N`, `<Down>`                                  | ✅️    |        |            
| `k`, `CTRL-P`, `<Up>`                                              | ✅️    |        |            
| `L`                                                                | ✅    |        |
| `l`, `<Right>`, `<Space>`                                          | ✅️    |        |
| `M`                                                                |       |        |
| `N`                                                                | ✅️    |        |               
| `n`                                                                | ✅️    |        |               
| `O`                                                                | ❌️    | ❌     |                 
| `o`                                                                | ❌️    | ❌     |                 
| `P`                                                                | ❌️    | ❌     |                 
| `p`                                                                | ❌️    | ❌     |                 
| `r`                                                                | ✅️    | ❌     |                 
| `S`                                                                | ❌️    | ❌     |                  
| `s`, `cl`, `c<Right>`, `c<Space>`                                  | ✅️    | ❌     |                  
| `T`                                                                | ✅️    |        |                 
| `t`                                                                | ✅️    |        |                 
| `u`                                                                | ✅️    | ❌     |                 
| `W`, `<C-Right>`                                                   | ✅️️    |        |                 
| `w`, `<S-Right>`                                                   | ✅️️    |        |                 
| `X`, `dh`, `d<BS>`, `dCTRL-H`, `d<Left>`                           | ✅️    | ✅️     |                 
| `x`, `<Del>`, `dl`, `d<Right>`, `d<Space>`                         | ✅️    | ✅️     |                  
| `Y`                                                                | ✅️    |        |                  
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
| `yy`                                                               | ✅️    |        |
| `z-`                                                               | ❌️    |        |                
| `z.`                                                               | ❌️    |        |                
| `zb`                                                               | ❌️    |        |                
| `z<CR>`                                                            | ❌️    |        |                
| `zt`                                                               | ❌️    |        |                
| `zz`                                                               | ❌️    |        |                
                 
