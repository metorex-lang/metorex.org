---
title: "rex/coverage/project/lib/fees.rb"
slug: rex-coverage-project-lib-fees
description: "The metorex example program rex/coverage/project/lib/fees.rb and its output."
---

`tests/_examples/rex/coverage/project/lib/fees.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/rex/coverage/project/lib/fees.rb){target=_blank rel=noopener}.

```metorex
module Fees
  def self.for(amount)
    case amount
    when 0..100 then 1
    else 5
    end
  end
end
```
