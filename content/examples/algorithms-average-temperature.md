---
title: "algorithms/average_temperature.rb"
slug: algorithms-average-temperature
description: "The metorex example program algorithms/average_temperature.rb and its output."
---

`tests/_examples/algorithms/average_temperature.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/algorithms/average_temperature.rb){target=_blank rel=noopener}.

```metorex
temperatures = [68.5, 70.1, 69.8, 71.0]
total = 0

temperatures.each do |reading|
  total += reading
end

average = total / temperatures.length

puts average.round(1)
```

Output:

```
69.9
```
