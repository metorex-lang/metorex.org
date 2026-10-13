---
title: "stdlib_libraries/file_utilities_no_parens.rb"
slug: stdlib-libraries-file-utilities-no-parens
description: "The metorex example program stdlib_libraries/file_utilities_no_parens.rb and its output."
---

`tests/_examples/stdlib_libraries/file_utilities_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib_libraries/file_utilities_no_parens.rb){target=_blank rel=noopener}.

```metorex
# FileUtils carries every command MRI's does, each a module function a class
# can include, printing the shell command it stands for when asked to be
# verbose, and the Verbose, NoWrite and DryRun modules that always are, or
# never touch the files.
require "fileutils"
require "tmpdir"

def tree(root)
  Dir.glob("**/*", File::FNM_DOTMATCH, base: root).reject { |name| name.end_with?(".") }.sort.map do |name|
    path = File.join(root, name)
    if File.symlink?(path)
      "#{name} -> #{File.readlink(path)}"
    elsif File.directory?(path)
      "#{name}/ #{'%o' % (File.stat(path).mode & 07777)}"
    else
      "#{name} #{'%o' % (File.stat(path).mode & 07777)} #{File.read(path).inspect} links=#{File.stat(path).nlink}"
    end
  end
end

def attempt(label)
  answer = yield
  puts "#{label} => #{answer.inspect}"
rescue StandardError => error
  puts "#{label} !! #{error.class}: #{error.message.sub(Dir.pwd, '.')}"
end

