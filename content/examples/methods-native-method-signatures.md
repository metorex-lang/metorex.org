---
title: "methods/native_method_signatures.rb"
slug: methods-native-method-signatures
description: "The metorex example program methods/native_method_signatures.rb and its output."
---

`tests/_examples/methods/native_method_signatures.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/methods/native_method_signatures.rb).

```metorex
p "x".method(:upcase).parameters
p "x".method(:upcase).arity
p [].method(:push).parameters
p "x".method(:center).arity
p 1.method(:+).parameters
p Integer.method(:sqrt).arity
p method(:puts).arity
p "x".method(:freeze).arity
p 5.method(:between?).arity
```

Output:

```
[[:rest]]
-1
[[:rest]]
-1
[[:req]]
1
-1
0
2
```
