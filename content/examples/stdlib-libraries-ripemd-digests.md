---
title: "stdlib_libraries/ripemd_digests.rb"
slug: stdlib-libraries-ripemd-digests
description: "The metorex example program stdlib_libraries/ripemd_digests.rb and its output."
---

`tests/_examples/stdlib_libraries/ripemd_digests.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/ripemd_digests.rb){target=_blank rel=noopener}.

```metorex
# Digest::RMD160 gives RIPEMD-160 digests, twenty bytes long, through the same
# methods every Digest class answers.
require("digest/rmd160")
p(Digest::RMD160.hexdigest(""))
p(Digest::RMD160.hexdigest("abc"))
p(Digest::RMD160.hexdigest("a" * 1000))
p(Digest::RMD160.base64digest("message digest"))
digest = Digest::RMD160.new
digest.<<("ab")
digest.update("c")
p(digest.hexdigest, digest.digest_length, digest.block_length, digest.to_s)
p(digest.digest.bytesize)
p(Digest::RMD160.digest("x").encoding)
p(Digest::RMD160.new.hexdigest("abc"))
p(Digest::RMD160.superclass)
```

Output:

```
"9c1185a5c5e9fc54612808977ee8f548b2258d31"
"8eb208f7e05d987a9b044a8e98c6b087f15a0bfc"
"aa69deee9a8922e92f8105e007f76110f381e9cf"
"XQaJ70nS+uVyuIGxI6hf+iFZXzY="
"8eb208f7e05d987a9b044a8e98c6b087f15a0bfc"
20
64
"8eb208f7e05d987a9b044a8e98c6b087f15a0bfc"
20
#<Encoding:BINARY (ASCII-8BIT)>
"8eb208f7e05d987a9b044a8e98c6b087f15a0bfc"
Digest::Base
```
