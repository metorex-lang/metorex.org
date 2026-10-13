---
title: "stdlib_libraries/run_commands_no_parens.rb"
slug: stdlib-libraries-run-commands-no-parens
description: "The metorex example program stdlib_libraries/run_commands_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/run_commands_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/run_commands_no_parens.rb).

```metorex
# `ruby -run -e` runs the file commands the un library defines, each reading
# its options with OptionParser and working through FileUtils, and prints the
# help for each.
require "rbconfig"
require "tmpdir"

def run *words
  read, write = IO.pipe
  child = spawn RbConfig.ruby, "-run", "-e", *words, out: write, err: write
  write.close
  output = read.read
  Process.wait child
  first = output.lines.first.to_s
  # A failure is reported by its message and class, whose place differs.
  output = "#{first[/: (.*\(\w+(::\w+)*\))$/, 1]}\n" if first.include?(".rb:") || first.start_with?("-e:")
  puts "$ #{words.join ' '}", output, "exit #{$?.exitstatus}"
end

def listing
  Dir.glob("**/*", base: ".").sort.map do |entry|
    if File.symlink? entry
      "#{entry} -> #{File.readlink entry}"
    elsif File.directory? entry
      "#{entry}/ #{'%o' % (File.stat(entry).mode & 0777)}"
    else
      "#{entry} #{'%o' % (File.stat(entry).mode & 0777)} #{File.read(entry).inspect}"
    end
  end
end

Dir.mktmpdir do |root|
  Dir.chdir root do
    File.write "one.txt", "one\n"
    run "mkdir", "--", "-v", "a"
    run "mkdir", "--", "-p", "-v", "deep/er/est"
    run "mkdir", "--", "a"
    run "touch", "--", "-v", "t1", "t2"
    run "cp", "--", "-v", "one.txt", "copy.txt"
    run "cp", "--", "-rv", "deep", "a"
    run "cp", "--", "-p", "one.txt", "kept.txt"
    run "cp", "--", "-l", "-v", "deep", "linked"
    run "ln", "--", "-v", "one.txt", "hard.txt"
    run "ln", "--", "-s", "-v", "one.txt", "soft.txt"
    run "ln", "--", "-sf", "-v", "t1", "soft.txt"
    run "mv", "--", "-v", "t2", "moved.txt"
    run "mv", "--", "one.txt", "t1", "a"
    run "chmod", "--", "-v", "600", "copy.txt"
    run "chmod", "--", "-v", "u+x,go-r", "kept.txt"
    run "install", "--", "-v", "-m", "640", "copy.txt", "inst/copy.txt"
    run "install", "--", "-p", "-v", "copy.txt", "inst2/"
    run "rm", "--", "-v", "hard.txt"
    run "rm", "--", "nope"
    run "rm", "--", "-f", "-v", "nope"
    run "rm", "--", "-r", "-v", "linked"
    run "rmdir", "--", "-p", "-v", "deep/er/est"
    File.write "globa", ""
    File.write "globb", ""
    run "rm", "--", "-v", "glob*"
    run "wait_writable", "--", "-v", "-n", "1", "moved.txt"
    run "wait_writable", "--", "missing"
    run "help", "cp", "mv"
    run "help", "nonesuch"
    run "cp", "--", "--help"
    run "httpd"
    puts listing
  end
end
```

Output:

```
$ mkdir -- -v a
mkdir a
exit 0
$ mkdir -- -p -v deep/er/est
mkdir -p deep/er/est
exit 0
$ mkdir -- a
File exists @ dir_s_mkdir - a (Errno::EEXIST)
exit 1
$ touch -- -v t1 t2
touch t1 t2
exit 0
$ cp -- -v one.txt copy.txt
cp one.txt copy.txt
exit 0
$ cp -- -rv deep a
cp -r deep a
exit 0
$ cp -- -p one.txt kept.txt

exit 0
$ cp -- -l -v deep linked
cp -lr deep linked
exit 0
$ ln -- -v one.txt hard.txt
ln one.txt hard.txt
exit 0
$ ln -- -s -v one.txt soft.txt
ln -s one.txt soft.txt
exit 0
$ ln -- -sf -v t1 soft.txt
ln -sf t1 soft.txt
exit 0
$ mv -- -v t2 moved.txt
mv t2 moved.txt
exit 0
$ mv -- one.txt t1 a

exit 0
$ chmod -- -v 600 copy.txt
chmod 600 copy.txt
exit 0
$ chmod -- -v u+x,go-r kept.txt
chmod u+x,go-r kept.txt
exit 0
$ install -- -v -m 640 copy.txt inst/copy.txt
install -c -m 640 copy.txt inst/copy.txt
exit 0
$ install -- -p -v copy.txt inst2/
install -c -p copy.txt inst2/
exit 0
$ rm -- -v hard.txt
rm hard.txt
exit 0
$ rm -- nope
No such file or directory @ apply2files - nope (Errno::ENOENT)
exit 1
$ rm -- -f -v nope
rm -f nope
exit 0
$ rm -- -r -v linked
rm -r linked
exit 0
$ rmdir -- -p -v deep/er/est
rmdir -p deep/er/est
exit 0
$ rm -- -v glob*
rm globa globb
exit 0
$ wait_writable -- -v -n 1 moved.txt

exit 0
$ wait_writable -- missing

exit 0
$ help cp mv
Copy SOURCE to DEST, or multiple SOURCE(s) to DIRECTORY

  ruby -run -e cp -- [OPTION] SOURCE DEST

  -p          preserve file attributes if possible
  -r          copy recursively
  -l          make hard link instead of copying (implies -r)
  -v          verbose


Rename SOURCE to DEST, or move SOURCE(s) to DIRECTORY.

  ruby -run -e mv -- [OPTION] SOURCE DEST

  -v          verbose


exit 0
$ help nonesuch

exit 0
$ cp -- --help

exit 0
$ httpd
webrick is not found. You may need to `gem install webrick` to install webrick.
exit 1
a/ 755
a/deep/ 755
a/deep/er/ 755
a/deep/er/est/ 755
a/one.txt 644 "one\n"
a/t1 644 ""
copy.txt 600 "one\n"
inst/ 755
inst/copy.txt 640 "one\n"
inst2/ 755
inst2/copy.txt 600 "one\n"
kept.txt 700 "one\n"
moved.txt 644 ""
soft.txt -> t1
```
