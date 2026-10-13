---
title: "syntax/special_globals.rb"
slug: syntax-special-globals
description: "The metorex example program syntax/special_globals.rb and its output."
---

`tests/_examples/syntax/special_globals.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/syntax/special_globals.rb).

```metorex
# What assigning a special global checks and stores, the aliases the
# command-line switches give some of them, and the names that cannot be
# assigned at all.

def refusal(code)
  eval(code)
  :assigned
rescue TypeError, NameError, ArgumentError => error
  [error.class, error.message]
end

p(refusal("$~ = Object.new"))
p(refusal("$stdout = nil"))
p(refusal("$! = 1"))
p(refusal("$FILENAME = 'name'"))
p(refusal("$/ = 1"))
p(refusal("$-0 = 1"))
p(refusal("$0 = nil"))
p(refusal("$. = nil"))
p(refusal("$@ = []"))

old_separator = $/
tagged = Class.new(String).new("line")
$/ = tagged
p([$/.class, $/.frozen?, $/ == tagged])
frozen = "end".freeze
$/ = frozen
p($/.equal?(frozen))
$/ = old_separator

old_line_number = $.
$. = 12.5
p($.)
counter = Object.new
def counter.to_int
  7
end
$. = counter
p($.)
$. = old_line_number

old_verbose = $VERBOSE
$VERBOSE = 1
p($VERBOSE)
$VERBOSE = old_verbose

p([$-0.equal?($/), $-I.equal?($:), $-w == $VERBOSE, $-d == $DEBUG])

begin
  raise "broken"
rescue => error
  $@ = ["here:1"]
  p(error.backtrace)
end

["nil = 1", "true = 1", "false = 1", "self = 1", "$& = 1", "$1 = 1"].each do |code|
  begin
    eval(code)
  rescue SyntaxError => error
    p(error.message[/Can't [^\n]*/])
  end
end

alias $matched_text $&
p(refusal("$matched_text = 'x'"))

"lamp".dup.force_encoding(Encoding::ISO_8859_1) =~ /(m)/
p([$&.encoding, $`.encoding, $'.encoding, $1.encoding])

outer = StandardError.new("outer")
inner = StandardError.new("inner")
seen = []
begin
  begin
    raise outer
  rescue
    raise inner
  ensure
    seen << $!
  end
rescue
  seen << $!
end
p(seen.map(&:message))

$_ = "main line"
Thread.new { $_ = "thread line" }.join
p($_)

kind, path = $LOAD_PATH.resolve_feature_path("pp")
p([kind, File.basename(path)])
p($LOAD_PATH.resolve_feature_path("no_such_feature"))

held = +"text"
held.instance_variable_set(:@mark, 1)
p([held.instance_variable_defined?(:@mark), held.instance_variable_defined?(:@other)])

warned = []
collector = Object.new
collector.define_singleton_method(:write) { |text| warned << text }
old_stderr = $stderr
$stderr = collector
old_deprecated = Warning[:deprecated]
Warning[:deprecated] = true
$VERBOSE = false
read = $=
$= = true
$, = ","
$, = nil
Warning[:deprecated] = old_deprecated
$VERBOSE = old_verbose
$stderr = old_stderr
p(warned.map { |text| text.sub(/\A.*warning: /, "") })
```

Output:

```
[TypeError, "wrong argument type Object (expected MatchData)"]
[TypeError, "$stdout must have write method, NilClass given"]
[NameError, "$! is a read-only variable"]
[NameError, "$FILENAME is a read-only variable"]
[TypeError, "value of $/ must be String"]
[TypeError, "value of $-0 must be String"]
[TypeError, "no implicit conversion of nil into String"]
[TypeError, "no implicit conversion from nil to integer"]
[ArgumentError, "$! not set"]
[String, true, true]
true
12
7
true
[true, true, true, true]
["here:1"]
"Can't assign to nil"
"Can't assign to true"
"Can't assign to false"
"Can't change the value of self"
"Can't set variable $&"
"Can't set variable $1"
[NameError, "$matched_text is a read-only variable"]
[#<Encoding:ISO-8859-1>, #<Encoding:ISO-8859-1>, #<Encoding:ISO-8859-1>, #<Encoding:ISO-8859-1>]
["inner", "inner"]
"main line"
[:rb, "pp.rb"]
nil
[true, false]
["variable $= is no longer effective\n", "variable $= is no longer effective; ignored\n", "non-nil '$,' is deprecated\n"]
```
