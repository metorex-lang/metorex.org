---
title: "dsl/config.rb"
slug: dsl-config
description: "The metorex example program dsl/config.rb and its output."
---

`tests/_examples/dsl/config.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/dsl/config.rb).

```metorex
# Configuration language DSL
# Demonstrates using a builder to define structured application configuration

class Config
  def initialize
    @entries = []
  end

  def set(key, value)
    @entries.push([key, value])
    self
  end

  def get(key)
    found = nil
    @entries.each do |pair|
      if pair[0] == key
        found = pair[1]
      end
    end
    found
  end
end

class AppConfig
  def initialize
    @config = Config.new
  end

  def server(host, port)
    @config.set("host", host)
    @config.set("port", "#{port}")
    self
  end

  def database(host, port)
    @config.set("db_host", host)
    @config.set("db_port", "#{port}")
    self
  end

  def debug(enabled)
    @config.set("debug", "#{enabled}")
    self
  end

  def get(key)
    @config.get(key)
  end
end

config = AppConfig.new
config.server("localhost", 8080)
config.database("db.local", 5432)
config.debug(true)

puts config.get("host")
puts config.get("port")
puts config.get("db_host")
puts config.get("db_port")
puts config.get("debug")
```

Output:

```
localhost
8080
db.local
5432
true
```
