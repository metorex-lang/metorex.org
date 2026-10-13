#!/usr/bin/env raku

# Writes one page under content/docs/core/ for each directory of ruby/spec's
# core/, listing the methods its specs describe. Each method is marked
# implemented or not by asking metorex for it, with the parameters metorex
# reports, the first sentence of MRI's documentation for it from ri, a link to
# an example in the gallery that calls a method of that name, and any note in
# bin/core_reference/notes.tsv. Also writes data/core-reference.json, which
# the index at /docs/core lists.
#
#   bin/core-reference.raku [--repo=../metorex] [--binary=../metorex/target/debug/metorex] [--ruby=ruby]

constant PAGES = 'content/docs/core';
constant INDEX-DATA = 'data/core-reference.json';
constant HELPERS = 'bin/core_reference';
constant NOTES = 'bin/core_reference/notes.tsv';

class Described {
    has Str $.owner;
    has Str $.kind;
    has Str $.name;

    method key(--> Str) { "$!owner$!kind$!name" }
    method line(--> Str) { "$!owner\t$!kind\t$!name" }
}

sub spec-files(IO::Path $directory --> List) {
    my @found;
    my @directories = $directory;
    while @directories {
        for @directories.shift.dir.sort -> $entry {
            if $entry.d { @directories.push: $entry unless $entry.basename eq 'shared' | 'fixtures' }
            elsif $entry.basename.ends-with('_spec.rb') { @found.push: $entry }
        }
    }
    @found.List
}

