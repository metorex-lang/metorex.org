---
title: "rex/metadata/shared/spec/spec_helper.rb"
slug: rex-metadata-shared-spec-spec-helper
description: "The metorex example program rex/metadata/shared/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/metadata/shared/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/metadata/shared/spec/spec_helper.rb).

```metorex
require "support/collection_examples"

RSpec.configure do |config|
  config.include_context "with a logger", :logged
end
```
