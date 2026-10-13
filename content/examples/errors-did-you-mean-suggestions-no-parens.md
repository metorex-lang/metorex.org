---
title: "errors/did_you_mean_suggestions_no_parens.rb"
slug: errors-did-you-mean-suggestions-no-parens
description: "The metorex example program errors/did_you_mean_suggestions_no_parens.rb and its output."
---

`tests/_examples/errors/did_you_mean_suggestions_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/errors/did_you_mean_suggestions_no_parens.rb){target=_blank rel=noopener}.

```metorex
# Ruby appends what a misspelled name may have meant to the report of a
# NameError, NoMethodError, KeyError, LoadError or NoMatchingPatternKeyError.
require "rbconfig"
require "tmpdir"

def suggested
  yield
rescue NameError, KeyError, LoadError, NoMatchingPatternKeyError => error
  p [error.class, error.corrections]
  p error.detailed_message(highlight: false, error_highlight: false)
end

class Shelf
  def capacity = 12
  def label = "pantry"
end

first_name = "Ann"
suggested { firts_name }
suggested { [1].each { firts_name } }
suggested { Strng }
suggested { Shelf.new.capcity }
suggested { Shelf.new.lable }
suggested { {name: 1}.fetch :nme }
suggested { {"alpha" => 1}.fetch "alpah" }
suggested { {name: 1}.fetch "name" }
suggested { require "fileutil" }
suggested { case {name: 1}; in {nmae:}; end }
suggested { Shelf.new.nothing_close }

error = (Shelf.new.capcity rescue $!)
p error.detailed_message(highlight: false, error_highlight: false, did_you_mean: false)
p error.detailed_message(highlight: true, error_highlight: false)
p error.message

checker = DidYouMean::SpellChecker.new dictionary: %w[apple banana cherry]
p checker.correct("appel")
p checker.correct("bananna")
p checker.correct("grape")
paths = DidYouMean::TreeSpellChecker.new dictionary: %w[net/http net/ftp open3]
p paths.correct("net/htp")
p DidYouMean::Formatter.message_for(["first", "second"])
p DidYouMean::Formatter.message_for([])
p DidYouMean::JaroWinkler.distance("martha", "marhta").round(4)
p DidYouMean::Levenshtein.distance("kitten", "sitting")

Dir.mktmpdir do |directory|
  script = File.join directory, "missing_key.rb"
  File.write script, "raise KeyError.new(\"missing\", receiver: {name: 1}, key: :nme)\n"
  report = IO.popen [RbConfig.ruby, "missing_key.rb", err: [:child, :out], chdir: directory], &:read
  puts report.sub(/\A.*in '<main>': /, "")
  quiet = IO.popen [RbConfig.ruby, "--disable=did_you_mean", "missing_key.rb", err: [:child, :out], chdir: directory], &:read
  puts quiet.sub(/\A.*in '<main>': /, "")
end
```

Output:

```
[NameError, [:first_name]]
"undefined local variable or method 'firts_name' for main (NameError)\nDid you mean?  first_name"
[NameError, [:first_name]]
"undefined local variable or method 'firts_name' for main (NameError)\nDid you mean?  first_name"
[NameError, ["String"]]
"uninitialized constant Strng (NameError)\nDid you mean?  String"
[NoMethodError, [:capacity]]
"undefined method 'capcity' for an instance of Shelf (NoMethodError)\nDid you mean?  capacity"
[NoMethodError, [:label]]
"undefined method 'lable' for an instance of Shelf (NoMethodError)\nDid you mean?  label"
[KeyError, [":name"]]
"key not found: :nme (KeyError)\nDid you mean?  :name"
[KeyError, ["\"alpha\""]]
"key not found: \"alpah\" (KeyError)\nDid you mean?  \"alpha\""
[KeyError, [":name"]]
"key not found: \"name\" (KeyError)\nDid you mean?  :name"
[LoadError, ["fileutils"]]
"cannot load such file -- fileutil (LoadError)\nDid you mean?  fileutils"
[NoMatchingPatternKeyError, [":name"]]
"{name: 1}: key not found: :nmae (NoMatchingPatternKeyError)\nDid you mean?  :name"
[NoMethodError, []]
"undefined method 'nothing_close' for an instance of Shelf (NoMethodError)"
"undefined method 'capcity' for an instance of Shelf (NoMethodError)"
"\e[1mundefined method 'capcity' for an instance of Shelf (\e[1;4mNoMethodError\e[m\e[1m)\e[m\n\e[1mDid you mean?  capacity\e[m"
"undefined method 'capcity' for an instance of Shelf"
["apple"]
["banana"]
[]
["net/http", "net/ftp"]
"\nDid you mean?  first\n               second"
""
0.9611
3
missing (KeyError)
Did you mean?  :name
missing (KeyError)
```
