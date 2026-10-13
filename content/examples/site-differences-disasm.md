---
title: "site/differences_disasm.rb"
slug: site-differences-disasm
description: "The metorex example program site/differences_disasm.rb and its output."
---

`tests/_examples/site/differences_disasm.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/differences_disasm.rb).

```metorex
puts RubyVM::InstructionSequence.compile("total = 2 + 3").disasm
```

Output:

```
== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(1,13)>
0000 lasgn :total                          
0001 opcall :+                             
0002 integer 2                             
0003 list nil                              
0004 integer 3                             
0005 leave                                 
```
