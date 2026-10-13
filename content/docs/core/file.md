---
title: "File"
slug: file
description: "The methods ruby/spec describes in core/file, and which Metorex implements."
---

ruby/spec describes 129 methods in `core/file`, and Metorex implements 123 of them. The parameters are what `Method#parameters` answers under Metorex.

## File

- **`File.absolute_path`**: implemented, parameters `[[:req, :name], [:opt, :directory]]`. Converts a pathname to an absolute pathname.
- **`File.absolute_path?`**: implemented, parameters `[[:req, :name]]`. Returns `true` if `file_name` is an absolute path, and `false` otherwise. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-exec).
- **`File#atime`**: implemented, parameters `[]`. Returns the last access time (a Time object) for *file*, or epoch if *file* has not been accessed. [An example calling it](/examples/filesystem-file-facts).
- **`File.atime`**: implemented, parameters `[[:req, :path]]`. Returns the last access time for the named file as a Time object.
- **`File.basename`**: implemented, parameters `[[:req, :args]]`. Returns the last component of the filename given in *file_name* (after first stripping trailing separators), which can be formed using both File::SEPARATOR and File::ALT_SEPARATOR as the separator when File::ALT_SEPARATOR is not `nil`. [An example calling it](/examples/filesystem-shift-jis-paths).
- **`File#birthtime`**: implemented, parameters `[]`. Returns the birth time for *file*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File.birthtime`**: implemented, parameters `[[:req, :path]]`. Returns the birth time for the named file. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File.blockdev?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a block device, `false` otherwise: [An example calling it](/examples/filesystem-file-facts).
- **`File.chardev?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a character device, `false` otherwise. [An example calling it](/examples/filesystem-file-facts).
- **`File#chmod`**: implemented, parameters `[[:req, :mode]]`. Changes permission bits on *file* to the bit pattern represented by *mode_int*. [An example calling it](/examples/filesystem-permission-bits).
- **`File.chmod`**: implemented, parameters `[[:req, :args]]`. Changes permission bits on the named file(s) to the bit pattern represented by *mode_int*. [An example calling it](/examples/filesystem-permission-bits).
- **`File#chown`**: implemented, parameters `[[:req, :owner], [:req, :group]]`. Changes the owner and group of *file* to the given numeric owner and group id's. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-fileutils-lib-fileutils).
- **`File.chown`**: implemented, parameters `[[:req, :args]]`. Changes the owner and group of the named file(s) to the given numeric owner and group id's. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-fileutils-lib-fileutils).
- **`File#ctime`**: implemented, parameters `[]`. Returns the change time for *file* (that is, the time directory information about the file was changed, not the file itself).
- **`File.ctime`**: implemented, parameters `[[:req, :path]]`. Returns the change time for the named file (the time at which directory information about the file was changed, not the file itself).
- **`File.delete`**: implemented, parameters `[[:req, :args]]`. Deletes the named files, returning the number of names passed as arguments. [An example calling it](/examples/filesystem-argf-streams).
- **`File.directory?`**: implemented, parameters `[[:req, :args]]`. With string `object` given, returns `true` if `path` is a string path leading to a directory, or to a symbolic link to a directory; `false` otherwise: [An example calling it](/examples/filesystem-binary-paths).
- **`File.dirname`**: implemented, parameters `[[:req, :args]]`. Returns all components of the filename given in *file_name* except the last one (after first stripping trailing separators). [An example calling it](/examples/filesystem-paths-and-locks).
- **`File.empty?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and has a zero size.
- **`File.executable?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the named file is executable by the effective user and group id of this process. [An example calling it](/examples/filesystem-permission-checks).
- **`File.executable_real?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is executable by the real user and group id of this process. [An example calling it](/examples/filesystem-permission-checks).
- **`File.exist?`**: implemented, parameters `[[:req, :args]]`. Return `true` if the named file exists. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File.exists?`**: not implemented.
- **`File.expand_path`**: implemented, parameters `[[:req, :name], [:opt, :directory]]`. Converts a pathname to an absolute pathname. [An example calling it](/examples/file-loader-wrapped-load).
- **`File.extname`**: implemented, parameters `[[:req, :args]]`. Returns the extension (the portion of file name in `path` starting from the last period). [An example calling it](/examples/filesystem-path-encodings).
- **`File.file?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if the named `file` exists and is a regular file. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File#flock`**: implemented, parameters `[[:req, :kind]]`. Locks or unlocks file `self` according to the given `locking_constant`, a bitwise OR of the values in the table below. [An example calling it](/examples/filesystem-paths-and-locks).
- **`File.fnmatch`**: implemented, parameters `[[:req, :args]]`. Returns true if `path` matches against `pattern`. [An example calling it](/examples/filesystem-glob-matching).
- **`File.fnmatch?`**: implemented, parameters `[[:req, :args]]`. Returns true if `path` matches against `pattern`.
- **`File.ftype`**: implemented, parameters `[[:req, :path]]`. Identifies the type of the named file; the return string is one of ```file`'', ```directory`'', ```characterSpecial`'', ```blockSpecial`'', ```fifo`'', ```link`'', ```socket`'', or ```unknown`''. [An example calling it](/examples/filesystem-file-facts).
- **`File.grpowned?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and the effective group id of the calling process is the owner of the file.
- **`File.identical?`**: implemented, parameters `[[:req, :one], [:req, :other]]`. Returns `true` if the named files are identical. [An example calling it](/examples/filesystem-file-facts).
- **`File#initialize`**: implemented, parameters `[[:req, :number], [:opt, :mode], [:rest, :extra], [:keyrest, :options]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`File.join`**: implemented, parameters `[[:rest, :parts]]`. Returns a new string formed by joining the strings using <code>"/"</code>. [An example calling it](/examples/file-loader-required-as-ruby).
- **`File.lchmod`**: implemented, parameters `[[:req, :args]]`. Equivalent to File::chmod, but does not follow symbolic links (so it will change the permissions associated with the link, not the file referenced by the link). [An example calling it](/examples/builtins-file-handle-reads).
- **`File.lchown`**: implemented, parameters `[[:req, :args]]`. Equivalent to File::chown, but does not follow symbolic links (so it will change the owner associated with the link, not the file referenced by the link). [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-fileutils-lib-fileutils).
- **`File.link`**: implemented, parameters `[[:req, :args]]`. Creates a new name for an existing file using a hard link. [An example calling it](/examples/filesystem-file-facts).
- **`File#lstat`**: implemented, parameters `[]`. Like File#stat, but does not follow the last symbolic link; instead, returns a File::Stat object for the link itself: [An example calling it](/examples/filesystem-file-facts).
- **`File.lstat`**: implemented, parameters `[[:req, :path]]`. Like File::stat, but does not follow the last symbolic link; instead, returns a File::Stat object for the link itself. [An example calling it](/examples/filesystem-file-facts).
- **`File.lutime`**: implemented, parameters `[[:req, :args]]`. Sets the access and modification times of each named file to the first two arguments.
- **`File.mkfifo`**: implemented, parameters `[[:req, :args]]`. Creates a FIFO special file with name *file_name*. [An example calling it](/examples/filesystem-fifo-between-threads).
- **`File#mtime`**: implemented, parameters `[]`. Returns the modification time for *file*. [An example calling it](/examples/filesystem-file-facts).
- **`File.mtime`**: implemented, parameters `[[:req, :path]]`. Returns the modification time for the named file as a Time object. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-gem-helper).
- **`File.new`**: implemented, parameters `[[:rest]]`. Opens the file at the given `path` according to the given `mode`; creates and returns a new File object for that file. [An example calling it](/examples/filesystem-stream-redirection).
- **`File.open`**: implemented, parameters `[[:req, :number], [:opt, :mode], [:rest, :extra], [:keyrest, :options]]`. Creates a new File object, via File.new with the given arguments. [An example calling it](/examples/filesystem-converted-writes).
- **`File.owned?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and the effective user id of the calling process is the owner of the file.
- **`File#path`**: implemented, parameters `[]`. If `path` is not a String: [An example calling it](/examples/file-loader-required-as-ruby).
- **`File.path`**: implemented, parameters `[[:req, :held]]`. If `path` is not a String: [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-fileutils-lib-fileutils).
- **`File.pipe?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a pipe, `false` otherwise: [An example calling it](/examples/filesystem-file-facts).
- **`File#printf`**: implemented, parameters `[[:req, :format], [:rest, :rest]]`. Formats and writes `objects` to the stream. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-thor-lib-thor-shell-column-printer).
- **`File.read`**: implemented, parameters `[[:req, :name], [:rest, :rest], [:keyrest, :options]]`. Opens the stream, reads and returns some or all of its content, and closes the stream; returns `nil` if no bytes were read. [An example calling it](/examples/filesystem-converted-writes).
- **`File.readable?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is readable by the effective user and group id of this process. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-cli-doctor-diagnose).
- **`File.readable_real?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is readable by the real user and group id of this process. [An example calling it](/examples/filesystem-permission-checks).
- **`File.readlink`**: implemented, parameters `[[:req, :args]]`. Returns the name of the file referenced by the given link. [An example calling it](/examples/filesystem-file-facts).
- **`File.realdirpath`**: implemented, parameters `[[:req, :args]]`. Returns the real (absolute) pathname of *pathname* in the actual filesystem. [An example calling it](/examples/filesystem-path-encodings).
- **`File.realpath`**: implemented, parameters `[[:req, :args]]`. Returns the real (absolute) pathname of *pathname* in the actual filesystem not containing symlinks or useless dots. [An example calling it](/examples/filesystem-path-encodings).
- **`File.rename`**: implemented, parameters `[[:req, :args]]`. Renames the given file to the new name. [An example calling it](/examples/filesystem-shift-jis-paths).
- **`File#reopen`**: implemented, parameters `[[:req, :target], [:opt, :mode]]`. Reassociates the stream with another stream, which may be of a different class. [An example calling it](/examples/filesystem-reopened-streams).
- **`File.setgid?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file has the setgid bit set.
- **`File.setuid?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file has the setuid bit set. [An example calling it](/examples/filesystem-file-facts).
- **`File#size`**: implemented, parameters `[]`. Returns the size of *file* in bytes. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File.size`**: implemented, parameters `[[:req, :args]]`. Returns the size of `file_name`. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File.size?`**: implemented, parameters `[[:req, :args]]`. Returns `nil` if `file_name` doesn't exist or has zero size, the size of the file otherwise. [An example calling it](/examples/runtime-daemonizing).
- **`File.socket?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if `filepath` points to a socket, `false` otherwise: [An example calling it](/examples/filesystem-file-facts).
- **`File.split`**: implemented, parameters `[[:req, :args]]`. Splits the given string into a directory and a file component and returns them in a two-element array. [An example calling it](/examples/filesystem-path-encodings).
- **`File.stat`**: implemented, parameters `[[:req, :path]]`. Returns a File::Stat object for the file at `filepath` (see File::Stat): [An example calling it](/examples/filesystem-file-facts).
- **`File.sticky?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file has the sticky bit set. [An example calling it](/examples/filesystem-file-facts).
- **`File.symlink`**: implemented, parameters `[[:req, :args]]`. Creates a symbolic link called *new_name* for the existing file *old_name*. [An example calling it](/examples/filesystem-file-facts).
- **`File.symlink?`**: implemented, parameters `[[:req, :args]]`. Returns `true` if `filepath` points to a symbolic link, `false` otherwise: [An example calling it](/examples/filesystem-binary-paths).
- **`File#to_path`**: implemented, parameters `[]`. Returns the path associated with the IO, or `nil` if there is no path associated with the IO. [An example calling it](/examples/filesystem-walking-a-directory).
- **`File#truncate`**: implemented, parameters `[[:req, :length]]`. Truncates *file* to at most *integer* bytes. [An example calling it](/examples/filesystem-descriptor-streams).
- **`File.truncate`**: implemented, parameters `[[:req, :name], [:req, :length]]`. Truncates the file *file_name* to be at most *integer* bytes long.
- **`File.umask`**: implemented, parameters `[[:req, :args]]`. Returns the current umask value for this process. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-installer).
- **`File.unlink`**: implemented, parameters `[[:req, :args]]`. Deletes the named files, returning the number of names passed as arguments. [An example calling it](/examples/filesystem-system-call-errors).
- **`File.utime`**: implemented, parameters `[[:req, :args]]`. Sets the access and modification times of each named file to the first two arguments. [An example calling it](/examples/filesystem-file-facts).
- **`File.world_readable?`**: implemented, parameters `[[:req, :path]]`. If *file_name* is readable by others, returns an integer representing the file permission bits of *file_name*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File.world_writable?`**: implemented, parameters `[[:req, :path]]`. If *file_name* is writable by others, returns an integer representing the file permission bits of *file_name*.
- **`File.writable?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is writable by the effective user and group id of this process. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler).
- **`File.writable_real?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file is writable by the real user and group id of this process. [An example calling it](/examples/filesystem-permission-checks).
- **`File.zero?`**: implemented, parameters `[[:req, :path]]`. Returns `true` if the named file exists and has a zero size. [An example calling it](/examples/filesystem-file-facts).

## File::Constants::

- **`File::Constants::#{const}`**: not implemented.

