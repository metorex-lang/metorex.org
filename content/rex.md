---
title: Rex
slug: rex
description: Rex is the spec framework built into Metorex. It runs suites written for RSpec 3.13 with no gems installed, and prints what RSpec prints.
layout: page
---

Rex is the spec framework built into Metorex. Its goal is RSpec 3.13 compatibility: a suite written for RSpec runs under `metorex spec` unchanged, with no gems installed, and prints what RSpec prints for it. `RSpec` names Rex, and `require "rspec"`, `require "rspec/core"`, and the other RSpec paths load it.

## Running a suite

`metorex spec` runs the files under `spec/` whose names end in `_spec.rb`, as `rspec` does. It reads `.rspec`, `.rspec-local`, and `SPEC_OPTS`, loads `spec/spec_helper.rb` when there is one, and takes RSpec's options, which `metorex spec --help` lists.

```sh
metorex spec
metorex spec spec/ledger_spec.rb:14
metorex spec --format documentation --seed 1234
```

A script run with `metorex` that names `RSpec` loads Rex the first time it does, and runs the examples it defined as it ends, as `require "rspec/autorun"` does.

## A suite and its output

`lib/ledger.rb`:

```metorex
class Ledger
  def initialize
    @entries = []
  end

  def record(amount)
    raise ArgumentError, "an entry needs an amount" if amount.zero?

    @entries << amount
    self
  end

  def balance = @entries.sum

  def overdrawn? = balance.negative?
end
```

`spec/ledger_spec.rb`:

```metorex
require_relative "../lib/ledger"

RSpec.describe Ledger do
  subject(:ledger) { Ledger.new }

  it "starts at zero" do
    expect(ledger.balance).to eq(0)
  end

  context "with two entries" do
    before { ledger.record(120).record(-45) }

    it "sums them" do
      expect(ledger.balance).to eq(75)
    end

    it "is not overdrawn" do
      expect(ledger).not_to be_overdrawn
    end
  end

  it "refuses an entry of zero" do
    expect { ledger.record(0) }.to raise_error(ArgumentError, "an entry needs an amount")
  end

  it "rounds a balance" do
    ledger.record(10).record(-3)
    expect(ledger.balance).to eq(6)
  end
end
```

`metorex spec --format documentation` prints the same as `rspec --format documentation` does for this suite, apart from the times:

```
Ledger
  starts at zero
  refuses an entry of zero
  rounds a balance (FAILED - 1)
  with two entries
    sums them
    is not overdrawn

Failures:

  1) Ledger rounds a balance
     Failure/Error: expect(ledger.balance).to eq(6)

       expected: 6
            got: 7

       (compared using ==)
     # ./spec/ledger_spec.rb:28:in 'block (2 levels) in <top (required)>'

Finished in 0.01056 seconds (files took 0.07906 seconds to load)
5 examples, 1 failure

Failed examples:

rspec ./spec/ledger_spec.rb:26 # Ledger rounds a balance
```

## Options of its own

Rex adds these to RSpec's options:

- `--jobs N` runs the top-level groups in N worker processes, and `--jobs auto` runs one per processor. The output reads as it does with one job, since the groups' results are reported in the order a serial run would report them.
- `--verify-parallel` runs the suite again in one process with the same seed after a parallel run, and warns about each example whose outcome changed, which points at state shared between groups.
- `--coverage` reports the lines and branches of the loaded files that ran, counted by the interpreter rather than by a gem. `--coverage-format` picks `summary`, `lcov`, or `json`, `--coverage-dir` says where the files go, `--coverage-threshold PERCENT` fails a run below it, and `--coverage-exclude PATTERN` leaves files out.
- `--no-fast-paths` runs the Ruby versions of the parts of Rex that also have native versions, so a difference between the two can be checked.
- `--no-diff` leaves out the diff a failure comparing two values prints.

`metorex spec --coverage` on the suite above ends with:

```
Coverage: 100.00% of lines (9 of 9) and 100.00% of branches (2 of 2) in 1 file
  lib/ledger.rb  100.00% of lines  100.00% of branches
```

## How close it is

The RSpec libraries' own suites run under `metorex spec`, one spec file to a process:

| Suite | Passing | Examples |
| :-- | --: | --: |
| rspec-core | 2038 | 2258 |
| rspec-expectations | 2231 | 2455 |
| rspec-mocks | 1376 | 1806 |

diff-lcs's suite passes all 322 of its examples, with documentation output identical to RSpec's byte for byte. The suite and both outputs above are `tests/_examples/rex/site/ledger` in the [metorex repository](https://github.com/metorex-lang/metorex){target=_blank rel=noopener}, where the test suite checks them.
