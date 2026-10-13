---
title: "advanced/serialization.rb"
slug: advanced-serialization
description: "The metorex example program advanced/serialization.rb and its output."
---

`tests/_examples/advanced/serialization.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/advanced/serialization.rb).

```metorex
data = {name: "Atlas", age: 30}
json = JSON.encode(data)
puts json

parsed = JSON.decode(json)
puts parsed

yaml = YAML.encode(data)
puts yaml
```
