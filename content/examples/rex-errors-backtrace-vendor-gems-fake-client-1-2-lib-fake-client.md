---
title: "rex/errors/backtrace/vendor/gems/fake_client-1.2/lib/fake_client.rb"
slug: rex-errors-backtrace-vendor-gems-fake-client-1-2-lib-fake-client
description: "The metorex example program rex/errors/backtrace/vendor/gems/fake_client-1.2/lib/fake_client.rb and its output."
---

`tests/_examples/rex/errors/backtrace/vendor/gems/fake_client-1.2/lib/fake_client.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/errors/backtrace/vendor/gems/fake_client-1.2/lib/fake_client.rb){target=_blank rel=noopener}.

```metorex
module FakeClient
  def self.fetch(path)
    raise IOError, "connection refused for #{path}"
  end
end
```