Dir.mktmpdir do |root|
  Dir.chdir(root) do
    attempt("mkdir") { FileUtils.mkdir("a", verbose: true) }
    attempt("mkdir mode") { FileUtils.mkdir(%w[b c], mode: 0750, verbose: true) }
    attempt("mkdir_p") { FileUtils.mkdir_p("a/b/c/", verbose: true) }
    attempt("mkdir_p noop") { FileUtils.mkdir_p(["x/y", "z"], noop: true, verbose: true) }
    attempt("mkdir exists") { FileUtils.mkdir("a") }
    File.write("a/one.txt", "one")
    File.write("a/b/two.txt", "two")
    attempt("touch") { FileUtils.touch(["t1", "t2"], verbose: true) }
    attempt("touch nocreate") { FileUtils.touch("missing", nocreate: true, verbose: true) }
    attempt("touch mtime") { FileUtils.touch("t1", mtime: Time.at(1_000_000_000).utc, verbose: true) }
    p File.mtime("t1").to_i
    attempt("cp") { FileUtils.cp("a/one.txt", "copy.txt", verbose: true) }
    attempt("cp into dir") { FileUtils.cp(%w[a/one.txt t1], "c", verbose: true) }
    attempt("cp same") { FileUtils.cp("copy.txt", "copy.txt") }
    attempt("cp_r") { FileUtils.cp_r("a", "a2", verbose: true) }
    attempt("cp_r preserve") { FileUtils.cp_r("a", "c", preserve: true, verbose: true) }
    attempt("cp_lr") { FileUtils.cp_lr("a", "a3", verbose: true) }
    attempt("ln") { FileUtils.ln("copy.txt", "hard.txt", verbose: true) }
    attempt("ln force") { FileUtils.ln("t2", "hard.txt", force: true, verbose: true) }
    attempt("ln_s") { FileUtils.ln_s("copy.txt", "soft.txt", verbose: true) }
    attempt("ln_s exists") { FileUtils.ln_s("copy.txt", "soft.txt") }
    attempt("ln_sf") { FileUtils.ln_sf("t1", "soft.txt", verbose: true) }
    attempt("ln_sr") { FileUtils.ln_sr("a/b/two.txt", "c", verbose: true) }
    attempt("ln_s relative") { FileUtils.ln_s("a/one.txt", "a2/b/rel.txt", relative: true, verbose: true) }
    attempt("mv") { FileUtils.mv("t2", "moved", verbose: true) }
    attempt("mv into dir") { FileUtils.mv(%w[moved copy.txt], "b", verbose: true) }
    attempt("mv onto dir") { FileUtils.mv("a3", "a2") }
    attempt("mv missing force") { FileUtils.mv("nope", "nowhere", force: true, verbose: true) }
    attempt("chmod") { FileUtils.chmod(0600, "t1", verbose: true) }
    attempt("chmod symbolic") { FileUtils.chmod("u+x,go=r", "b/moved", verbose: true) }
    attempt("chmod X") { FileUtils.chmod("a-x,a+X", "a2", verbose: true) }
    attempt("chmod bad") { FileUtils.chmod("q+x", "t1") }
    attempt("chmod_R") { FileUtils.chmod_R("g+w", "a2", verbose: true) }
    attempt("install") { FileUtils.install("t1", "inst/deep/t1", mode: 0640, verbose: true) }
    attempt("install again") { FileUtils.install("t1", "inst/deep/t1", mode: "u+x", preserve: true, verbose: true) }
    attempt("install dir") { FileUtils.install("t1", "inst2/", verbose: true) }
    attempt("compare_file") { [FileUtils.compare_file("t1", "inst/deep/t1"), FileUtils.cmp("t1", "a/one.txt"), FileUtils.identical?("a/one.txt", "a2/one.txt")] }
    attempt("uptodate?") { [FileUtils.uptodate?("a/one.txt", ["t1"]), FileUtils.uptodate?("t1", ["a/one.txt"]), FileUtils.uptodate?("none", [])] }
    attempt("copy_entry") { FileUtils.copy_entry("a", "entry") }
    attempt("copy_file") { FileUtils.copy_file("a/one.txt", "file_copy") }
    attempt("copy_stream") { File.open("a/one.txt") { |source| File.open("streamed", "w") { |target| FileUtils.copy_stream(source, target) } } }
    attempt("chown self") { FileUtils.chown(nil, nil, "t1", verbose: true) }
    puts tree(".")
    attempt("rm") { FileUtils.rm(%w[streamed file_copy], verbose: true) }
    attempt("rm missing") { FileUtils.rm("nope") }
    attempt("rm_f") { FileUtils.rm_f(%w[nope t1], verbose: true) }
    attempt("rm_r") { FileUtils.rm_r("entry", verbose: true) }
    attempt("rm_rf") { FileUtils.rm_rf(%w[a3 a2 none], verbose: true) }
    attempt("rmdir") { FileUtils.rmdir("c", verbose: true) }
    attempt("rmdir parents") { FileUtils.mkdir_p("p/q/r"); FileUtils.rmdir("p/q/r", parents: true, verbose: true) }
    attempt("remove_dir") { FileUtils.remove_dir("inst2") }
    attempt("remove_dir file") { FileUtils.remove_dir("soft.txt") }
    attempt("remove_entry_secure") { FileUtils.remove_entry_secure("inst") }
    attempt("remove_file") { FileUtils.remove_file("hard.txt") }
    attempt("cd") { FileUtils.cd("a", verbose: true) { FileUtils.pwd.end_with?("/a") } }
    puts tree(".")
    attempt("Verbose") { FileUtils::Verbose.touch("v1") }
    attempt("NoWrite") { FileUtils::NoWrite.rm("v1") }
    attempt("DryRun") { FileUtils::DryRun.rm_rf("a") }
    attempt("DryRun cp") { FileUtils::DryRun.cp("v1", "v2") }
    p File.exist?("v1"), File.exist?("v2"), File.directory?("a")
    attempt("NoWrite pwd") { FileUtils::NoWrite.pwd }
    attempt("label") do
      FileUtils.instance_variable_set(:@fileutils_label, "step: ")
      FileUtils.touch("labelled", verbose: true)
    ensure
      FileUtils.remove_instance_variable(:@fileutils_label)
    end
    including = Class.new do
      include FileUtils
      def go = (mkdir_p "inc/one"; touch "inc/one/file"; cp_r "inc", "inc2"; Dir.glob("inc2/**/*").sort)
    end
    attempt("included") { including.new.go }
    attempt("private") { including.new.respond_to?(:mkdir) }
  end
