---
title: "stdlib_libraries/persistent_stores.rb"
slug: stdlib-libraries-persistent-stores
description: "The metorex example program stdlib_libraries/persistent_stores.rb and its output."
---

`tests/_examples/stdlib_libraries/persistent_stores.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/persistent_stores.rb){target=_blank rel=noopener}.

```metorex
# PStore keeps a Hash of objects in a file, read and written in
# transactions that can be read-only, committed early or aborted.
require("pstore")
require("tmpdir")
Dir.mktmpdir do |dir|
  path = File.join(dir, "data.pstore")
  store = PStore.new(path)
  p(store.path == path)
  p(store.transaction { store[:list] = [1, 2]; store["name"] = "x"; :answered })
  p(File.exist?(path))
  p(store.transaction(true) { [store[:list], store.roots, store.keys, store.root?(:list), store.key?("nope"), store.fetch("name"), store.fetch(:missing, 5)] })
  begin
    store.transaction(true) { store.fetch(:missing) }
  rescue PStore::Error => error
    p([error.class, error.message])
  end
  p(store.transaction { store[:list] << 3; store.abort; :never })
  p(store.transaction(true) { store[:list] })
  p(store.transaction { store[:list] << 4; store.commit; :never })
  p(store.transaction(true) { store[:list] })
  p(store.transaction { store.delete(:list) })
  p(store.transaction { store.delete(:gone) })
  p(store.transaction(true) { store.roots })
  [-> { store[:x] }, -> { store.transaction(true) { store[:y] = 1 } }, -> { store.transaction { store.transaction { } } }, -> { store.transaction(true) { store.delete("name") } }].each do |attempt|
    attempt.call
  rescue PStore::Error => error
    p([error.class, error.message])
  end
  p(PStore::Error.superclass)
  begin
    store.transaction { store[:z] = 1; raise "boom" }
  rescue RuntimeError
  end
  p(store.transaction(true) { store.root?(:z) })
  p(Marshal.load(File.binread(path)))
  p(store.ultra_safe)
  store.ultra_safe = true
  other = PStore.new(path, true)
  p(other.transaction(true) { other["name"] })
  p(PStore.instance_methods(false).sort)
  missing = PStore.new(File.join(dir, "fresh.pstore"))
  p(missing.transaction(true) { missing.roots })
  p(File.exist?(File.join(dir, "fresh.pstore")))
end
```

Output:

```
true
:answered
true
[[1, 2], [:list, "name"], [:list, "name"], true, false, "x", 5]
[PStore::Error, "undefined key 'missing'"]
nil
[1, 2]
nil
[1, 2, 4]
[1, 2, 4]
nil
["name"]
[PStore::Error, "not in transaction"]
[PStore::Error, "in read-only transaction"]
[PStore::Error, "nested transaction"]
[PStore::Error, "in read-only transaction"]
StandardError
false
{"name" => "x"}
false
"x"
[:[], :[]=, :abort, :commit, :delete, :fetch, :key?, :keys, :path, :root?, :roots, :transaction, :ultra_safe, :ultra_safe=]
[]
false
```
