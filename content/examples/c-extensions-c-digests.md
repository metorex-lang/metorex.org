---
title: "c_extensions/c_digests.rb"
slug: c-extensions-c-digests
description: "The metorex example program c_extensions/c_digests.rb and its output."
---

`tests/_examples/c_extensions/c_digests.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_digests.rb).

```metorex
# A C extension adding a digest algorithm through Digest::Base, and Fiddle
# reading memory at an address.
require "tmpdir"
require "fiddle"
require_relative "build_helper"

directory = Dir.mktmpdir
require(build_extension("c_digests.c", "c_digests", directory))

fold = Digest::Fold.new
p([fold.digest_length, fold.block_length, Digest::Fold.superclass, Digest::MD5.superclass])
fold.update("abcd")
fold << "e"
p(fold.hexdigest)
p(Digest::Fold.hexdigest("abcd"))
p(Digest::Fold.new("ab").digest.bytes)
fold.reset
p(fold.digest.bytes)
p(Digest::MD5.hexdigest("abc"))
begin
  Digest::Base.new("abc")
rescue NotImplementedError => error
  p([error.class, error.message])
end

address = CDigests.new.marker_address
pointer = Fiddle::Pointer.new(address)
p([pointer.to_i == address, pointer.size, Fiddle::Pointer[address].to_i == address])
p([pointer[0], pointer[1].chr, pointer[0, 6]])

FileUtils.rm_rf(directory)
```

Output:

```
[5, 8, Digest::Base, Digest::Base]
"0462636405"
"6162636404"
[97, 98, 0, 0, 2]
[0, 0, 0, 0, 0]
"900150983cd24fb0d6963f7d28e17f72"
[NotImplementedError, "Digest::Base is an abstract class"]
[true, 0, true]
[109, "a", "marker"]
```