## File::Stat

- **`File::Stat#<=>`**: implemented, parameters `[[:req, :other]]`. Compares `self` and `other`, by comparing their modification times; that is, by comparing <code>self.mtime</code> and <code>other.mtime</code>.
- **`File::Stat#atime`**: implemented, parameters `[]`. Returns the last access time for this file as an object of class Time. [An example calling it](/examples/filesystem-file-facts).
- **`File::Stat#birthtime`**: implemented, parameters `[]`. Returns the birth time for *stat*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#blksize`**: implemented, parameters `[]`. Returns the native file system's block size. [An example calling it](/examples/filesystem-file-facts).
- **`File::Stat#blockdev?`**: implemented, parameters `[]`. Returns `true` if the file is a block device, `false` if it isn't or if the operating system doesn't support this feature. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#blocks`**: implemented, parameters `[]`. Returns the number of native file system blocks allocated for this file, or `nil` if the operating system doesn't support this feature. [An example calling it](/examples/methods-def-in-instance-exec-from-a-block).
- **`File::Stat#chardev?`**: implemented, parameters `[]`. Returns `true` if the file is a character device, `false` if it isn't or if the operating system doesn't support this feature. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#ctime`**: implemented, parameters `[]`. Returns the change time for *stat* (that is, the time directory information about the file was changed, not the file itself).
- **`File::Stat#dev`**: implemented, parameters `[]`. Returns an integer representing the device on which *stat* resides. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-lazy-specification).
- **`File::Stat#dev_major`**: implemented, parameters `[]`. Returns the major part of <code>File_Stat#dev</code> or `nil`.
- **`File::Stat#dev_minor`**: implemented, parameters `[]`. Returns the minor part of <code>File_Stat#dev</code> or `nil`.
- **`File::Stat#directory?`**: implemented, parameters `[]`. Returns `true` if *stat* is a directory, `false` otherwise. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#executable?`**: implemented, parameters `[]`. Returns `true` if *stat* is executable or if the operating system doesn't distinguish executable files from nonexecutable files. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#executable_real?`**: implemented, parameters `[]`. Same as <code>executable?</code>, but tests using the real owner of the process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#file?`**: implemented, parameters `[]`. Returns `true` if *stat* is a regular file (not a device file, pipe, socket, etc.). [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#ftype`**: implemented, parameters `[]`. Identifies the type of *stat*. [An example calling it](/examples/builtins-file-handle-reads).
- **`File::Stat#gid`**: implemented, parameters `[]`. Returns the numeric group id of the owner of *stat*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#grpowned?`**: implemented, parameters `[]`. Returns true if the effective group id of the process is the same as the group id of *stat*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#initialize`**: implemented, parameters `[[:req, :path], [:opt, :follow]]`. [An example calling it](/examples/errors-private-kernel-calls).
- **`File::Stat#ino`**: implemented, parameters `[]`. Returns the inode number for *stat*. [An example calling it](/examples/require-gem-home-gems-bundler-4-0-19-lib-bundler-vendor-fileutils-lib-fileutils).
- **`File::Stat#inspect`**: implemented, parameters `[]`. Produce a nicely formatted description of *stat*. [An example calling it](/examples/addresses-internet-addresses).
- **`File::Stat#mode`**: implemented, parameters `[]`. Returns an integer representing the permission bits of *stat*. [An example calling it](/examples/c-extensions-c-io).
- **`File::Stat#mtime`**: implemented, parameters `[]`. Returns the modification time of *stat*. [An example calling it](/examples/filesystem-file-facts).
- **`File::Stat#nlink`**: implemented, parameters `[]`. Returns the number of hard links to *stat*. [An example calling it](/examples/filesystem-file-facts).
- **`File::Stat#owned?`**: implemented, parameters `[]`. Returns `true` if the effective user id of the process is the same as the owner of *stat*. [An example calling it](/examples/advanced-threads-that-wake).
- **`File::Stat#pipe?`**: implemented, parameters `[]`. Returns `true` if the operating system supports pipes and *stat* is a pipe; `false` otherwise. [An example calling it](/examples/builtins-file-handle-reads).
- **`File::Stat#rdev`**: implemented, parameters `[]`. Returns an integer representing the device type on which *stat* resides.
- **`File::Stat#rdev_major`**: implemented, parameters `[]`. Returns the major part of <code>File_Stat#rdev</code> or `nil`.
- **`File::Stat#rdev_minor`**: implemented, parameters `[]`. Returns the minor part of <code>File_Stat#rdev</code> or `nil`.
- **`File::Stat#readable?`**: implemented, parameters `[]`. Returns `true` if *stat* is readable by the effective user id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#readable_real?`**: implemented, parameters `[]`. Returns `true` if *stat* is readable by the real user id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#setgid?`**: implemented, parameters `[]`. Returns `true` if *stat* has the set-group-id permission bit set, `false` if it doesn't or if the operating system doesn't support this feature. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#setuid?`**: implemented, parameters `[]`. Returns `true` if *stat* has the set-user-id permission bit set, `false` if it doesn't or if the operating system doesn't support this feature. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#size`**: implemented, parameters `[]`. Returns the size of *stat* in bytes. [An example calling it](/examples/advanced-threads-wait-on-processes-and-sockets).
- **`File::Stat.size`**: not implemented. Returns the size of *stat* in bytes.
- **`File::Stat#size?`**: implemented, parameters `[]`. Returns `nil` if *stat* is a zero-length file, the size of the file otherwise. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat.size?`**: not implemented. Returns `nil` if *stat* is a zero-length file, the size of the file otherwise.
- **`File::Stat#socket?`**: implemented, parameters `[]`. Returns `true` if *stat* is a socket, `false` if it isn't or if the operating system doesn't support this feature. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#sticky?`**: implemented, parameters `[]`. Returns `true` if *stat* has its sticky bit set, `false` if it doesn't or if the operating system doesn't support this feature. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#symlink?`**: implemented, parameters `[]`. Returns `true` if *stat* is a symbolic link, `false` if it isn't or if the operating system doesn't support this feature. [An example calling it](/examples/builtins-file-handle-reads).
- **`File::Stat#uid`**: implemented, parameters `[]`. Returns the numeric user id of the owner of *stat*. [An example calling it](/examples/filesystem-file-facts).
- **`File::Stat#world_readable?`**: implemented, parameters `[]`. If *stat* is readable by others, returns an integer representing the file permission bits of *stat*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat.world_readable?`**: not implemented. If *stat* is readable by others, returns an integer representing the file permission bits of *stat*.
- **`File::Stat#world_writable?`**: implemented, parameters `[]`. If *stat* is writable by others, returns an integer representing the file permission bits of *stat*. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat.world_writable?`**: not implemented. If *stat* is writable by others, returns an integer representing the file permission bits of *stat*.
- **`File::Stat#writable?`**: implemented, parameters `[]`. Returns `true` if *stat* is writable by the effective user id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#writable_real?`**: implemented, parameters `[]`. Returns `true` if *stat* is writable by the real user id of this process. [An example calling it](/examples/filesystem-asking-about-a-file).
- **`File::Stat#zero?`**: implemented, parameters `[]`. Returns `true` if *stat* is a zero-length file; `false` otherwise. [An example calling it](/examples/advanced-threads-take-turns).

The method summaries are the first sentences of Ruby's own documentation for each method, read from MRI 4.0.6's ri data. Ruby's documentation is distributed under [Ruby's license](https://www.ruby-lang.org/en/about/license.txt){target=_blank rel=noopener}.
