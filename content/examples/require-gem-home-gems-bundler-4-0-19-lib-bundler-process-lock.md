---
title: "require/gem_home/gems/bundler-4.0.19/lib/bundler/process_lock.rb"
slug: require-gem-home-gems-bundler-4-0-19-lib-bundler-process-lock
description: "The metorex example program require/gem_home/gems/bundler-4.0.19/lib/bundler/process_lock.rb and its output."
---

`tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/process_lock.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/gem_home/gems/bundler-4.0.19/lib/bundler/process_lock.rb).

```metorex
# frozen_string_literal: true

module Bundler
  class ProcessLock
    def self.lock(bundle_path = Bundler.bundle_path, &block)
      lock_file_path = File.join(bundle_path, "bundler.lock")
      base_lock_file_path = lock_file_path.delete_suffix(".lock")

      require "fileutils" if Bundler.rubygems.provides?("< 3.6.0")

      begin
        SharedHelpers.filesystem_access(lock_file_path, :write) do
          Gem.open_file_with_lock(base_lock_file_path, &block)
        end
      rescue PermissionError
        block.call
      end
    end
  end
end
```
