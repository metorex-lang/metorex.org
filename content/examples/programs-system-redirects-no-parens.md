---
title: "programs/system_redirects_no_parens.rb"
slug: programs-system-redirects-no-parens
description: "The metorex example program programs/system_redirects_no_parens.rb and its output."
---

`tests/_examples/programs/system_redirects_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/programs/system_redirects_no_parens.rb){target=_blank rel=noopener}.

```metorex
require "tmpdir"

Dir.mktmpdir do |directory|
  log = File.join directory, "make.out"
  File.open log, "w" do |output|
    system "echo", "compiling rates", out: output, err: output
    system "echo linking rates >&2", out: output, err: output
    Dir.chdir(directory) { system "echo", "installed", out: output }
  end
  puts File.read(log)
end

reader, writer = IO.pipe
p system("echo", "piped", out: writer)
writer.close
p reader.read
p system("false", out: File::NULL)
p $?.exitstatus
p system("pwd", chdir: "/", out: File::NULL)
begin
  system "false", exception: true, out: File::NULL
rescue RuntimeError => error
  p error.class
end
```

Output:

```
compiling rates
linking rates
installed
true
"piped\n"
false
1
true
RuntimeError
```
