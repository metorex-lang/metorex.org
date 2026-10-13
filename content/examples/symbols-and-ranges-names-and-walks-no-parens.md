---
title: "symbols_and_ranges/names_and_walks_no_parens.rb"
slug: symbols-and-ranges-names-and-walks-no-parens
description: "The metorex example program symbols_and_ranges/names_and_walks_no_parens.rb and its output."
---

`tests/_examples/symbols_and_ranges/names_and_walks_no_parens.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/symbols_and_ranges/names_and_walks_no_parens.rb){target=_blank rel=noopener}.

```metorex
p :glark.upcase
p :GLARK.downcase
p :hello_world.capitalize
p :AbC.swapcase
p :a.succ
p :Z.next
p :ruby.name
p :ruby.id2name
p :ruby.intern
p :ruby.length
p Symbol.include? Comparable
p((:a <=> :b))

built = :"a#{1 + 1}b"
p built
p built.class.to_s

p "\u{E0}Bc"
p "àbc".to_sym
p "\xC3\x9Cber"
p "\xC3\x9Cber".length
p "a\sb"
p "\u{48 49}"
p 65.chr
p 0x3042.chr("UTF-8")

p "az".succ
p "zz".succ
p "a9".succ
p "1.9".succ
p "hello world".capitalize
p "AbC".swapcase
p "123.45e1".to_f
p "1_234.5".to_f
p "_5".to_f
p "5e".to_f

p (1..5).to_a
p ('A'..'D').to_a
p ('D'..'A').to_a
p ('ax'..'bd').to_a
p (:A..:D).to_a
p (1...4).to_s
p (1...4).inspect
p (1..).inspect
p (..3).inspect
p ((1..3) == (1..3))
p ((1..3).eql?(1..3))
p ((1..3) == (1...3))
p (1..3).count
p (1..).count

walked = []
('a'..'c').each { |letter| walked << letter }
p walked

begin
  (1..).to_a
rescue RangeError => error
  puts error.message
end

p Range.new(1, 3).to_a
p Range.new(1, 3, true).to_a
```

Output:

```
:GLARK
:glark
:Hello_world
:aBc
:b
:AA
"ruby"
"ruby"
:ruby
4
true
-1
:a2b
"Symbol"
"àBc"
:àbc
"Über"
4
"a b"
"HI"
"A"
"あ"
"ba"
"aaa"
"b0"
"2.0"
"Hello world"
"aBc"
1234.5
1234.5
0.0
5.0
[1, 2, 3, 4, 5]
["A", "B", "C", "D"]
[]
["ax", "ay", "az", "ba", "bb", "bc", "bd"]
[:A, :B, :C, :D]
"1...4"
"1...4"
"1.."
"..3"
true
true
false
3
Infinity
["a", "b", "c"]
cannot convert endless range to an array
[1, 2, 3]
[1, 2]
```
