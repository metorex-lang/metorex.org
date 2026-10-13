---
title: "builtins/kernel_argument_checks_no_parens.rb"
slug: builtins-kernel-argument-checks-no-parens
description: "The metorex example program builtins/kernel_argument_checks_no_parens.rb and its output."
---

`tests/_examples/builtins/kernel_argument_checks_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/builtins/kernel_argument_checks_no_parens.rb){target=_blank rel=noopener}.

```metorex
# `exception:` takes true or false and nothing else.
[-> { Integer("12", exception: 1) }, -> { Float("1.5", exception: nil) },
 -> { Rational("1/3", exception: :no) }, -> { system("true", exception: "yes") }].each do |call|
  begin
    call.call
  rescue ArgumentError => problem
    p problem.message
  end
end
p Integer "oops", exception: false

# Integer() reads an object that spells itself as a String.
amount = Object.new
def amount.to_str
  "42"
end
p Integer amount
begin
  Integer 98, 15
rescue ArgumentError => problem
  p problem.message
end

# `caller` refuses a negative start or length, and cuts a Float to a whole
# number.
[-> { caller(-1) }, -> { caller(0, -1) }].each do |call|
  begin
    call.call
  rescue ArgumentError => problem
    p problem.message
  end
end
kept = caller 0.9, 1.9
p kept.size
depth = Object.new
def depth.to_int
  0
end
kept = caller depth
p kept.size
kept = caller(..0)
p kept.size
kept = caller(-1..)
p kept.size
p caller(100..)
p caller 100

# A format that ends inside a directive is malformed, and one that leaves
# values unread says so when $VERBOSE is on.
["%", "hello %1$", " % "].each do |format|
  begin
    format format, 1
  rescue ArgumentError => problem
    p problem.message
  end
end
module Warning
  def self.warn(message, category: nil)
    print "warned: ", message.split("warning: ").last
  end
end
$VERBOSE = true
formatted = format "%d", 1, 2
p formatted
```

Output:

```
"expected true or false as exception: 1"
"expected true or false as exception: nil"
"expected true or false as exception: :no"
"expected true or false as exception: \"yes\""
nil
42
"base specified for non string value"
"negative level (-1)"
"negative size (-1)"
1
1
1
1
nil
nil
"incomplete format specifier; use %% (double %) instead"
"malformed format string"
"malformed format string"
warned: too many arguments for format string
"1"
```
