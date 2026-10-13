---
title: "c_extensions/c_hashes.rb"
slug: c-extensions-c-hashes
description: "The metorex example program c_extensions/c_hashes.rb and its output."
---

`tests/_examples/c_extensions/c_hashes.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_hashes.rb).

```metorex
# A C extension working with hashes: making, converting, reading with and
# without the default, writing, removing, walking with each answer a walk's
# function can give, and the hash codes rb_hash and the mixing functions
# answer.
require "tmpdir"
require_relative "build_helper"

directory = Dir.mktmpdir
require(build_extension("c_hashes.c", "c_hashes", directory))
hashes = CHashes.new

class SmallCode
  def hash
    5
  end
end

class LargeCode
  def hash
    2**70 + 3
  end
end

class ConvertedCode
  def hash
    self
  end

  def to_int
    12
  end
end

class NoCode
  def hash
    nil
  end
end

p([hashes.hash_code(SmallCode.new), hashes.hash_code(LargeCode.new).is_a?(Integer), hashes.hash_code(ConvertedCode.new)])
report { hashes.hash_code(NoCode.new) }

with_to_hash = Object.new
def with_to_hash.to_hash
  { "converted" => true }
end
p([hashes.convert(nil), hashes.convert([]), hashes.convert(with_to_hash)])
report { hashes.convert(42) }

plain, sized, identity = hashes.made
p([plain, sized, identity.compare_by_identity?, plain.compare_by_identity?])
report { hashes.negative_capacity }
p(hashes.frozen({}).frozen?)

defaulted = Hash.new(0)
defaulted[:held] = 1
p([hashes.read(defaulted, :held), hashes.read(defaulted, :absent)])
p([hashes.missing_is_undef(defaulted, :absent), hashes.missing_is_undef(defaulted, :held)])

written = {}
p([hashes.write(written, :first, 1), written])
p([hashes.remove(written, :first), hashes.remove(written, :first), written])

numbers = { one: 1, two: 2, three: 3 }
hashes.remove_if(numbers) { |_key, value| value.even? }
p([numbers, hashes.remove_if(numbers).class])

p(hashes.fetch({ found: :yes }, :found))
report { hashes.fetch(Hash.new(:default), :absent) }

full = { kept: 1 }
p([hashes.emptied(full).equal?(full), full, hashes.size({ one: 1, two: 2 })])
defaulting = {}
hashes.set_default(defaulting, 10)
p(defaulting[:anything])
p(hashes.insert([:a, 1, :b, 2, :a, 3], { b: 0, c: 4 }))

walked = { name: "Ada", year: 1815 }
p([hashes.walk(walked, :each), hashes.walk(walked, :first)])
p([hashes.walk(walked, :remove), walked])

p([hashes.mixed(53) == hashes.mixed(53), hashes.mixed(53).is_a?(Integer)])

FileUtils.rm_rf(directory)
```

Output:

```
[5, true, 12]
TypeError: no implicit conversion from nil to integer
[{}, {}, {"converted" => true}]
TypeError: can't convert Integer into Hash
[{}, {}, true, false]
RuntimeError: st_table too big
true
[[1, 1, 1], [0, nil, :missing]]
[true, false]
[1, {first: 1}]
[1, nil, {}]
[{one: 1, three: 3}, Enumerator]
:yes
KeyError: key not found: :absent
[true, {}, 2]
10
{b: 2, c: 4, a: 3}
[{name: "Ada", year: 1815}, {name: "Ada"}]
[{name: "Ada", year: 1815}, {}]
[true, true]
```
