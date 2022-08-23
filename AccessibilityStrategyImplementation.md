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
| `])`                                        | ❌️              |                                      | `a'`                                        | ❌️
| `]}`                                        | ❌️              |                                      | `a"`                                        | ❌️
| `{`                                         | ❌️              |                                      | `a[`, `a]`                                  | ❌️
| `}`                                         | ❌️              |                                      | `a<`, `a>`                                  | ❌️ 
| `/`                                         | ✅️              |                                      | `aB`, `a{`, `a}`                            | ❌️
| `/<CR>`                                     | ✅️              |                                      | `ab`, `a(`, `a)`                            | ❌️
| `%`                                         |                 |                                      | `B`, `<C-Left>`                             | ✅️          
| `^`                                         |                 |                                      | `b`, `<S-Left>`                             | ✅️          
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️              |                                      | `C`                                         |             
| `<<`                                        | ✅️️              |                                      | `c`, `s`                                    |             
| `>>`                                        | ✅️️              |                                      | `D`                                         |             
| `~`                                         | ✅️              |                                      | `d`, `<Del>`, `x`                           |             
| `$`, `<End>`                                | ✅️              |                                      | `E`                                         | ✅️          
| `0`                                         |                 |                                      | `e`                                         | ✅️          
| `A`                                         | ❌️              |                                      | `F`                                         | ✅️          
| `a`                                         | ❌️              |                                      | `f`                                         | ✅️          
| `B`, `<C-Left>`                             | ✅️️              |                                      | `G`                                         | ✅️          
| `b`, `<S-Left>`                             | ✅️️              |                                      | `g_`                                        | ✅️
| `C`, `c$`, `cEnd`                           | ❌️              |                                      | `g^`                                        |             
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |                 |                                      | `g$`, `g<End>`                              | ✅️️          
| `CTRL-D`                                    |                 |                                      | `g0`, `g<Home>`                             |             
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |                 |                                      | `gE`                                        | ✅️          
| `CTRL-R`                                    | ✅️              |                                      | `ge`                                        | ✅️          
| `CTRL-U`                                    |                 |                                      | `gg`                                        | ✅️          
| `c0`                                        |                 |                                      | `gI`                                        |             
| `ca'`                                       | ❌️              |                                      | `gj`, `g<Down>`                             | ✅️          
| `ca"`                                       | ❌️              |                                      | `gk`, `g<Up>`                               | ✅️          
| `ca[`, `ca]`                                | ❌️              |                                      | `gx`                                        |
| `ca<`, `ca>`                                | ❌️              |                                      | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️          
| <code>ca`</code>                            | ❌️              |                                      | `i[`, `i]`                                  | ❌️
| `caB`, `ca{`, `ca}`                         | ❌️              |                                      | `i<`, `i>`                                  | ❌️ 
| `cab`, `ca(`, `ca)`                         | ❌️              |                                      | `iB`, `i{`, `i}`                            | ❌️ 
| `caW`                                       | ❌️              |                                      | `ib`, `i(`, `i)`                            | ❌️ 
| `caw`                                       | ❌️              |                                      | `ip`                                        | ❌️
| `cB`                                        | ✅️️              |                                      | `iW`                                        | ❌️          
| `cb`                                        | ✅️️              |                                      | `iw`                                        | ❌️          
| `cc`                                        | ❌️              |                                      | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️          
| `cE`                                        | ✅️️              |                                      | `k`, `CTRL-P`, `<Up>`                       | ✅️          
| `ce`                                        | ✅️️              |                                      | `l`, `<Right>`, `<Space>`                   | ✅️          
| `cF`                                        | ✅️              |                                      | `o`                                         |             
| `cf`                                        | ✅️              |                                      | `P`                                         | ❌️          
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️              |                                      | `p`                                         | ❌️          
| `cG`                                        | ❌️              |                                      | `R`                                         |             
| `cg$`, `cgEnd`                              | ❌️              |                                      | `S`                                         |             
| `cg0`, `cgHome`                             |   ️              |                                      | `T`                                         | ✅️          
| `cgg`                                       | ❌️              |                                      | `t`                                         | ✅️️          
| `ci'`                                       | ❌️              |                                      | `u`                                         | 
| `ci"`                                       | ❌️              |                                      | `V`                                         | ❌️          
| `ci[`, `ci]`                                | ❌️              |                                      | `v`                                         | ❌️          
| `ci<`, `ci>`                                | ❌️              |                                      | `W`, `<C-Right>`                            | ✅️          
| <code>ci`</code>                            | ❌️              |                                      | `w`, `<S-Right>`                            | ✅️          
| `ciB`, `ci{`, `ci}`                         | ❌️              |                                      | `X`                                         |             
| `cib`, `ci(`, `ci)`                         | ❌️              |                                      | `Y`                                         |             
| `ciW`                                       | ❌️              |                                      | `y`                                         |                 
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
