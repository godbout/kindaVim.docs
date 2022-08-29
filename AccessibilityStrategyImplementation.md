# Accessibility Strategy

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                 | count | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | count |
| ---:                                        | :---:           | :---:                                | ---:                                        | :---:       
| `_`                                         | ✅️              |                                      | `_`                                         | ✅️️          
| `,`                                         | ✅️              |                                      | `,`                                         | ✅️          
| `;`                                         | ✅️              |                                      | `;`                                         | ✅️          
| `?`                                         | ✅️              |                                      | `(`                                         | ❌️
| `?<CR>`                                     | ✅️              |                                      | `)`                                         | ❌️
| `(`                                         | ❌️              |                                      | `^`                                         |             
| `)`                                         | ❌              |                                      | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️
| `[(`                                        | ❌️              |                                      | `<`                                         | ✅️
| `[(`                                        | ❌️              |                                      | `>`                                         | ✅️
| `[{`                                        | ❌️              |                                      | `$`, `<End>`                                | ✅️️          
| `])`                                        | ❌️              |                                      | `~`                                         |             
| `]}`                                        | ❌️              |                                      | `0`                                         |             
| `{`                                         | ❌️              |                                      | `a'`                                        | ❌️
| `}`                                         | ❌️              |                                      | `a"`                                        | ❌️
| `/`                                         | ✅️              |                                      | `a[`, `a]`                                  | ❌️
| `/<CR>`                                     | ✅️              |                                      | `a<`, `a>`                                  | ❌️ 
| `%`                                         |                 |                                      | <code>a`</code>                             | ❌️ 
| `^`                                         |                 |                                      | `aB`, `a{`, `a}`                            | ❌️
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | `ab`, `a(`, `a)`                            | ❌️
| `<<`                                        | ✅️️              |                                      | `B`, `<C-Left>`                             | ✅️          
| `>>`                                        | ✅️️              |                                      | `b`, `<S-Left>`                             | ✅️          
| `~`                                         | ✅️              |                                      | `C`                                         |             
| `$`, `<End>`                                | ✅️              |                                      | `c`, `s`                                    |             
| `0`                                         |                 |                                      | `D`                                         |             
| `A`                                         | ❌️              |                                      | `d`, `<Del>`, `x`                           |             
| `a`                                         | ❌️              |                                      | `E`                                         | ✅️          
| `B`, `<C-Left>`                             | ✅️️              |                                      | `e`                                         | ✅️          
| `b`, `<S-Left>`                             | ✅️️              |                                      | `F`                                         | ✅️          
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `f`                                         | ✅️          
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `G`                                         | ✅️          
| `CTRL-D`                                    |                 |                                      | `g_`                                        | ✅️
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `g^`                                        |             
| `CTRL-R`                                    | ✅️              |                                      | `g$`, `g<End>`                              | ✅️️          
| `CTRL-U`                                    |                 |                                      | `g0`, `g<Home>`                             |             
| `c0`                                        |                 |                                      | `gE`                                        | ✅️          
| `ca'`                                       | ❌️              |                                      | `ge`                                        | ✅️          
| `ca"`                                       | ❌️              |                                      | `gg`                                        | ✅️          
| `ca[`, `ca]`                                | ❌️              |                                      | `gI`                                        |             
| `ca<`, `ca>`                                | ❌️              |                                      | `gj`, `g<Down>`                             | ✅️          
| <code>ca`</code>                            | ❌️              |                                      | `gk`, `g<Up>`                               | ✅️          
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `gx`                                        |
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| `caW`                                       | ❌️              |                                      | `i'`                                        | ❌️
| `caw`                                       | ❌️              |                                      | `i"`                                        | ❌️
| `cB`                                        | ✅️️              |                                      | `i[`, `i]`                                  | ❌️
| `cb`                                        | ✅️️              |                                      | `i<`, `i>`                                  | ❌️ 
| `cc`                                        | ❌️              |                                      | <code>i`</code>                             | ❌️ 
| `cE`                                        | ✅️️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `ce`                                        | ✅️️              |                                      | `ib`, `i(`, `i)`                            | ❌️ 
| `cF`                                        | ✅️              |                                      | `ip`                                        | ❌️
| `cf`                                        | ✅️              |                                      | `iW`                                        | ❌️          
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `iw`                                        | ❌️          
| `cG`                                        | ❌️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `cg$`, `cgEnd`                              | ❌️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `cg0`, `cgHome`                             |   ️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `cgg`                                       | ❌️              |                                      | `o`                                         |             
| `ci'`                                       | ❌️              |                                      | `P`                                         | ❌️          
| `ci"`                                       | ❌️              |                                      | `p`                                         | ❌️          
| `ci[`, `ci]`                                | ❌️              |                                      | `R`                                         |             
| `ci<`, `ci>`                                | ❌️              |                                      | `S`                                         |             
| <code>ci`</code>                            | ❌️              |                                      | `T`                                         | ✅️          
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      | `t`                                         | ✅️️          
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      | `u`                                         | 
| `ciW`                                       | ❌️              |                                      | `V`                                         | ❌️          
| `ciw`                                       | ❌️              |                                      | `v`                                         | ❌️          
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️              |                                      | `W`, `<C-Right>`                            | ✅️          
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `cT`                                        | ✅️              |                                      | `X`                                         |             
| `ct`                                        | ✅️              |                                      | `Y`                                         |             
| `cW`                                        | ❌️              |                                      | `y`                                         |                 
| `cw`                                        | ❌️              |                                      
| `D`, `d$`, `dEnd`                           | ❌️              |                                      
| `d0`                                        |                 |                                      
| `da'`                                       | ❌️              |
| `da"`                                       | ❌️              |
| `da[`, `da]`                                | ❌️              |
| `da<`, `da>`                                | ❌️              |
| <code>da`<code>                             | ❌️              |
| `daB`, `da{`, `da}`                         | ❌️              |                                      
| `dab`, `da(`, `da)`                         | ❌️              |                                      
| `daW`                                       | ❌️              |                                      
| `daw`                                       | ❌️              |                                      
| `dB`                                        | ✅️️              |                                      
| `db`                                        | ✅️️              |                                      
| `dd`                                        | ❌️              |
| `dE`                                        | ✅️️             
| `de`                                        | ✅️️             
| `dF`                                        | ✅️             
| `df`                                        | ✅️             
| `dG`                                        | ❌️             
| `dg$`, `dgEnd`                              | ❌️            
| `dg0`, `dgHome`                             |             
| `dgg`                                       | ❌️            
| `di'`                                       | ❌️            
| `di"`                                       | ❌️            
| `di[`, `di]`                                | ❌️              |                                      
| `di<`, `di>`                                | ❌️              |                                      
| <code>di`</code>                            | ❌️              |                                      
| `diB`, `di{`, `di}`                         | ❌️              |                                      
| `dib`, `di(`, `di)`                         | ❌️              |                                      
| `diW`                                       | ❌️            
| `diw`                                       | ❌️            
| `dj`, `dCTRL-J`, `dCTRL-N`, `d<Down>`       | ❌️             
| `dk`, `dCTRL-P`, `d<Up>`                    | ❌️             
| `dT`                                        | ✅️             
| `dt`                                        | ✅️             
| `dW`                                        | ✅️             
| `dw`                                        | ✅️             
| `E`                                         | ✅️️                 
| `e`                                         | ✅️️                 
| `F`                                         | ✅️                 
| `f`                                         | ✅️                 
| `G`                                         | ✅️                 
| `g_`                                        | ✅️     
| `g^`                                        | 
| `g$` , `g<End>`                             | ✅️                 
| `g0`, `g<Home>`                             |                  
| `gE`                                        | ✅️️                 
| `ge`                                        | ✅️️                 
| `gg`                                        | ✅️                 
| `gI`                                        | ❌️              
| `gj`, `g<Down>`                             | ✅️               
| `gk`, `g<Up>`                               | ✅️                 
| `gx`                                        |
| `H`                                         | ✅️
| `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️                 
| `I`                                         | ❌️                 
| `i`                                         | ❌️               
| `J`                                         | ❌                 
| `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️                 
| `k`, `CTRL-P`, `<Up>`                       | ✅️                 
| `L`                                         | ✅️
| `l`, `<Right>`, `<Space>`                   | ✅️
| `M`                                         |
| `N`                                         | ✅️               
| `n`                                         | ✅️               
| `O`                                         | ❌️                 
| `o`                                         | ❌️                 
| `P`                                         | ❌️                 
| `p`                                         | ❌️                 
| `r`                                         | ✅️                 
| `S`                                         | ❌️                  
| `s`, `cl`, `c<Right>`, `c<Space>`           | ✅️                  
| `T`                                         | ✅️                 
| `t`                                         | ✅️                 
| `u`                                         | ✅️                 
| `W`, `<C-Right>`                            | ✅️️                 
| `w`, `<S-Right>`                            | ✅️️                 
| `X`, `dh`, `d<BS>`, `dCTRL-H`, `d<Left>`    | ✅️                 
| `x`, `<Del>`, `dl`, `d<Right>`, `d<Space>`  | ✅️                  
| `Y`                                         | ✅️                  
| `y$`, `yEnd`                                | ️❌️
| `y0`                                        | ️
| `ya'`                                       | ❌️ 
| `ya"`                                       | ❌️ 
| `ya[`, `ya]`                                | ❌️ 
| `ya<`, `ya>`                                | ❌️                 
| <code>ya`</code>                            | ❌️
| `yaB`, `ya{`, `ya}`                         | ❌️                 
| `yab`, `ya(`, `ya)`                         | ❌️                 
| `yF`                                        | ✅️                 
| `yf`                                        | ✅️                 
| `yg$`, `ygEnd`                              | ️️❌️
| `yg0`, `ygHome`                             | ️️
| `yh`, `y<BS>`, `y<Left>`, `yCTRL-H`         | ❌️
| `yi'`                                       | ❌️
| `yi"`                                       | ❌️                 
| `yi[`, `yi]`                                | ❌️                 
| `yi<`, `yi>`                                | ❌️                 
|  <code>yi`</code>                           | ❌️ 
| `yiB`, `yi{`, `yi}`                         | ❌️                 
| `yib`, `yi(`, `yi)`                         | ❌️                 
| `yiw`                                       | ❌️ 
| `yl`, `y<Right>`, `y<Space>`                | ❌️
| `yT`                                        | ✅️ 
| `yt`                                        | ✅️ 
| `yy`                                        | ✅️ 
| `z-`                                        | ❌️                 
| `z.`                                        | ❌️                 
| `zb`                                        | ❌️                 
| `z<CR>`                                     | ❌️                 
| `zt`                                        | ❌️                 
| `zz`                                        | ❌️                 
