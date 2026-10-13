---
title: "stdlib/rubygems_owner.rb"
slug: stdlib-rubygems-owner
description: "The metorex example program stdlib/rubygems_owner.rb and its output."
---

`tests/_examples/stdlib/rubygems_owner.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/rubygems_owner.rb).

```metorex
# `gem owner` says each owner a server lists, by email, handle, or id, with
# control characters cleaned out of the answer before its YAML is read.
require "rubygems"
require "rubygems/commands/owner_command"

class Recording < Gem::StreamUI
  attr_reader :said

  def initialize
    super(nil, nil, nil, false)
    @said = []
  end

  def say(statement = "")
    @said << statement
  end
end

command = Gem::Commands::OwnerCommand.new
p [command.command, command.summary, command.options]

def command.rubygems_api_request(*args)
  response = Gem::Net::HTTPOK.new(nil, nil, nil)
  def response.body
    "---\n- email: \"\e]2;title\a\"\n- handle: maintainer\n- id: 7\n"
  end
  response
end

recording = Recording.new
command.ui = recording
command.show_owners("rake")
p recording.said

p Gem::SafeYAML.safe_load("---\n- runtime\n")
Gem::DefaultUserInteraction.ui = nil
```

Output:

```
["owner", "Manage gem owners of a gem on the push server", {}]
["Owners for gem: rake", "- .]2;title. ()", "- maintainer ()", "- 7 ()"]
["runtime"]
```
