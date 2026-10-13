---
title: "c_extensions/c_sequence_outlines.rb"
slug: c-extensions-c-sequence-outlines
description: "The metorex example program c_extensions/c_sequence_outlines.rb and its output."
---

`tests/_examples/c_extensions/c_sequence_outlines.rb` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/tests/_examples/c_extensions/c_sequence_outlines.rb){target=_blank rel=noopener}.

```metorex
# The sequences of compiled code, as the C functions the debug gem declares
# describe them: the methods, classes and blocks written in the code, with
# their kinds, parameters and the lines they open and close on. MRI's
# sequences for `rescue` and `ensure` clauses are left out. The extension is
# required by its `.o` name.
require "tmpdir"
require_relative "build_helper"

SOURCE = <<~RUBY
  module Accounts
    class Ledger
      def total(rates, scale = 1, *rest, tax:, fee: 0, **options, &block)
        rates.map { |rate| rate * scale }.sum
      end

      def self.open(name) = new
    end
  end

  class << Accounts
    def label; end
  end

  def summary(entries)
    report = entries.each_with_object([]) do |pair, lines|
      lines << pair.map { |held| held.to_s }
    end
    report.size + [1].sum { |held| held } - -[2].sum { |held| held }
    { totals: entries.map { |entry| entry } }
    [entries.count { |entry| entry }]
    entries[entries.index { |entry| entry }]
    (1..[3].max { |held| held })
    defined?(entries.find { |entry| entry })
    value = if entries.all? { |entry| entry } then entries.min { |held| held } else entries.max { |held| held } end
    value = unless entries.none? { |entry| entry } then 1 else 2 end
    value = case entries.first when 1 then entries.sum { |held| held } else nil end
    value = begin entries.sum { |held| held } rescue entries.size end
    [*entries.map { |entry| entry }]
    format("%s", entries.map { |entry| entry })
    format(**entries.to_h { |entry| [entry, entry] })
    entries.each(&[1].find { |held| held })
    value = if entries.empty? then 0 elsif entries.one? { |entry| entry } then 1 end
    yield entries.map { |entry| entry }
    ->(first, second = 2, *more, key:, other: 1, **opts, &blk) { first }
  end
RUBY

directory = Dir.mktmpdir
built = build_extension("c_sequences.c", "c_sequences", directory)
require(built.sub(/\.\w+\z/, ".o"))

def walk(iseq, depth)
  type, _, parameters, _, first_line, last_line = CSequences.describe(iseq)
  puts("#{"  " * depth}#{[iseq.label, type, first_line, last_line, parameters].inspect}")
  children = []
  iseq.each_child { |child| children << child unless child.label.start_with?("rescue in", "ensure in") }
  ordered = children.sort_by { |child| [child.first_lineno, child.label, CSequences.describe(child)[2].inspect] }
  ordered.each { |child| walk(child, depth + 1) }
end

compiled = nil
TracePoint.new(:script_compiled) { |tp| compiled = tp.instruction_sequence }.enable { eval(SOURCE) }
walk(compiled, 0)

FileUtils.rm_rf(directory)
```

Output:

```
["<compiled>", :eval, 1, 36, []]
  ["<module:Accounts>", :class, 1, 9, []]
    ["<class:Ledger>", :class, 2, 8, []]
      ["total", :method, 3, 5, [[:req, :rates], [:opt, :scale], [:rest, :rest], [:keyreq, :tax], [:key, :fee], [:keyrest, :options], [:block, :block]]]
        ["block in total", :block, 4, 4, [[:req, :rate]]]
      ["open", :method, 7, 7, [[:req, :name]]]
  ["singleton class", :class, 11, 13, []]
    ["label", :method, 12, 12, []]
  ["summary", :method, 15, 36, [[:req, :entries]]]
    ["block in summary", :block, 16, 18, [[:req, :pair], [:req, :lines]]]
      ["block (2 levels) in summary", :block, 17, 17, [[:req, :held]]]
    ["block in summary", :block, 19, 19, [[:req, :held]]]
    ["block in summary", :block, 19, 19, [[:req, :held]]]
    ["block in summary", :block, 20, 20, [[:req, :entry]]]
    ["block in summary", :block, 21, 21, [[:req, :entry]]]
    ["block in summary", :block, 22, 22, [[:req, :entry]]]
    ["block in summary", :block, 23, 23, [[:req, :held]]]
    ["block in summary", :block, 25, 25, [[:req, :entry]]]
    ["block in summary", :block, 25, 25, [[:req, :held]]]
    ["block in summary", :block, 25, 25, [[:req, :held]]]
    ["block in summary", :block, 26, 26, [[:req, :entry]]]
    ["block in summary", :block, 27, 27, [[:req, :held]]]
    ["block in summary", :block, 28, 28, [[:req, :held]]]
    ["block in summary", :block, 29, 29, [[:req, :entry]]]
    ["block in summary", :block, 30, 30, [[:req, :entry]]]
    ["block in summary", :block, 31, 31, [[:req, :entry]]]
    ["block in summary", :block, 32, 32, [[:req, :held]]]
    ["block in summary", :block, 33, 33, [[:req, :entry]]]
    ["block in summary", :block, 34, 34, [[:req, :entry]]]
    ["block in summary", :block, 35, 35, [[:req, :first], [:opt, :second], [:rest, :more], [:keyreq, :key], [:key, :other], [:keyrest, :opts], [:block, :blk]]]
```