# The methods `describe "Owner#name"` and `describe "Owner.name"` name in a
# directory's spec files, leaving out shared and fixture files.
sub described-methods(IO::Path $directory --> List) {
    my %seen;
    for spec-files($directory) -> $file {
        for $file.lines -> $line {
            next unless $line ~~ / ^ \s* 'describe' \s+ (<["']>) (.*?) $0 /;
            next unless ~$1 ~~ / ^ (<[A..Za..z]> <[\w:]>*) (<[#.]>) (\S+) /;
            my $described = Described.new(owner => ~$0, kind => ~$1, name => ~$2);
            %seen{$described.key} //= $described;
        }
    }
    %seen.values.sort({ .owner, .name, .kind }).List
}

# Each line `@command` writes for the lines of `$input`, one per input line.
sub answers(@command, Str $input --> List) {
    my $process = Proc::Async.new(:w, |@command);
    my $printed = '';
    $process.stdout.tap({ $printed ~= $_ });
    $process.stderr.tap({ ; });
    my $finished = $process.start;
    await $process.write($input.encode);
    $process.close-stdin;
    my $result = await $finished;
    die "{@command.join(' ')} exited with {$result.exitcode}" unless $result.exitcode == 0;
    my @lines = $printed.lines;
    die "{@command.join(' ')} answered {@lines.elems} lines for {$input.lines.elems}" unless @lines == $input.lines;
    @lines.List
}

# The slug bin/examples.raku gives the gallery page of an example file.
sub example-slug(Str $path --> Str) {
    $path.subst(/ '.rb' $/, '').lc.subst(/ <-[a..z0..9]>+ /, '-', :g)
}

# For each method name an example calls with a receiver, written `.name`, the
# example files that call it, and for each `Owner.name` the same.
sub example-calls(IO::Path $examples --> Hash) {
    my %calls;
    my @directories = $examples;
    my @files;
    while @directories {
        for @directories.shift.dir -> $entry {
            if $entry.d { @directories.push: $entry }
            elsif $entry.extension eq 'rb' { @files.push: $entry.relative($examples) }
        }
    }
    for @files.sort -> $path {
        my $text = try { $examples.add($path).slurp(:enc<utf8>) } // next;
        for $text.match(/ (<[A..Z]> \w* [ '::' <[A..Z]> \w* ]*)? '.' (<[a..z_]> \w* <[?!]>?) /, :g) -> $call {
            %calls{".{$call[1]}"}.push: $path;
            %calls{"{$call[0]}.{$call[1]}"}.push: $path if $call[0];
        }
    }
    %calls.map({ .key => .value.unique.List }).Hash
}

# The example to link for a method, preferring one in a directory named for
# the method's owner, such as array_methods for Array.
sub example-for(Described $method, %calls --> Str) {
    return Str unless $method.name ~~ / ^ <[a..z_]> \w* <[?!]>? $ /;
    my $called = $method.kind eq '.' ?? "{$method.owner}.{$method.name}" !! ".{$method.name}";
    my @paths = (%calls{$called} // ()).grep({ "content/examples/{example-slug($_)}.md".IO.e });
    return Str unless @paths;
    my $owner = $method.owner.split('::').tail.lc;
    @paths.first({ .split('/')[0].contains($owner) }) // @paths[0]
}

sub notes(--> Hash) {
    return {} unless NOTES.IO.e;
    NOTES.IO.lines.grep({ .trim && !.starts-with('#') }).map({ .split("\t", 2) }).map({ .[0] => .[1] }).Hash
}

# `text` as Markdown inline code, fenced past any backticks in it.
sub code(Str $text --> Str) {
    my $marks = '`' x (max(0, |$text.comb(/ '`'+ /).map(*.chars)) + 1);
    my $pad = $text.starts-with('`') || $text.ends-with('`') ?? ' ' !! '';
    "$marks$pad$text$pad$marks"
}

sub json-string(Str $text --> Str) {
    '"' ~ $text.trans(['\\', '"', "\n", "\t"] => ['\\\\', '\\"', '\\n', '\\t']) ~ '"'
}

# The name a page is titled by: the owner named like its directory, or else
# the owner most of its methods belong to.
sub title-of(Str $directory, @methods --> Str) {
    return $directory unless @methods;
    my @owners = @methods.map(*.owner).Bag.sort({ -.value, .key }).map(*.key);
    @owners.first({ .lc eq $directory || .split('::').tail.lc eq $directory }) // @owners.head
}

sub entry(Described $method, %answer, %summary, %calls, %notes --> Str) {
    my ($found, $parameters) = %answer{$method.key}.split("\t", 2);
    my $state = $found eq 'yes' ?? "implemented, parameters {code($parameters)}." !! 'not implemented.';
    my $line = "- **{code($method.key)}**: $state";
    $line ~= " {%summary{$method.key}}" if %summary{$method.key};
    with example-for($method, %calls) { $line ~= " [An example calling it](/examples/{example-slug($_)})." }
    $line ~= "\n\n  Metorex: {%notes{$method.key}}" if %notes{$method.key};
    $line
}

sub page(Str $directory, Str $title, @methods, %answer, %summary, %calls, %notes --> Str) {
    my $implemented = @methods.grep({ %answer{.key}.starts-with('yes') }).elems;
    my @lines = '---', "title: {json-string($title)}", "slug: {$directory.subst('_', '-', :g)}",
        "description: {json-string("The methods ruby/spec describes in core/$directory, and which Metorex implements.")}",
        '---', '',
        "ruby/spec describes {@methods.elems} methods in `core/$directory`, and Metorex implements $implemented of them. The parameters are what `Method#parameters` answers under Metorex.", '';
    my @owners = @methods.map(*.owner).unique;
    for @owners -> $owner {
        @lines.push: "## $owner", '' if @owners > 1;
        @lines.push: entry($_, %answer, %summary, %calls, %notes) for @methods.grep(*.owner eq $owner);
        @lines.push: '';
    }
    @lines.push: 'The method summaries are the first sentences of Ruby\'s own documentation for each method, read from MRI 4.0.6\'s ri data. Ruby\'s documentation is distributed under [Ruby\'s license](https://www.ruby-lang.org/en/about/license.txt).';
    @lines.join("\n") ~ "\n"
}

sub MAIN(Str :$repo = '../metorex', Str :$binary = '../metorex/target/debug/metorex', Str :$ruby = 'ruby') {
    my $core = "$repo/ruby/spec/core".IO;
    my @directories = $core.dir.grep(*.d).map(*.basename).sort;
    my %methods = @directories.map({ $_ => described-methods($core.add($_)) });
    my @every = %methods.values.map(|*).unique(as => *.key).sort(*.key);
    my $input = @every.map(*.line).join("\n") ~ "\n";

    my %answer = @every.map(*.key) Z=> answers([$binary.IO.absolute, "{HELPERS}/methods.rb".IO.absolute], $input);
    my %summary = @every.map(*.key) Z=> answers([$ruby, "{HELPERS}/summaries.rb"], $input);
    my %calls = example-calls("$repo/tests/_examples".IO);
    my %notes = notes();

    PAGES.IO.mkdir;
    my @index;
    for @directories -> $directory {
        my @described = %methods{$directory}.List;
        my $title = title-of($directory, @described);
        "{PAGES}/$directory.md".IO.spurt: page($directory, $title, @described, %answer, %summary, %calls, %notes);
        my $implemented = @described.grep({ %answer{.key}.starts-with('yes') }).elems;
        @index.push: '{"title": ' ~ json-string($title) ~ ', "url": ' ~ json-string("/docs/core/{$directory.subst('_', '-', :g)}")
            ~ ', "implemented": ' ~ $implemented ~ ', "described": ' ~ @described.elems ~ '}';
    }
    INDEX-DATA.IO.spurt: '{"classes": [' ~ "\n" ~ @index.join(",\n") ~ "\n]}\n";

    my @unused = %notes.keys.grep({ $_ ∉ %answer }).sort;
    note "notes for methods no spec describes: {@unused.join(', ')}" if @unused;
    note "{@directories.elems} pages, {@every.elems} methods, {%answer.values.grep(*.starts-with('yes')).elems} implemented";
}
