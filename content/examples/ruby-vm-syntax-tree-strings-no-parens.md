---
title: "ruby_vm/syntax_tree_strings_no_parens.rb"
slug: ruby-vm-syntax-tree-strings-no-parens
description: "The metorex example program ruby_vm/syntax_tree_strings_no_parens.rb and its output."
---

`tests/_examples/ruby_vm/syntax_tree_strings_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/ruby_vm/syntax_tree_strings_no_parens.rb).

```metorex
# RubyVM::AbstractSyntaxTree names each string, symbol, regexp, word list
# and heredoc the way MRI's parser does: how interpolated parts are joined,
# where each part is written, and how a regexp is read as a condition.

def dump(node)
  case node
  when RubyVM::AbstractSyntaxTree::Node
    inner = node.children.map { |child| dump(child) }.join(", ")
    "#{node.type}@#{node.first_lineno}:#{node.first_column}-#{node.last_lineno}:#{node.last_column}(#{inner})"
  when Array
    "[#{node.map { |item| dump(item) }.join(", ")}]"
  else
    node.inspect
  end
end

SOURCES = [
  "\"a\#{b}c\"",
  "\"\#{b}\"",
  "\"a\#{b}\"",
  "\"\#{b}c\"",
  "\"\#{1}\#{2}\"",
  "\"a\#{}b\"",
  "\"a\#@x\"",
  "\"a\#$y\"",
  "\"a\#@@z\"",
  "'a' \"\#{b}\"",
  "\"\#{a}\" 'b'",
  "\"a\" \"b\#{c}\"",
  "`ls`",
  "`ls \#{d}`",
  ":\"a\#{b}\"",
  ":\"ab\"",
  "%s(ab)",
  "/ab/",
  "/a\#{b}c/",
  "/ab/i",
  "/a\#{b}/o",
  "/a\#{b}/m",
  "x = 1; /a\#{x}/",
  "/(?<n>a)/ =~ s",
  "s =~ /a/",
  "/a/ =~ s",
  "/a/",
  "if /a/ then 1 end",
  "a =~ b",
  "a !~ b",
  "\"a\" =~ /b/",
  "%w[a b]",
  "%i[a b]",
  "%W[a\#{b} c]",
  "%I[a\#{b} c]",
  "%q(a)",
  "%Q(a\#{b})",
  "\"\\n\"",
  "\"a\\u00e9\"",
  "?a",
  "<<~EOS\n  a\n  \#{b}\nEOS",
  "<<-EOS\na\nEOS",
  "<<EOS\na\#{b}\nEOS",
  "x = <<~A\n  hi\nA",
  "foo(<<~A, 1)\n  hi\nA",
  "BEGIN { 1 }",
  "END { 1 }",
  "BEGIN { 1 }; 2",
  "at_exit { 1 }",
  "\"a\" \"b\"",
  "\"a\" \\\n \"b\"",
  "\"\#{\"\#{a}\"}\"",
  "\"a\#{b}c\#{d}e\"",
  "\"a\#{b}\" \"c\"",
  "\"a\#{b}\" \"c\#{d}\"",
  "\"\#{a}b\" \"c\"",
  "\"\#{a}\" \"\#{b}\"",
  "\"a\" \"\#{b}\" \"c\"",
  "\"a\" \"b\" \"\#{c}\"",
  "\"\#{a}b\" \"c\#{d}e\"",
  "<<EOS\nx\na\#{b}\nEOS",
  "<<EOS\nx\#{b}y\nz\nEOS",
  "<<EOS\n\#{b}\nEOS",
  "<<-EOS\n  a\#{b}\n  EOS",
  "<<~EOS\n  x\n    y\#{b}z\n  w\nEOS",
  "<<~EOS\n  \#{b}\nEOS",
  "<<EOS\nplain\ntext\nEOS",
  "<<~EOS\nplain\nEOS",
  "x; BEGIN { 1 }",
  "BEGIN { 1 }; BEGIN { 2 }",
  "BEGIN { }",
  "END { }",
  "\"\\x41\"",
  "'a\\'b'",
  "\"a\\\nb\"",
  "/a\#{b}c/ix",
  "/a/n",
  "%r{a/b}",
  "\"\#{a}\#{b}\" =~ c",
  "/(?<n>a)(?<m>b)/ =~ s",
  "/\#{a}(?<n>b)/ =~ s",
  "x = /(?<n>a)/ =~ s",
  "if /(?<n>a)/ =~ s then n end",
  "\"a\" + \"b\"",
  ":a",
  "%s(a b)",
  ":\"a b\"",
  "\"a\#$1\"",
  "\"a\#{b; c}\"",
  "<<EOS\na\#{b}c\#{d}e\nEOS",
  "<<EOS\na\#{b}\nc\#{d}\nEOS",
  "\"a\#{\"x\"}\"",
  "\"\#{\"x\"}\"",
  "\"a\#{\"x\#{y}\"}\"",
  "`\#{a}`",
  ":\"\#{a}\"",
  "/\#{a}/",
  "\"\"",
  "``",
  ":\"\"",
  "//",
  "<<EOS\nEOS",
  "<<~EOS\nEOS",
  "<<`EOS`\nls \#{a}\nEOS",
  "END { y = 1 }",
  "x = 1; END { x }",
  "%w[]",
  "%W[\#{a}]",
  "%W[a\#{b}c d]",
  "%I[]",
  "%i[a]",
  "if \"\#{a}\" then 1 end",
  "if /\#{a}/ then 1 end",
  "if a && /b/ then 1 end",
  "if !/b/ then 1 end",
  "if (/b/) then 1 end",
  "while /b/ do end",
  "%q(a\\)b)",
  "'a\\\\b'",
  "\"\\u{1F600}x\"",
  "\"é\#{a}\"",
  "<<EOS\n\\tx\#{a}\nEOS",
  "<<'EOS'\n\\tx\nEOS",
  "%w[a\\ b c]",
  "?\\n",
  ":\"a\\nb\"",
  "%s()",
  "/\\//",
  "%r{\\d+}x",
  "\"\\e\\s\"",
  "\"\\101\"",
  "\"\\x4A\"",
  "\"a\" 'b' \"c\"",
  "x = \"a\#{1}\"; y",
  "\"\#{}\"",
  "\"a\#{nil}b\"",
  "`a` `b`",
  "/a/i =~ s",
  "s !~ /a/",
  "p \"a\#{b}\"",
  "p /a/",
  "foo(\"\#{a}\")",
  "[/a/, :\"b\#{c}\", `d`]",
  "{\"a\" => 1, \"b\#{c}\" => 2}",
  "a = \"x\" \"y\#{z}\"",
  "x = /(?<year>\\d+)-(?<mon>\\d+)/ =~ d; year",
  "END { BEGIN_X = 1 }",
  "\"a\#{b}c\#{d}\"",
  "\"a\#{b}c\" \"\#{d}\"",
  "\"a\#{b}c\" \"d\"",
  "\"\#{a}\#{b}\" \"c\"",
  "\"\#{a}\#{b}\#{c}\"",
  "\"a\#{b}\#{c}d\"",
  "\"a\#{b}c\" \"d\#{e}\"",
  "`a\#{b}c\#{d}`",
  "/a\#{b}c\#{d}/",
  ":\"a\#{b}c\#{d}\"",
  "\"\#{a}b\#{c}d\"",
  "\"a\#{b}c\#{d}e\#{f}\"",
  "\"a\#{b}c\#{d}e\#{f}g\"",
  "\"a\#{b}cc\#{d}ee\"",
  "\"a\#{b}c\#{d}\#{e}f\"",
  "\"\#{a}b\#{c}\"",
  "\"a\#{b}c\#{d}e\" \"x\"",
  "\"\\xFFé\"",
  "\"a\\xE9b\"",
  "\"\\u00e9\\x41\"",
  "if 1..2 then end",
  "if a..b then end",
  "x if (a..b)",
  "x if !(a..b)",
  "x if begin; /a/; end",
  "x while /a/",
  "a ? /b/ : 1",
  "x if a and (b..c)",
  "END { y }",
  "END { 1; 2 }",
  "END { foo }",
].freeze

