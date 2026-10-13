---
title: "stdlib/rubygems_interaction_no_parens.rb"
slug: stdlib-rubygems-interaction-no-parens
description: "The metorex example program stdlib/rubygems_interaction_no_parens.rb and its output."
---

`tests/_examples/stdlib/rubygems_interaction_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/stdlib/rubygems_interaction_no_parens.rb).

```metorex
# RubyGems says things through a UI object a caller can swap, and cleans
# control characters out of text a server sent before saying it.
require "rubygems"
require "rubygems/user_interaction"
require "rubygems/gemcutter_utilities"
require "rubygems/command_manager"

class Recording < Gem::StreamUI
  attr_reader :said

  def initialize
    super nil, nil, nil, false
    @said = []
  end

  def say statement = ""
    @said << [:say, statement]
  end

  def alert_error statement, question = nil
    @said << [:error, statement]
  end

  def terminate_interaction status = 0
    @said << [:exit, status]
  end

  def backtrace exception
  end
end

cleaner = Object.new.extend Gem::Text
p cleaner.clean_text "\e]2;title\a and \u0085 text"

talker = Class.new { include Gem::UserInteraction }.new
recording = Recording.new
talker.ui = recording
talker.say "plain"
talker.verbose "hidden"
Gem.configuration.verbose = :really_verbose
talker.verbose "\e[31mshown"
Gem.configuration.verbose = true
p recording.said

found = Gem::Net::HTTPOK.new nil, nil, nil
def found.body
  "\e]2;ok\a"
end
missing = Gem::Net::HTTPNotFound.new nil, nil, nil
def missing.body
  "gone\a"
end
cutter = Class.new {
  include Gem::UserInteraction
  include Gem::GemcutterUtilities
}.new
recording = Recording.new
cutter.ui = recording
cutter.with_response found
cutter.with_response missing, "push"
p recording.said

manager = Gem::CommandManager.new
recording = Recording.new
manager.ui = recording
manager.process_args ["--\e]2;x\a"], nil
def manager.process_args args, build_args
  raise "bad\a"
end
manager.run ["anything"]
p recording.said
p Gem::SilentUI.new.say "nothing"
Gem::DefaultUserInteraction.ui = nil
```

Output:

```
".]2;title. and . text"
[[:say, "plain"], [:say, ".[31mshown"]]
[[:say, ".]2;ok."], [:say, "push: gone."], [:exit, 1]]
[[:error, "Invalid option: --.]2;x.. See 'gem --help'."], [:exit, 1], [:error, "While executing gem ... (RuntimeError)\n    bad."], [:exit, 1]]
nil
```
