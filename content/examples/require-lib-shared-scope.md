---
title: "require/lib/shared_scope.rb"
slug: require-lib-shared-scope
description: "The metorex example program require/lib/shared_scope.rb and its output."
---

`tests/_examples/require/lib/shared_scope.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/require/lib/shared_scope.rb){target=_blank rel=noopener}.

```metorex
# Defines a constant, a method, and a class for the scope sharing test. A
# local variable would not be shared, since each file keeps its own.
SHARED_VALUE = "shared value"

def shared_function
  "shared function result"
end

class SharedClass
  def initialize
    @name = "SharedClass instance"
  end

  def name
    @name
  end
end
```
