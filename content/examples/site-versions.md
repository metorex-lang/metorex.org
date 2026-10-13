---
title: "site/versions.rb"
slug: site-versions
description: "The metorex example program site/versions.rb and its output."
---

`tests/_examples/site/versions.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/versions.rb){target=_blank rel=noopener}.

```metorex
require "rspec/core"

p [RUBY_ENGINE, RUBY_VERSION, RUBY_ENGINE_VERSION]
puts RSpec::Core::Version::STRING
```

Output:

```
["ruby", "4.0.6", "4.0.6"]
3.13.6
```