SOURCES.each do |source|
  puts dump(RubyVM::AbstractSyntaxTree.parse(source))
rescue SyntaxError
  puts "SyntaxError"
end
```

Output:

```
SCOPE@1:0-1:8([], nil, DSTR@1:0-1:8("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), nil)))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("", EVSTR@1:0-1:6(VCALL@1:3-1:4(:b)), nil))
SCOPE@1:0-1:7([], nil, DSTR@1:0-1:7("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), nil))
SCOPE@1:0-1:7([], nil, DSTR@1:0-1:7("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:b)), LIST@1:5-1:6(STR@1:5-1:6("c"), nil)))
SCOPE@1:0-1:10([], nil, DSTR@1:0-1:10("", EVSTR@1:1-1:5(INTEGER@1:3-1:4(1)), LIST@1:5-1:9(EVSTR@1:5-1:9(INTEGER@1:7-1:8(2)), nil)))
SCOPE@1:0-1:7([], nil, DSTR@1:0-1:7("a", EVSTR@1:2-1:5(BEGIN@1:4-1:4(nil)), LIST@1:5-1:6(STR@1:5-1:6("b"), nil)))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("a", EVSTR@1:2-1:5(IVAR@1:3-1:5(:@x)), nil))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("a", EVSTR@1:2-1:5(GVAR@1:3-1:5(:$y)), nil))
SCOPE@1:0-1:7([], nil, DSTR@1:0-1:7("a", EVSTR@1:2-1:6(CVAR@1:3-1:6(:@@z)), nil))
SCOPE@1:0-1:10([], nil, DSTR@1:0-1:10("a", EVSTR@1:4-1:10(VCALL@1:7-1:8(:b)), nil))
SCOPE@1:0-1:10([], nil, DSTR@1:0-1:10("", EVSTR@1:0-1:6(VCALL@1:3-1:4(:a)), LIST@1:7-1:10(STR@1:7-1:10("b"), nil)))
SCOPE@1:0-1:11([], nil, DSTR@1:4-1:11("ab", EVSTR@1:6-1:10(VCALL@1:8-1:9(:c)), nil))
SCOPE@1:0-1:4([], nil, XSTR@1:0-1:4("ls"))
SCOPE@1:0-1:9([], nil, DXSTR@1:0-1:9("ls ", EVSTR@1:4-1:8(VCALL@1:6-1:7(:d)), nil))
SCOPE@1:0-1:8([], nil, DSYM@1:0-1:8("a", EVSTR@1:3-1:7(VCALL@1:5-1:6(:b)), nil))
SCOPE@1:0-1:5([], nil, SYM@1:0-1:5(:ab))
SCOPE@1:0-1:6([], nil, SYM@1:0-1:6(:ab))
SCOPE@1:0-1:4([], nil, REGX@1:0-1:4(/ab/))
SCOPE@1:0-1:8([], nil, DREGX@1:0-1:8("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), nil)))
SCOPE@1:0-1:5([], nil, REGX@1:0-1:5(/ab/i))
SCOPE@1:0-1:8([], nil, ONCE@1:0-1:8(DREGX@1:0-1:8("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), nil)))
SCOPE@1:0-1:8([], nil, DREGX@1:0-1:8("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), nil))
SCOPE@1:0-1:14([:x], nil, BLOCK@1:0-1:14(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), DREGX@1:7-1:14("a", EVSTR@1:9-1:13(LVAR@1:11-1:12(:x)), nil)))
SCOPE@1:0-1:14([:n], nil, MATCH2@1:0-1:14(REGX@1:0-1:9(/(?<n>a)/), VCALL@1:13-1:14(:s), BLOCK@1:0-1:14(LASGN@1:0-1:14(:n, SYM@1:0-1:14(:n)))))
SCOPE@1:0-1:8([], nil, CALL@1:0-1:8(VCALL@1:0-1:1(:s), :=~, LIST@1:5-1:8(REGX@1:5-1:8(/a/), nil)))
SCOPE@1:0-1:8([], nil, MATCH2@1:0-1:8(REGX@1:0-1:3(/a/), VCALL@1:7-1:8(:s)))
SCOPE@1:0-1:3([], nil, REGX@1:0-1:3(/a/))
SCOPE@1:0-1:17([], nil, IF@1:0-1:17(MATCH@1:3-1:6(/a/), INTEGER@1:12-1:13(1), nil))
SCOPE@1:0-1:6([], nil, CALL@1:0-1:6(VCALL@1:0-1:1(:a), :=~, LIST@1:5-1:6(VCALL@1:5-1:6(:b), nil)))
SCOPE@1:0-1:6([], nil, OPCALL@1:0-1:6(VCALL@1:0-1:1(:a), :!~, LIST@1:5-1:6(VCALL@1:5-1:6(:b), nil)))
SCOPE@1:0-1:10([], nil, CALL@1:0-1:10(STR@1:0-1:3("a"), :=~, LIST@1:7-1:10(REGX@1:7-1:10(/b/), nil)))
SCOPE@1:0-1:7([], nil, LIST@1:0-1:7(STR@1:3-1:4("a"), STR@1:5-1:6("b"), nil))
SCOPE@1:0-1:7([], nil, LIST@1:0-1:7(SYM@1:3-1:4(:a), SYM@1:5-1:6(:b), nil))
SCOPE@1:0-1:11([], nil, LIST@1:0-1:11(DSTR@1:3-1:8("a", EVSTR@1:4-1:8(VCALL@1:6-1:7(:b)), nil), STR@1:9-1:10("c"), nil))
SCOPE@1:0-1:11([], nil, LIST@1:0-1:11(DSYM@1:3-1:8("a", EVSTR@1:4-1:8(VCALL@1:6-1:7(:b)), nil), SYM@1:9-1:10(:c), nil))
SCOPE@1:0-1:5([], nil, STR@1:0-1:5("a"))
SCOPE@1:0-1:9([], nil, DSTR@1:0-1:9("a", EVSTR@1:4-1:8(VCALL@1:6-1:7(:b)), nil))
SCOPE@1:0-1:4([], nil, STR@1:0-1:4("\n"))
SCOPE@1:0-1:9([], nil, STR@1:0-1:9("aé"))
SCOPE@1:0-1:2([], nil, STR@1:0-1:2("a"))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("a\n", EVSTR@3:2-3:6(VCALL@3:4-3:5(:b)), LIST@3:6-3:7(STR@3:6-3:7("\n"), nil)))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("a\n"))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("a", EVSTR@2:1-2:5(VCALL@2:3-2:4(:b)), LIST@1:5-1:5(STR@1:5-1:5("\n"), nil)))
SCOPE@1:0-1:8([:x], nil, LASGN@1:0-1:8(:x, STR@1:4-1:8("hi\n")))
SCOPE@1:0-1:12([], nil, FCALL@1:0-1:12(:foo, LIST@1:4-1:11(STR@1:4-1:8("hi\n"), INTEGER@1:10-1:11(1), nil)))
SCOPE@1:0-1:11([], nil, BLOCK@1:6-1:11(BEGIN@1:6-1:11(INTEGER@1:8-1:9(1)), BEGIN@1:6-1:11(nil)))
SCOPE@1:0-1:9([], nil, POSTEXE@1:0-1:9(SCOPE@1:0-1:9([], nil, INTEGER@1:6-1:7(1))))
SCOPE@1:0-1:14([], nil, BLOCK@1:6-1:14(BEGIN@1:6-1:11(INTEGER@1:8-1:9(1)), BEGIN@1:6-1:11(nil), INTEGER@1:13-1:14(2)))
SCOPE@1:0-1:13([], nil, ITER@1:0-1:13(FCALL@1:0-1:7(:at_exit, nil), SCOPE@1:8-1:13([], nil, INTEGER@1:10-1:11(1))))
SCOPE@1:0-1:7([], nil, STR@1:0-1:3("ab"))
SCOPE@1:0-2:4([], nil, STR@1:0-1:3("ab"))
SCOPE@1:0-1:11([], nil, DSTR@1:0-1:11("", EVSTR@1:0-1:11(DSTR@1:3-1:9("", EVSTR@1:3-1:9(VCALL@1:6-1:7(:a)), nil)), nil))
SCOPE@1:0-1:13([], nil, DSTR@1:0-1:13("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), STR@1:11-1:12("e"), nil)))
SCOPE@1:0-1:11([], nil, DSTR@1:0-1:11("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:8-1:11(STR@1:8-1:11("c"), nil)))
SCOPE@1:0-1:15([], nil, DSTR@1:0-1:15("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:0-1:15(STR@1:0-1:15("c"), EVSTR@1:10-1:14(VCALL@1:12-1:13(:d)), nil)))
SCOPE@1:0-1:11([], nil, DSTR@1:0-1:7("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:6(STR@1:5-1:6("bc"), nil)))
SCOPE@1:0-1:13([], nil, DSTR@1:0-1:13("", EVSTR@1:0-1:6(VCALL@1:3-1:4(:a)), LIST@1:7-1:13(EVSTR@1:7-1:13(VCALL@1:10-1:11(:b)), nil)))
SCOPE@1:0-1:14([], nil, DSTR@1:0-1:14("a", EVSTR@1:4-1:10(VCALL@1:7-1:8(:b)), LIST@1:11-1:14(STR@1:11-1:14("c"), nil)))
SCOPE@1:0-1:14([], nil, DSTR@1:0-1:14("ab", EVSTR@1:8-1:14(VCALL@1:11-1:12(:c)), nil))
SCOPE@1:0-1:16([], nil, DSTR@1:0-1:7("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:6(STR@1:5-1:6("bc"), EVSTR@1:10-1:14(VCALL@1:12-1:13(:d)), STR@1:14-1:15("e"), nil)))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("x\na", EVSTR@3:1-3:5(VCALL@3:3-3:4(:b)), LIST@1:5-1:5(STR@1:5-1:5("\n"), nil)))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("x", EVSTR@2:1-2:5(VCALL@2:3-2:4(:b)), LIST@1:5-1:5(STR@1:5-1:5("y\nz\n"), nil)))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("", EVSTR@2:0-2:4(VCALL@2:2-2:3(:b)), LIST@1:5-1:5(STR@1:5-1:5("\n"), nil)))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("  a", EVSTR@2:3-2:7(VCALL@2:5-2:6(:b)), LIST@1:6-1:6(STR@1:6-1:6("\n"), nil)))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("x\n  y", EVSTR@3:5-3:9(VCALL@3:7-3:8(:b)), LIST@3:9-3:11(STR@3:9-3:11("z\nw\n"), nil)))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("", EVSTR@2:2-2:6(VCALL@2:4-2:5(:b)), LIST@2:6-2:7(STR@2:6-2:7("\n"), nil)))
SCOPE@1:0-1:5([], nil, STR@1:0-1:5("plain\ntext\n"))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("plain\n"))
SCOPE@1:0-1:14([], nil, BLOCK@1:9-1:14(BEGIN@1:9-1:14(INTEGER@1:11-1:12(1)), VCALL@1:0-1:1(:x), BEGIN@1:9-1:14(nil)))
SCOPE@1:0-1:24([], nil, BLOCK@1:6-1:24(BEGIN@1:6-1:11(INTEGER@1:8-1:9(1)), BEGIN@1:19-1:24(INTEGER@1:21-1:22(2)), BEGIN@1:6-1:11(nil), BEGIN@1:19-1:24(nil)))
SCOPE@1:0-1:9([], nil, BLOCK@1:6-1:9(BEGIN@1:6-1:9(BEGIN@1:7-1:7(nil)), BEGIN@1:6-1:9(nil)))
SCOPE@1:0-1:7([], nil, POSTEXE@1:0-1:7(SCOPE@1:0-1:7([], nil, BEGIN@1:5-1:5(nil))))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("A"))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("a'b"))
SCOPE@1:0-2:2([], nil, STR@1:0-2:2("ab"))
SCOPE@1:0-1:10([], nil, DREGX@1:0-1:10("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), nil)))
SCOPE@1:0-1:4([], nil, REGX@1:0-1:4(/a/n))
SCOPE@1:0-1:7([], nil, REGX@1:0-1:7(/a\/b/))
SCOPE@1:0-1:15([], nil, CALL@1:0-1:15(DSTR@1:0-1:10("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:9(EVSTR@1:5-1:9(VCALL@1:7-1:8(:b)), nil)), :=~, LIST@1:14-1:15(VCALL@1:14-1:15(:c), nil)))
SCOPE@1:0-1:21([:n, :m], nil, MATCH2@1:0-1:21(REGX@1:0-1:16(/(?<n>a)(?<m>b)/), VCALL@1:20-1:21(:s), BLOCK@1:0-1:21(LASGN@1:0-1:21(:n, SYM@1:0-1:21(:n)), LASGN@1:0-1:21(:m, SYM@1:0-1:21(:m)))))
SCOPE@1:0-1:18([], nil, MATCH2@1:0-1:18(DREGX@1:0-1:13(nil, EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:12(STR@1:5-1:12("(?<n>b)"), nil)), VCALL@1:17-1:18(:s)))
SCOPE@1:0-1:18([:x, :n], nil, LASGN@1:0-1:18(:x, MATCH2@1:4-1:18(REGX@1:4-1:13(/(?<n>a)/), VCALL@1:17-1:18(:s), BLOCK@1:4-1:18(LASGN@1:4-1:18(:n, SYM@1:4-1:18(:n))))))
SCOPE@1:0-1:28([:n], nil, IF@1:0-1:28(MATCH2@1:3-1:17(REGX@1:3-1:12(/(?<n>a)/), VCALL@1:16-1:17(:s), BLOCK@1:3-1:17(LASGN@1:3-1:17(:n, SYM@1:3-1:17(:n)))), LVAR@1:23-1:24(:n), nil))
SCOPE@1:0-1:9([], nil, OPCALL@1:0-1:9(STR@1:0-1:3("a"), :+, LIST@1:6-1:9(STR@1:6-1:9("b"), nil)))
SCOPE@1:0-1:2([], nil, SYM@1:0-1:2(:a))
SCOPE@1:0-1:7([], nil, SYM@1:0-1:7(:"a b"))
SCOPE@1:0-1:6([], nil, SYM@1:0-1:6(:"a b"))
SCOPE@1:0-1:6([], nil, DSTR@1:0-1:6("a", EVSTR@1:2-1:5(NTH_REF@1:3-1:5(:$1)), nil))
SCOPE@1:0-1:10([], nil, DSTR@1:0-1:10("a", EVSTR@1:2-1:9(BLOCK@1:4-1:8(VCALL@1:4-1:5(:b), VCALL@1:7-1:8(:c))), nil))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("a", EVSTR@2:1-2:5(VCALL@2:3-2:4(:b)), LIST@2:5-2:6(STR@2:5-2:6("c"), EVSTR@2:6-2:10(VCALL@2:8-2:9(:d)), STR@1:5-1:5("e\n"), nil)))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("a", EVSTR@2:1-2:5(VCALL@2:3-2:4(:b)), LIST@3:0-3:1(STR@3:0-3:1("\nc"), EVSTR@3:1-3:5(VCALL@3:3-3:4(:d)), STR@1:5-1:5("\n"), nil)))
SCOPE@1:0-1:9([], nil, DSTR@1:0-1:9("ax", nil, nil))
SCOPE@1:0-1:8([], nil, DSTR@1:0-1:8("x", nil, nil))
SCOPE@1:0-1:13([], nil, DSTR@1:0-1:13("a", EVSTR@1:2-1:12(DSTR@1:4-1:11("x", EVSTR@1:6-1:10(VCALL@1:8-1:9(:y)), nil)), nil))
SCOPE@1:0-1:6([], nil, DXSTR@1:0-1:6(nil, EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), nil))
SCOPE@1:0-1:7([], nil, DSYM@1:0-1:7(nil, EVSTR@1:2-1:6(VCALL@1:4-1:5(:a)), nil))
SCOPE@1:0-1:6([], nil, DREGX@1:0-1:6("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), nil))
SCOPE@1:0-1:2([], nil, STR@1:0-1:2(""))
SCOPE@1:0-1:2([], nil, XSTR@1:0-1:2(""))
SCOPE@1:0-1:3([], nil, SYM@1:0-1:3(:""))
SCOPE@1:0-1:2([], nil, REGX@1:0-1:2(//))
SCOPE@1:0-1:5([], nil, STR@1:0-1:5(""))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6(""))
SCOPE@1:0-1:7([], nil, DXSTR@1:0-1:7("ls ", EVSTR@2:3-2:7(VCALL@2:5-2:6(:a)), LIST@1:7-1:7(STR@1:7-1:7("\n"), nil)))
SCOPE@1:0-1:13([:y], nil, POSTEXE@1:0-1:13(SCOPE@1:0-1:13([], nil, LASGN@1:6-1:11(:y, INTEGER@1:10-1:11(1)))))
SCOPE@1:0-1:16([:x], nil, BLOCK@1:0-1:16(LASGN@1:0-1:5(:x, INTEGER@1:4-1:5(1)), POSTEXE@1:7-1:16(SCOPE@1:7-1:16([], nil, LVAR@1:13-1:14(:x)))))
SCOPE@1:0-1:4([], nil, ZLIST@1:0-1:4())
SCOPE@1:0-1:8([], nil, LIST@1:0-1:8(DSTR@1:3-1:7("", EVSTR@1:3-1:7(VCALL@1:5-1:6(:a)), nil), nil))
SCOPE@1:0-1:12([], nil, LIST@1:0-1:12(DSTR@1:3-1:9("a", EVSTR@1:4-1:8(VCALL@1:6-1:7(:b)), LIST@1:8-1:9(STR@1:8-1:9("c"), nil)), STR@1:10-1:11("d"), nil))
SCOPE@1:0-1:4([], nil, ZLIST@1:0-1:4())
SCOPE@1:0-1:5([], nil, LIST@1:0-1:5(SYM@1:3-1:4(:a), nil))
SCOPE@1:0-1:20([], nil, IF@1:0-1:20(DSTR@1:3-1:9("", EVSTR@1:3-1:9(VCALL@1:6-1:7(:a)), nil), INTEGER@1:15-1:16(1), nil))
SCOPE@1:0-1:20([], nil, IF@1:0-1:20(MATCH2@1:0-1:20(DREGX@1:3-1:9("", EVSTR@1:4-1:8(VCALL@1:6-1:7(:a)), nil), GVAR@1:0-1:20(:$_)), INTEGER@1:15-1:16(1), nil))
SCOPE@1:0-1:22([], nil, IF@1:0-1:22(AND@1:3-1:11(VCALL@1:3-1:4(:a), MATCH@1:8-1:11(/b/)), INTEGER@1:17-1:18(1), nil))
SCOPE@1:0-1:18([], nil, IF@1:0-1:18(OPCALL@1:3-1:7(MATCH@1:4-1:7(/b/), :!, nil), INTEGER@1:13-1:14(1), nil))
SCOPE@1:0-1:19([], nil, IF@1:0-1:19(BLOCK@1:3-1:8(MATCH@1:4-1:7(/b/)), INTEGER@1:14-1:15(1), nil))
SCOPE@1:0-1:16([], nil, WHILE@1:0-1:16(MATCH@1:6-1:9(/b/), BEGIN@1:12-1:12(nil), true))
SCOPE@1:0-1:8([], nil, STR@1:0-1:8("a)b"))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("a\\b"))
SCOPE@1:0-1:12([], nil, STR@1:0-1:12("😀x"))
SCOPE@1:0-1:8([], nil, DSTR@1:0-1:8("é", EVSTR@1:3-1:7(VCALL@1:5-1:6(:a)), nil))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("\tx", EVSTR@2:3-2:7(VCALL@2:5-2:6(:a)), LIST@1:5-1:5(STR@1:5-1:5("\n"), nil)))
SCOPE@1:0-1:7([], nil, STR@1:0-1:7("\\tx\n"))
SCOPE@1:0-1:10([], nil, LIST@1:0-1:10(STR@1:3-1:7("a b"), STR@1:8-1:9("c"), nil))
SCOPE@1:0-1:3([], nil, STR@1:0-1:3("\n"))
SCOPE@1:0-1:7([], nil, SYM@1:0-1:7(:"a\nb"))
SCOPE@1:0-1:4([], nil, SYM@1:0-1:4(:""))
SCOPE@1:0-1:4([], nil, REGX@1:0-1:4(/\//))
SCOPE@1:0-1:8([], nil, REGX@1:0-1:8(/\d+/x))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("\e "))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("A"))
SCOPE@1:0-1:6([], nil, STR@1:0-1:6("J"))
SCOPE@1:0-1:11([], nil, STR@1:0-1:3("abc"))
SCOPE@1:0-1:14([:x], nil, BLOCK@1:0-1:14(LASGN@1:0-1:11(:x, DSTR@1:4-1:11("a", EVSTR@1:6-1:10(INTEGER@1:8-1:9(1)), nil)), VCALL@1:13-1:14(:y)))
SCOPE@1:0-1:5([], nil, DSTR@1:0-1:5("", EVSTR@1:0-1:5(BEGIN@1:3-1:3(nil)), nil))
SCOPE@1:0-1:10([], nil, DSTR@1:0-1:10("a", EVSTR@1:2-1:8(NIL@1:4-1:7()), LIST@1:8-1:9(STR@1:8-1:9("b"), nil)))
SyntaxError
SCOPE@1:0-1:9([], nil, MATCH2@1:0-1:9(REGX@1:0-1:4(/a/i), VCALL@1:8-1:9(:s)))
SCOPE@1:0-1:8([], nil, OPCALL@1:0-1:8(VCALL@1:0-1:1(:s), :!~, LIST@1:5-1:8(REGX@1:5-1:8(/a/), nil)))
SCOPE@1:0-1:9([], nil, FCALL@1:0-1:9(:p, LIST@1:2-1:9(DSTR@1:2-1:9("a", EVSTR@1:4-1:8(VCALL@1:6-1:7(:b)), nil), nil)))
SCOPE@1:0-1:5([], nil, FCALL@1:0-1:5(:p, LIST@1:2-1:5(REGX@1:2-1:5(/a/), nil)))
SCOPE@1:0-1:11([], nil, FCALL@1:0-1:11(:foo, LIST@1:4-1:10(DSTR@1:4-1:10("", EVSTR@1:4-1:10(VCALL@1:7-1:8(:a)), nil), nil)))
SCOPE@1:0-1:20([], nil, LIST@1:0-1:20(REGX@1:1-1:4(/a/), DSYM@1:6-1:14("b", EVSTR@1:9-1:13(VCALL@1:11-1:12(:c)), nil), XSTR@1:16-1:19("d"), nil))
SCOPE@1:0-1:24([], nil, HASH@1:0-1:24(LIST@1:1-1:23(STR@1:1-1:4("a"), INTEGER@1:8-1:9(1), DSTR@1:11-1:18("b", EVSTR@1:13-1:17(VCALL@1:15-1:16(:c)), nil), INTEGER@1:22-1:23(2), nil)))
SCOPE@1:0-1:15([:a], nil, LASGN@1:0-1:15(:a, DSTR@1:8-1:15("xy", EVSTR@1:10-1:14(VCALL@1:12-1:13(:z)), nil)))
SCOPE@1:0-1:41([:x, :year, :mon], nil, BLOCK@1:0-1:41(LASGN@1:0-1:35(:x, MATCH2@1:4-1:35(REGX@1:4-1:30(/(?<year>\d+)-(?<mon>\d+)/), VCALL@1:34-1:35(:d), BLOCK@1:4-1:35(LASGN@1:4-1:35(:year, SYM@1:4-1:35(:year)), LASGN@1:4-1:35(:mon, SYM@1:4-1:35(:mon))))), LVAR@1:37-1:41(:year)))
SCOPE@1:0-1:19([], nil, POSTEXE@1:0-1:19(SCOPE@1:0-1:19([], nil, CDECL@1:6-1:17(:BEGIN_X, INTEGER@1:16-1:17(1)))))
SCOPE@1:0-1:12([], nil, DSTR@1:0-1:12("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), nil)))
SCOPE@1:0-1:15([], nil, DSTR@1:0-1:15("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:9-1:15(VCALL@1:12-1:13(:d)), nil)))
SCOPE@1:0-1:12([], nil, DSTR@1:0-1:8("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("cd"), nil)))
SCOPE@1:0-1:14([], nil, DSTR@1:0-1:14("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:9(EVSTR@1:5-1:9(VCALL@1:7-1:8(:b)), STR@1:11-1:14("c"), nil)))
SCOPE@1:0-1:14([], nil, DSTR@1:0-1:14("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:9(EVSTR@1:5-1:9(VCALL@1:7-1:8(:b)), EVSTR@1:9-1:13(VCALL@1:11-1:12(:c)), nil)))
SCOPE@1:0-1:12([], nil, DSTR@1:0-1:12("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:10(EVSTR@1:6-1:10(VCALL@1:8-1:9(:c)), STR@1:10-1:11("d"), nil)))
SCOPE@1:0-1:16([], nil, DSTR@1:0-1:8("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("cd"), EVSTR@1:11-1:15(VCALL@1:13-1:14(:e)), nil)))
SCOPE@1:0-1:12([], nil, DXSTR@1:0-1:12("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), nil)))
SCOPE@1:0-1:12([], nil, DREGX@1:0-1:12("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), nil)))
SCOPE@1:0-1:13([], nil, DSYM@1:0-1:13("a", EVSTR@1:3-1:7(VCALL@1:5-1:6(:b)), LIST@1:7-1:8(STR@1:7-1:8("c"), EVSTR@1:8-1:12(VCALL@1:10-1:11(:d)), nil)))
SCOPE@1:0-1:12([], nil, DSTR@1:0-1:12("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:6(STR@1:5-1:6("b"), EVSTR@1:6-1:10(VCALL@1:8-1:9(:c)), STR@1:10-1:11("d"), nil)))
SCOPE@1:0-1:17([], nil, DSTR@1:0-1:17("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), STR@1:11-1:12("e"), EVSTR@1:12-1:16(VCALL@1:14-1:15(:f)), nil)))
SCOPE@1:0-1:18([], nil, DSTR@1:0-1:18("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), STR@1:11-1:12("e"), EVSTR@1:12-1:16(VCALL@1:14-1:15(:f)), STR@1:16-1:17("g"), nil)))
SCOPE@1:0-1:15([], nil, DSTR@1:0-1:15("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:8(STR@1:6-1:8("cc"), EVSTR@1:8-1:12(VCALL@1:10-1:11(:d)), STR@1:12-1:14("ee"), nil)))
SCOPE@1:0-1:17([], nil, DSTR@1:0-1:17("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), EVSTR@1:11-1:15(VCALL@1:13-1:14(:e)), STR@1:15-1:16("f"), nil)))
SCOPE@1:0-1:11([], nil, DSTR@1:0-1:11("", EVSTR@1:1-1:5(VCALL@1:3-1:4(:a)), LIST@1:5-1:6(STR@1:5-1:6("b"), EVSTR@1:6-1:10(VCALL@1:8-1:9(:c)), nil)))
SCOPE@1:0-1:17([], nil, DSTR@1:0-1:13("a", EVSTR@1:2-1:6(VCALL@1:4-1:5(:b)), LIST@1:6-1:7(STR@1:6-1:7("c"), EVSTR@1:7-1:11(VCALL@1:9-1:10(:d)), STR@1:11-1:12("ex"), nil)))
SCOPE@1:0-1:8([], nil, STR@1:0-1:8("\xFFé"))
SCOPE@1:0-1:8([], nil, STR@1:0-1:8("a\xE9b"))
SCOPE@1:0-1:12([], nil, STR@1:0-1:12("éA"))
SCOPE@1:0-1:16([], nil, IF@1:0-1:16(FLIP2@1:3-1:7(CALL@1:0-1:16(INTEGER@1:3-1:4(1), :==, LIST@1:0-1:16(GVAR@1:0-1:16(:$.), nil)), CALL@1:0-1:16(INTEGER@1:6-1:7(2), :==, LIST@1:0-1:16(GVAR@1:0-1:16(:$.), nil))), BEGIN@1:12-1:12(nil), nil))
SCOPE@1:0-1:16([], nil, IF@1:0-1:16(FLIP2@1:3-1:7(VCALL@1:3-1:4(:a), VCALL@1:6-1:7(:b)), BEGIN@1:12-1:12(nil), nil))
SCOPE@1:0-1:11([], nil, IF@1:0-1:11(BLOCK@1:5-1:11(FLIP2@1:6-1:10(VCALL@1:6-1:7(:a), VCALL@1:9-1:10(:b))), VCALL@1:0-1:1(:x), nil))
SCOPE@1:0-1:12([], nil, IF@1:0-1:12(OPCALL@1:5-1:12(BLOCK@1:6-1:12(FLIP2@1:7-1:11(VCALL@1:7-1:8(:a), VCALL@1:10-1:11(:b))), :!, nil), VCALL@1:0-1:1(:x), nil))
SCOPE@1:0-1:20([], nil, IF@1:0-1:20(BEGIN@1:5-1:20(BLOCK@1:10-1:15(BEGIN@1:10-1:10(nil), MATCH@1:12-1:15(/a/))), VCALL@1:0-1:1(:x), nil))
SCOPE@1:0-1:11([], nil, WHILE@1:0-1:11(MATCH@1:8-1:11(/a/), VCALL@1:0-1:1(:x), true))
SCOPE@1:0-1:11([], nil, IF@1:0-1:11(VCALL@1:0-1:1(:a), REGX@1:4-1:7(/b/), INTEGER@1:10-1:11(1)))
SCOPE@1:0-1:17([], nil, IF@1:0-1:17(AND@1:5-1:17(VCALL@1:5-1:6(:a), BLOCK@1:11-1:17(FLIP2@1:12-1:16(VCALL@1:12-1:13(:b), VCALL@1:15-1:16(:c)))), VCALL@1:0-1:1(:x), nil))
SCOPE@1:0-1:9([], nil, POSTEXE@1:0-1:9(SCOPE@1:0-1:9([], nil, VCALL@1:6-1:7(:y))))
SCOPE@1:0-1:12([], nil, POSTEXE@1:0-1:12(SCOPE@1:0-1:12([], nil, BLOCK@1:6-1:10(INTEGER@1:6-1:7(1), INTEGER@1:9-1:10(2)))))
SCOPE@1:0-1:11([], nil, POSTEXE@1:0-1:11(SCOPE@1:0-1:11([], nil, VCALL@1:6-1:9(:foo))))
```
