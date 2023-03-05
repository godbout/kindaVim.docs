# Accessibility Strategy

kV detects automatically which Strategy to use, but sometimes you may wish to enforce the Keyboard Strategy even when the text is Accessible.
You can do so by pressing `fn` while doing a move. This is useful when you're in a text input but want to scroll through the UI (scrollbars) rather than the text/caret, or to move from one input to another in some apps with custom UI (e.g. Things 3, Logseq).

| Normal Mode                                 | count | repeat | &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; | Visual Mode                                 | count | repeat |
| ---:                                        | :---: | :---:  | :---:                                            | ---:                                        | :---: |  :---: |
| `_`                                         | ✅️    |        |                                                  | `_`                                         | ✅️️    |
| `-`                                         | ✅️    |        |                                                  | `,`                                         | ✅️    |
| `,`                                         | ✅️    |        |                                                  | `;`                                         | ✅️    |
| `;`                                         | ✅️    |        |                                                  | `(`                                         | ❌️    |
| `?`                                         | ✅️    |        |                                                  | `)`                                         | ❌️    |
| `?<CR>`                                     | ✅️    |        |                                                  | `{`                                         | ❌️    |
| `(`                                         | ❌️    |        |                                                  | `}`                                         | ❌️    |
| `)`                                         | ❌    |        |                                                  | `^`                                         |       |
| `[(`                                        | ❌️    |        |                                                  | `+`, `<CR>`, `CTRL-M`, `<Enter>`            | ✅️    |
| `[(`                                        | ❌️    |        |                                                  | `<`                                         | ✅️    | ❌
| `[{`                                        | ❌️    |        |                                                  | `>`                                         | ✅️    | ❌
| `])`                                        | ❌️    |        |                                                  | `$`, `<End>`                                | ✅️️    |
| `]}`                                        | ❌️    |        |                                                  | `~`                                         |       | ❌
| `{`                                         | ❌️    |        |                                                  | `0`                                         |       |
| `}`                                         | ❌️    |        |                                                  | `a'`                                        | ❌️    |
| `/`                                         | ✅️    |        |                                                  | `a"`                                        | ❌️    |
| `/<CR>`                                     | ✅️    |        |                                                  | `a[`, `a]`                                  | ❌️    |
| `%`                                         |       |        |                                                  | `a<`, `a>`                                  | ❌️    |
| `^`                                         |       |        |                                                  | <code>a`</code>                             | ❌️    |
| `+`, `<CR>`, `<CTRL-M>`, `<Enter>`          | ✅️️    |        |                                                  | `aB`, `a{`, `a}`                            | ❌️    |
| `<<`                                        | ✅️️    | ✅️️     |                                                  | `ab`, `a(`, `a)`                            | ❌️    |
| `>>`                                        | ✅️️    | ✅️️     |                                                  | `ap`                                        | ❌️    |
| `~`                                         | ✅️    |        |                                                  | `B`, `<C-Left>`                             | ✅️    |
| `$`, `<End>`                                | ✅️    |        |                                                  | `b`, `<S-Left>`                             | ✅️    |
| `0`                                         |       |        |                                                  | `C`                                         |       | ❌
| `A`                                         | ❌️    | ❌️     |                                                  | `CTRL-[`, `<Esc>`                           |       |
| `a`                                         | ❌️    | ❌     |                                                  | `c`, `s`                                    |       | ❌
| `B`, `<C-Left>`                             | ✅️️    |        |                                                  | `D`                                         |       | ❌
| `b`, `<S-Left>`                             | ✅️️    |        |                                                  | `d`, `<Del>`, `x`                           |       | ❌
| `C`, `c$`, `c<End>`                         | ❌️    | ❌️     |                                                  | `E`                                         | ✅️    |
| `CTRL-B`, `<PageUp>`, `<S-Up>`              |       |        |                                                  | `e`                                         | ✅️    |
| `CTRL-D`                                    |       |        |                                                  | `F`                                         | ✅️    |
| `CTRL-F`, `<PageDown>`, `<S-Down>`          |       |        |                                                  | `f`                                         | ✅️    |
| `CTRL-R`                                    | ✅️    |        |                                                  | `G`                                         | ✅️    |
| `CTRL-U`                                    |       |        |                                                  | `g_`                                        | ✅️    |
| `c0`                                        |       | ❌️     |                                                  | `g^`                                        |       |
| `ca'`                                       | ❌️    | ❌️     |                                                  | `g$`, `g<End>`                              | ✅️️    |
| `ca"`                                       | ❌️    | ❌️     |                                                  | `g0`, `g<Home>`                             |       |
| `ca[`, `ca]`                                | ❌️    | ❌️     |                                                  | `gE`                                        | ✅️    |
| `ca<`, `ca>`                                | ❌️    | ❌️     |                                                  | `ge`                                        | ✅️    |
| <code>ca`</code>                            | ❌️    | ❌️     |                                                  | `gg`                                        | ✅️    |
| `caB`, `ca{`, `ca}`                         | ❌️    | ❌️     |                                                  | `gI`                                        |       |
| `cab`, `ca(`, `ca)`                         | ❌️    | ❌️     |                                                  | `gj`, `g<Down>`                             | ✅️    |
| `cap`                                       | ❌️    | ❌️     |                                                  | `gk`, `g<Up>`                               | ✅️    |
| `caW`                                       | ❌️    | ❌️     |                                                  | `gx`                                        |       |
| `caw`                                       | ❌️    | ❌️     |                                                  | `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️    |
| `cB`                                        | ✅️️    | ❌️     |                                                  | `i'`                                        | ❌️    |
| `cb`                                        | ✅️️    | ❌️     |                                                  | `i"`                                        | ❌️    |
| `cc`                                        | ❌️    | ❌️     |                                                  | `i[`, `i]`                                  | ❌️    |
| `cE`                                        | ✅️️    | ❌️     |                                                  | `i<`, `i>`                                  | ❌️    |
| `ce`                                        | ✅️️    | ❌️     |                                                  | <code>i`</code>                             | ❌️    |
| `cF`                                        | ✅️    | ❌️     |                                                  | `iB`, `i{`, `i}`                            | ❌️    |
| `cf`                                        | ✅️    | ❌️     |                                                  | `ib`, `i(`, `i)`                            | ❌️    |
| `ch`, `c<BS>`, `cCTRL-H`, `c<Left>`         | ✅️    | ❌️     |                                                  | `ip`                                        | ❌️    |
| `cG`                                        | ❌️    | ❌️     |                                                  | `iW`                                        | ❌️    |
| `cg$`, `cg<End>`                            | ❌️    | ❌️     |                                                  | `iw`                                        | ❌️    |
| `cg0`, `cg<Home>`                           |   ️    | ❌️     |                                                  | `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️    |
| `cgg`                                       | ❌️    | ❌️     |                                                  | `k`, `CTRL-P`, `<Up>`                       | ✅️    |
| `ci'`                                       | ❌️    | ❌️     |                                                  | `l`, `<Right>`, `<Space>`                   | ✅️    |
| `ci"`                                       | ❌️    | ❌️     |                                                  | `o`                                         |       |  
| `ci[`, `ci]`                                | ❌️    | ❌️     |                                                  | `P`                                         | ❌️    |
| `ci<`, `ci>`                                | ❌️    | ❌️     |                                                  | `p`                                         | ❌️    |
| <code>ci`</code>                            | ❌️    | ❌️     |                                                  | `R`                                         |       | ❌
| `ciB`, `ci{`, `ci}`                         | ❌️    | ❌️     |                                                  | `S`                                         |       | ❌
| `cib`, `ci(`, `ci)`                         | ❌️    | ❌️     |                                                  | `T`                                         | ✅️    |
| `cip`                                       | ❌️    | ❌️     |                                                  | `t`                                         | ✅️️    |   
| `ciW`                                       | ❌️    | ❌️     |                                                  | `U`                                         |       | ❌ 
| `ciw`                                       | ❌️    | ❌️     |                                                  | `u`                                         |       | ❌
| `cj`, `cCTRL-J`, `cCTRL-N`, `c<Down>`       | ❌️    | ❌️     |                                                  | `V`                                         | ❌️    |
| `ck`, `cCTRL-P`, `c<Up>`                    | ❌️    | ❌️     |                                                  | `v`                                         | ❌️    |
| `cT`                                        | ✅️    | ❌️     |                                                  | `W`, `<C-Right>`                            | ✅️    |
| `ct`                                        | ✅️    | ❌️     |                                                  | `w`, `<S-Right>`                            | ✅️    |
| `cW`                                        | ❌️    | ❌️     |                                                  | `X`                                         |       | ❌    
| `cw`                                        | ❌️    | ❌️     |                                                  | `Y`                                         |       |     
| `D`, `d$`, `d<End>`                         | ❌️    | ✅️️     |                                                  | `y`                                         |       |         
| `d0`                                        |       | ✅️️     |                                                  
| `da'`                                       | ❌️    | ✅️️     |
| `da"`                                       | ❌️    | ✅️️     |
| `da[`, `da]`                                | ❌️    | ✅     |
| `da<`, `da>`                                | ❌️    | ✅     |
| <code>da`<code>                             | ❌️    | ✅️️     |
| `daB`, `da{`, `da}`                         | ❌️    | ✅     |                                      
| `dab`, `da(`, `da)`                         | ❌️    | ✅     |                              
| `dap`                                       | ❌️    | ✅️️     |
| `daW`                                       | ❌️    | ✅️️     |                              
| `daw`                                       | ❌️    | ✅️️     |                              
| `dB`                                        | ✅️️    | ✅️️     |                              
| `db`                                        | ✅️️    | ✅️️     |                              
| `dd`                                        | ❌️    | ✅️     |
| `dE`                                        | ✅️️    | ✅️     |
| `de`                                        | ✅️️    | ✅️     |
| `dF`                                        | ✅️    | ✅     |
| `df`                                        | ✅️    | ✅     |
| `dG`                                        | ❌️    | ✅️     |
| `dg$`, `dg<End>`                            | ❌️    | ✅️     |
| `dg0`, `dg<Home>`                           |       | ✅️     |
| `dgg`                                       | ❌️    | ✅️     |
| `di'`                                       | ❌️    | ✅️     |
| `di"`                                       | ❌️    | ✅️     |
| `di[`, `di]`                                | ❌️    | ✅️     |                                      
| `di<`, `di>`                                | ❌️    | ✅️     |                                      
| <code>di`</code>                            | ❌️    | ✅️     |                                      
| `diB`, `di{`, `di}`                         | ❌️    | ✅️     |                                      
| `dib`, `di(`, `di)`                         | ❌️    | ✅️     |                                      
| `dip`                                       | ❌️    | ✅️     |
| `diW`                                       | ❌️    | ✅️     |       
| `diw`                                       | ❌️    | ✅️     |       
| `dj`, `dCTRL-J`, `dCTRL-N`, `d<Down>`       | ❌️    | ✅     |        
| `dk`, `dCTRL-P`, `d<Up>`                    | ❌️    | ✅     |        
| `dT`                                        | ✅️    | ✅     |        
| `dt`                                        | ✅️    | ✅     |        
| `dW`                                        | ✅️    | ✅️     |        
| `dw`                                        | ✅️    | ✅️     |                 
| `E`                                         | ✅️️    |        |                     
| `e`                                         | ✅️️    |        |                     
| `F`                                         | ✅️    |        |                     
| `f`                                         | ✅️    |        |                     
| `G`                                         | ✅️    |        |             
| `g_`                                        | ✅️    |        |
| `g^`                                        |       |        |
| `g$` , `g<End>`                             | ✅️    |        |            
| `g0`, `g<Home>`                             |       |        |          
| `gE`                                        | ✅️️    |        |            
| `ge`                                        | ✅️️    |        |            
| `gg`                                        | ✅️    |        |            
| `gI`                                        | ❌️    |        |         
| `gj`, `g<Down>`                             | ✅️    |        |          
| `gk`, `g<Up>`                               | ✅️    |        |            
| `gx`                                        |       |        |
| `H`                                         | ✅️    |        |
| `h`, `<BS>`, `CTRL-H`, `<Left>`             | ✅️    |        |            
| `I`                                         | ❌️    | ❌     |    
| `i`                                         | ❌️    | ❌     |          
| `J`                                         | ❌    |        |            
| `j`, `CTRL-J`, `CTRL-N`, `<Down>`           | ✅️    |        |            
| `k`, `CTRL-P`, `<Up>`                       | ✅️    |        |            
| `L`                                         | ✅    |        |
| `l`, `<Right>`, `<Space>`                   | ✅️    |        |
| `M`                                         |       |        |
| `N`                                         | ✅️    |        |               
| `n`                                         | ✅️    |        |               
| `O`                                         | ❌️    | ❌     |                 
| `o`                                         | ❌️    | ❌     |                 
| `P`                                         | ❌️    | ❌     |                 
| `p`                                         | ❌️    | ❌     |                 
| `r`                                         | ✅️    | ❌     |                 
| `S`                                         | ❌️    | ❌     |                  
| `s`, `cl`, `c<Right>`, `c<Space>`           | ✅️    | ❌     |                  
| `T`                                         | ✅️    |        |                 
| `t`                                         | ✅️    |        |                 
| `u`                                         | ✅️    | ❌     |                 
| `W`, `<C-Right>`                            | ✅️️    |        |                 
| `w`, `<S-Right>`                            | ✅️️    |        |                 
| `X`, `dh`, `d<BS>`, `dCTRL-H`, `d<Left>`    | ✅️    | ✅️     |                 
| `x`, `<Del>`, `dl`, `d<Right>`, `d<Space>`  | ✅️    | ✅️     |                  
| `Y`                                         | ✅️    |        |                  
| `y$`, `y<End>`                              | ️❌️    |        |
| `y0`                                        | ️      |        |
| `ya'`                                       | ❌️    |        | 
| `ya"`                                       | ❌️    |        | 
| `ya[`, `ya]`                                | ❌️    |        | 
| `ya<`, `ya>`                                | ❌️    |        |                 
| <code>ya`</code>                            | ❌️    |        |
| `yaB`, `ya{`, `ya}`                         | ❌️    |        |                 
| `yab`, `ya(`, `ya)`                         | ❌️    |        |                 
| `yap`                                       | ❌️    |        |                 
| `yaW`                                       | ❌️    |        |                 
| `yaw`                                       | ❌️    |        |                 
| `yF`                                        | ✅️    |        |                 
| `yf`                                        | ✅️    |        |                 
| `yg$`, `yg<End>`                            | ️️❌️    |        |
| `yg0`, `yg<Home>`                           | ️️      |        |
| `yh`, `y<BS>`, `y<Left>`, `yCTRL-H`         | ❌️    |        |
| `yi'`                                       | ❌️    |        |
| `yi"`                                       | ❌️    |        |            
| `yi[`, `yi]`                                | ❌️    |        |            
| `yi<`, `yi>`                                | ❌️    |        |             
|  <code>yi`</code>                           | ❌️    |        |
| `yiB`, `yi{`, `yi}`                         | ❌️    |        |            
| `yib`, `yi(`, `yi)`                         | ❌️    |        |            
| `yip`                                       | ❌️    |        |
| `yiW`                                       | ❌️    |        |
| `yiw`                                       | ❌️    |        |
| `yl`, `y<Right>`, `y<Space>`                | ❌️    |        |
| `yT`                                        | ✅️    |        | 
| `yt`                                        | ✅️    |        |
| `yy`                                        | ✅️    |        |
| `z-`                                        | ❌️    |        |                
| `z.`                                        | ❌️    |        |                
| `zb`                                        | ❌️    |        |                
| `z<CR>`                                     | ❌️    |        |                
| `zt`                                        | ❌️    |        |                
| `zz`                                        | ❌️    |        |                
