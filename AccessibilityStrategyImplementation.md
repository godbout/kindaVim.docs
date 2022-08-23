# Accessibility Strategy

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                 | count | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode | count |
| ---:                                        | :---:           | :---:                                | ---:                                        | :---:       
| `_`                                         | ✅️              |                                      | `_`                                         | ✅️️          
| `,`                                         | ✅️              |                                      | `,`                                         | ✅️          
| `;`                                         | ✅️              |                                      | `;`                                         | ✅️          
| `?`                                         | ✅️              |                                      | `^`                                         |             
| `?<CR>`                                     | ✅️              |                                      | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️
| `(`                                         | ❌️              |                                      | `<`                                         | ✅️
| `)`                                         | ❌              |                                      | `>`                                         | ✅️
| `[(`                                        | ❌️              |                                      | `$`, `<End>`                                | ✅️️          
| `[(`                                        | ❌️              |                                      | `~`                                         |             
| `[{`                                        | ❌️              |                                      | `0`                                         |             
| `])`                                        | ❌️              |                                      | `a[`, `a]`                                  | ❌️
| `]}`                                        | ❌️              |                                      | `a<`, `a>`                                  | ❌️ 
| `{`                                         | ❌️              |                                      | `aB`, `a{`, `a}`                            | ❌️
| `}`                                         | ❌️              |                                      | `ab`, `a(`, `a)`                            | ❌️
| `/`                                         | ✅️              |                                      | `B`, `<C-Left>`                             | ✅️          
| `/<CR>`                                     | ✅️              |                                      | `b`, `<S-Left>`                             | ✅️          
| `%`                                         |                 |                                      | `C`                                         |             
| `^`                                         |                 |                                      | `c`, `s`                                    |             
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | `D`                                         |             
| `<<`                                        | ✅️️              |                                      | `d`, `<Del>`, `x`                           |             
| `>>`                                        | ✅️️              |                                      | `E`                                         | ✅️          
| `~`                                         | ✅️              |                                      | `e`                                         | ✅️          
| `$`, `<End>`                                | ✅️              |                                      | `F`                                         | ✅️          
| `0`                                         |                 |                                      | `f`                                         | ✅️          
| `A`                                         | ❌️              |                                      | `G`                                         | ✅️          
| `a`                                         | ❌️              |                                      | `g_`                                        | ✅️
| `B`, `<C-Left>`                             | ✅️️              |                                      | `g^`                                        |             
| `b`, `<S-Left>`                             | ✅️️              |                                      | `g$`, `g<End>`                              | ✅️️          
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `g0`, `g<Home>`                             |             
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `gE`                                        | ✅️          
| `CTRL-D`                                    |                 |                                      | `ge`                                        | ✅️          
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `gg`                                        | ✅️          
| `CTRL-R`                                    | ✅️              |                                      | `gI`                                        |             
| `CTRL-U`                                    |                 |                                      | `gj`, `g<Down>`                             | ✅️          
| `c0`                                        |                 |                                      | `gk`, `g<Up>`                               | ✅️          
| `ca'`                                       | ❌️              |                                      | `gx`                                        |
| `ca"`                                       | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| `ca[`, `ca]`                                | ❌️              |                                      | `i[`, `i]`                                  | ❌️
| `ca<`, `ca>`                                | ❌️              |                                      | `i<`, `i>`                                  | ❌️ 
| <code>ca`</code>                            | ❌️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `ib`, `i(`, `i)`                            | ❌️ 
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `ip`                                        | ❌️
| `caW`                                       | ❌️              |                                      | `iW`                                        | ❌️          
| `caw`                                       | ❌️              |                                      | `iw`                                        | ❌️          
| `cB`                                        | ✅️️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `cb`                                        | ✅️️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `cc`                                        | ❌️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `cE`                                        | ✅️️              |                                      | `o`                                         |             
| `ce`                                        | ✅️️              |                                      | `P`                                         | ❌️          
| `cF`                                        | ✅️              |                                      | `p`                                         | ❌️          
| `cf`                                        | ✅️              |                                      | `R`                                         |             
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `S`                                         |             
| `cG`                                        | ❌️              |                                      | `T`                                         | ✅️          
| `cg$`, `cgEnd`                              | ❌️              |                                      | `t`                                         | ✅️️          
| `cg0`, `cgHome`                             |   ️              |                                      | `u`                                         | 
| `cgg`                                       | ❌️              |                                      | `V`                                         | ❌️          
| `ci'`                                       | ❌️              |                                      | `v`                                         | ❌️          
| `ci"`                                       | ❌️              |                                      | `W`, `<C-Right>`                            | ✅️          
| `ci[`, `ci]`                                | ❌️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `ci<`, `ci>`                                | ❌️              |                                      | `X`                                         |             
| <code>ci`</code>                            | ❌️              |                                      | `Y`                                         |             
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      | `y`                                         |                 
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      
| `ciW`                                       | ❌️              |                                      
| `ciw`                                       | ❌️              |                                      
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️              |                                      
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️              |                                      
| `cT`                                        | ✅️              |                                      
| `ct`                                        | ✅️              |                                      
| `cW`                                        | ❌️              |                                      
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
