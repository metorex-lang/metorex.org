---
title: "filesystem/asking_about_a_file.rb"
slug: filesystem-asking-about-a-file
description: "The metorex example program filesystem/asking_about_a_file.rb and its output."
---

`tests/_examples/filesystem/asking_about_a_file.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/filesystem/asking_about_a_file.rb).

```metorex
# The same questions asked through FileTest rather than File, and the ways a
# path may be named.

here = "README.md"

p FileTest.exist?(here)
p FileTest.file?(here)
p FileTest.directory?("src")
p FileTest.readable?(here)
p FileTest.writable?(here)
p FileTest.executable?(here)
p FileTest.zero?(here)
p FileTest.empty?(here)
p FileTest.symlink?(here)
p FileTest.blockdev?(here)
p FileTest.chardev?(here)
p FileTest.pipe?(here)
p FileTest.socket?(here)
p FileTest.setuid?(here)
p FileTest.setgid?(here)
p FileTest.sticky?(here)
p FileTest.owned?(here)
p FileTest.grpowned?(here)
p FileTest.identical?(here, here)
p FileTest.size(here) == File.size(here)
p FileTest.size?(here) == File.size(here)
p FileTest.readable_real?(here)
p FileTest.writable_real?(here)
p FileTest.executable_real?(here)
p FileTest.world_readable?(here) == File.world_readable?(here)
p FileTest.world_writable?(here)

# A path may be named by anything that answers to_path.
class NamedPath
  def initialize(path)
    @path = path
  end

  def to_path
    @path
  end
end

named = NamedPath.new(here)
p File.exist?(named)
p File.file?(named)
p File.size(named) == File.size(here)
p FileTest.directory?(NamedPath.new("src"))

p File.birthtime(here).class
p Process.groups.include?(Process.gid) || Process.groups.empty?
p RUBY_PLATFORM.include?("-")
```

Output:

```
true
true
true
true
true
false
false
false
false
false
false
false
false
false
false
false
true
true
true
true
true
true
true
false
true
nil
true
true
true
true
Time
true
true
```
