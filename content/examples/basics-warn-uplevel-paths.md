---
title: "basics/warn/uplevel_paths.rb"
slug: basics-warn-uplevel-paths
description: "The metorex example program basics/warn/uplevel_paths.rb and its output."
---

`tests/_examples/basics/warn/uplevel_paths.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/basics/warn/uplevel_paths.rb){target=_blank rel=noopener}.

```metorex
# A warning with `uplevel:` names the file the way it was given to ruby.
$stderr = $stdout

def caution
  warn "from the caller", uplevel: 1
end

caution
warn "from here", uplevel: 0
```

Output:

```
tests/_examples/basics/warn/uplevel_paths.rb:8: warning: from the caller
tests/_examples/basics/warn/uplevel_paths.rb:9: warning: from here
```
