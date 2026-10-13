---
title: "stdlib_libraries/message_digests.rb"
slug: stdlib-libraries-message-digests
description: "The metorex example program stdlib_libraries/message_digests.rb and its output."
---

`tests/_examples/stdlib_libraries/message_digests.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/message_digests.rb){target=_blank rel=noopener}.

```metorex
# Message digests. Each algorithm answers the same digest every other
# implementation does, which is the whole point of naming one.

require 'digest'

p Digest::MD5.hexdigest "abc"
p Digest::SHA1.hexdigest "abc"
p Digest::SHA256.hexdigest "abc"
p Digest::SHA384.hexdigest "abc"
p Digest::SHA512.hexdigest "abc"

# The empty message has a digest of its own.
p Digest::SHA256.hexdigest ""

# A digest object takes its message a piece at a time.
running = Digest::SHA256.new
running << "a"
running << "b"
running << "c"
p running.hexdigest
p running.digest_length
p running.block_length

# Asking for the digest of a given message leaves the object blank again.
p running.hexdigest("abc") == Digest::SHA256.hexdigest("abc")
p running.hexdigest == Digest::SHA256.hexdigest("")

# A digest compares equal to the text of its own hexdigest.
p Digest::MD5.new == "d41d8cd98f00b204e9800998ecf8427e"
p Digest::MD5.new.inspect

# SHA2 picks one of the three by bit length.
p Digest::SHA2.hexdigest("abc", 384) == Digest::SHA384.hexdigest("abc")

# Base64 and hex are two ways of naming the same bytes.
p Digest::SHA256.base64digest ""
p Digest.hexencode "sample string"

# Bubble Babble names a message in syllables.
p Digest.bubblebabble ""
p Digest.bubblebabble "foo"
p Digest.bubblebabble "1234567890"
```

Output:

```
"900150983cd24fb0d6963f7d28e17f72"
"a9993e364706816aba3e25717850c26c9cd0d89d"
"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
"cb00753f45a35e8bb5a03d699ac65007272c32ab0eded1631a8b605a43ff5bed8086072ba1e7cc2358baeca134c825a7"
"ddaf35a193617abacc417349ae20413112e6fa4e89a97ea20a9eeee64b55d39a2192992a274fc1a836ba3c23a3feebbd454d4423643ce80e2a9ac94fa54ca49f"
"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
"ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
32
64
true
true
true
"#<Digest::MD5: d41d8cd98f00b204e9800998ecf8427e>"
true
"47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
"73616d706c6520737472696e67"
"xexax"
"xinik-zorox"
"xesef-disof-gytuf-katof-movif-baxux"
```
