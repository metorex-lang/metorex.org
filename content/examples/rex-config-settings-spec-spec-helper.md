---
title: "rex/config/settings/spec/spec_helper.rb"
slug: rex-config-settings-spec-spec-helper
description: "The metorex example program rex/config/settings/spec/spec_helper.rb and its output."
---

`tests/_examples/rex/config/settings/spec/spec_helper.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/config/settings/spec/spec_helper.rb){target=_blank rel=noopener}.

```metorex
SLOW_EXPECTED = true
AUDIT_LOG = []

RSpec.configure do |config|
  config.define_derived_metadata(file_path: %r{/spec/}) do |metadata|
    metadata[:slow] = true
  end
  config.before(:context, :audited) { AUDIT_LOG << :context }
  config.before(:example, :tracked) { AUDIT_LOG << :example }
end
```
