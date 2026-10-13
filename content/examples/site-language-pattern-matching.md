---
title: "site/language_pattern_matching.rb"
slug: site-language-pattern-matching
description: "The metorex example program site/language_pattern_matching.rb and its output."
---

`tests/_examples/site/language_pattern_matching.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/site/language_pattern_matching.rb){target=_blank rel=noopener}.

```metorex
def describe(response)
  case response
  in { status: 200, body: { users: [] } }
    "no users"
  in { status: 200, body: { users: [{ name: String => name }, *rest] } }
    "#{name} and #{rest.size} more"
  in { status: 400..499 => code }
    "client error #{code}"
  in { status: Integer => code } if code >= 500
    "server error #{code}"
  end
end

puts describe({ status: 200, body: { users: [] } })
puts describe({ status: 200, body: { users: [{ name: "Ada" }, { name: "Grace" }] } })
puts describe({ status: 404 })
puts describe({ status: 503 })

config = { db: { host: "localhost", port: 5432 } }
config => { db: { port: } }
p port
```

Output:

```
no users
Ada and 1 more
client error 404
server error 503
5432
```