end
```

Output:

```
mkdir a
mkdir => ["a"]
mkdir -m 750 b c
mkdir mode => ["b", "c"]
mkdir -p a/b/c/
mkdir_p => ["a/b/c/"]
mkdir -p x/y z
mkdir_p noop => ["x/y", "z"]
mkdir exists !! Errno::EEXIST: File exists @ dir_s_mkdir - a
touch t1 t2
touch => ["t1", "t2"]
touch -c missing
touch nocreate !! Errno::ENOENT: No such file or directory @ apply2files - missing
touch -t 200109090146.40 t1
touch mtime => ["t1"]
1000000000
cp a/one.txt copy.txt
cp => nil
cp a/one.txt t1 c
cp into dir => ["a/one.txt", "t1"]
cp same !! ArgumentError: same file: copy.txt and copy.txt
cp -r a a2
cp_r => nil
cp -rp a c
cp_r preserve => 1
cp -lr a a3
cp_lr => nil
ln copy.txt hard.txt
ln => 0
ln -f t2 hard.txt
ln force => 0
ln -s copy.txt soft.txt
ln_s => 0
ln_s exists !! Errno::EEXIST: File exists @ syserr_fail2_in - soft.txt
ln -sf t1 soft.txt
ln_sf => 0
ln -s ../a/b/two.txt c/two.txt
ln_sr => 0
ln -s ../../a/one.txt a2/b/rel.txt
ln_s relative => 0
mv t2 moved
mv => 0
mv moved copy.txt b
mv into dir => ["moved", "copy.txt"]
mv onto dir => 0
mv -f nope nowhere
mv missing force => nil
chmod 600 t1
chmod => ["t1"]
chmod u+x,go=r b/moved
chmod symbolic => ["b/moved"]
chmod a-x,a+X a2
chmod X => ["a2"]
chmod bad !! ArgumentError: invalid 'who' symbol in file mode: q
chmod -R g+w a2
chmod_R => ["a2"]
install -c -m 640 t1 inst/deep/t1
install => nil
install -c -p -m u+x t1 inst/deep/t1
install again => nil
install -c t1 inst2/
install dir => nil
compare_file => [true, false, true]
uptodate? => [true, false, false]
copy_entry => nil
copy_file => nil
copy_stream => 3
chown : t1
chown self => ["t1"]
a/ 755
a/b/ 755
a/b/c/ 755
a/b/two.txt 664 "two" links=2
a/one.txt 664 "one" links=2
a2/ 775
a2/a3/ 775
a2/a3/b/ 775
a2/a3/b/c/ 775
a2/a3/b/two.txt 664 "two" links=2
a2/a3/one.txt 664 "one" links=2
a2/b/ 775
a2/b/c/ 775
a2/b/rel.txt -> ../../a/one.txt
a2/b/two.txt 664 "two" links=1
a2/one.txt 664 "one" links=1
b/ 750
b/copy.txt 644 "one" links=1
b/moved 744 "" links=2
c/ 750
c/a/ 755
c/a/b/ 755
c/a/b/c/ 755
c/a/b/two.txt 644 "two" links=1
c/a/one.txt 644 "one" links=1
c/one.txt 644 "one" links=1
c/t1 644 "" links=1
c/two.txt -> ../a/b/two.txt
entry/ 755
entry/b/ 755
entry/b/c/ 755
entry/b/two.txt 644 "two" links=1
entry/one.txt 644 "one" links=1
file_copy 644 "one" links=1
hard.txt 744 "" links=2
inst/ 755
inst/deep/ 755
inst/deep/t1 640 "" links=1
inst2/ 755
inst2/t1 600 "" links=1
soft.txt -> t1
streamed 644 "one" links=1
t1 600 "" links=1
rm streamed file_copy
rm => ["streamed", "file_copy"]
rm missing !! Errno::ENOENT: No such file or directory @ apply2files - nope
rm -f nope t1
rm_f => ["nope", "t1"]
rm -r entry
rm_r => ["entry"]
rm -rf a3 a2 none
rm_rf => ["a3", "a2", "none"]
rmdir c
rmdir !! Errno::ENOTEMPTY: Directory not empty @ dir_s_rmdir - c
rmdir -p p/q/r
rmdir parents => ["p/q/r"]
remove_dir => 0
remove_dir file !! Errno::ENOTDIR: Not a directory - soft.txt
remove_entry_secure => nil
remove_file => 1
cd a
cd -
cd => true
a/ 755
a/b/ 755
a/b/c/ 755
a/b/two.txt 664 "two" links=1
a/one.txt 664 "one" links=1
b/ 750
b/copy.txt 644 "one" links=1
b/moved 744 "" links=1
c/ 750
c/a/ 755
c/a/b/ 755
c/a/b/c/ 755
c/a/b/two.txt 644 "two" links=1
c/a/one.txt 644 "one" links=1
c/one.txt 644 "one" links=1
c/t1 644 "" links=1
c/two.txt -> ../a/b/two.txt
soft.txt -> t1
touch v1
Verbose => ["v1"]
NoWrite => nil
rm -rf a
DryRun => nil
cp v1 v2
DryRun cp => nil
true
false
true
NoWrite pwd => nil
step: touch labelled
label => ["labelled"]
included => ["inc2/one", "inc2/one/file"]
private => false
```
