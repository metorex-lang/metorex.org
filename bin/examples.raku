#!/usr/bin/env raku

# Writes one page under content/examples/ for each Ruby file in metorex's
# tests/_examples, showing the file and the output the test runner checked
# for it, and writes data/examples.json, which the gallery index groups by
# topic directory. The outputs are the ones a test run keeps when started as
#
#   METOREX_EXAMPLE_OUTPUTS=<outputs> cargo test
#
#   bin/examples.raku [--repo=../metorex] --outputs=<outputs>

constant EXAMPLES = 'tests/_examples';
constant PAGES = 'content/examples';
constant INDEX-DATA = 'data/examples.json';

# The topic of a file sitting directly in tests/_examples.
constant TOP-LEVEL = 'top level';

sub ruby-files(IO::Path $root --> List) {
    my @found;
    my @directories = $root;
    while @directories {
        for @directories.shift.dir -> $entry {
            if $entry.d { @directories.push: $entry }
            elsif $entry.extension eq 'rb' { @found.push: $entry.relative($root) }
        }
    }
    @found.sort.List
}

# The slug of `strings/heredoc_parens.rb`, which is `strings-heredoc-parens`.
sub slug(Str $path --> Str) {
    $path.subst(/ '.rb' $/, '').lc.subst(/ <-[a..z0..9]>+ /, '-', :g)
}

# A fence longer than any run of backticks in `$text`, so the text cannot
# close it.
sub fence(Str $text --> Str) {
    '`' x max(3, max(0, |$text.comb(/ '`'+ /).map(*.chars)) + 1)
}

sub fenced(Str $text, Str $language = '' --> Str) {
    my $marks = fence($text);
    my $body = $text.ends-with("\n") ?? $text !! "$text\n";
    "$marks$language\n$body$marks"
}

# The file's text, or Nil when its bytes are not UTF-8.
sub text-of(IO::Path $file) {
    try { return $file.slurp(:enc<utf8>) }
    Nil
}

sub json-string(Str $text --> Str) {
    '"' ~ $text.trans(['\\', '"', "\n", "\t"] => ['\\\\', '\\"', '\\n', '\\t']) ~ '"'
}

sub page(Str $path, $source, $output --> Str) {
    my @lines = '---', "title: {json-string($path)}", "slug: {slug($path)}",
        "description: {json-string("The metorex example program $path and its output.")}", '---', '',
        "`{EXAMPLES}/$path` in the [metorex repository](https://github.com/metorex-lang/metorex/blob/main/{EXAMPLES}/$path)\{target=_blank rel=noopener\}.", '';
    @lines.push: $source.defined ?? fenced($source, 'metorex') !! 'The file is not UTF-8 text, so it is not shown.';
    if $output.defined {
        @lines.push: '', 'Output:', '', ($output eq '' ?? 'The program prints nothing.' !! fenced($output));
    }
    @lines.join("\n") ~ "\n"
}

sub topic-of(Str $path --> Str) {
    $path.contains('/') ?? $path.split('/')[0] !! TOP-LEVEL
}

sub index-data(@paths --> Str) {
    my %by-topic = @paths.classify(&topic-of);
    my @topics = %by-topic.keys.sort({ $_ eq TOP-LEVEL ?? '' !! $_ }).map(-> $topic {
        my @entries = %by-topic{$topic}.map(-> $path {
            my $title = $topic eq TOP-LEVEL ?? $path !! $path.substr($topic.chars + 1);
            '{"title": ' ~ json-string($title) ~ ', "url": ' ~ json-string("/examples/{slug($path)}") ~ '}'
        });
        '{"name": ' ~ json-string($topic) ~ ', "anchor": ' ~ json-string(slug($topic)) ~ ', "count": ' ~ @entries.elems ~ ', "entries": [' ~ @entries.join(', ') ~ ']}'
    });
    '{"count": ' ~ @paths.elems ~ ', "topics": [' ~ "\n" ~ @topics.join(",\n") ~ "\n]}\n"
}

sub MAIN(Str :$repo = '../metorex', Str :$outputs!) {
    my $root = "$repo/{EXAMPLES}".IO;
    my @paths = ruby-files($root);

    my %by-slug = @paths.classify(&slug);
    my @clashes = %by-slug.grep(*.value.elems > 1);
    die "these files share a slug: {@clashes.map(*.value.join(' and ')).join('; ')}" if @clashes;

    PAGES.IO.mkdir;
    my %written = PAGES.IO.dir(test => / '.md' $/).map({ .basename => True });
    my $with-output = 0;
    for @paths -> $path {
        my $recorded = "$outputs/$path.out".IO;
        my $output = $recorded.e ?? $recorded.slurp !! Nil;
        $with-output++ if $output.defined;
        my $name = "{slug($path)}.md";
        %written{$name}:delete;
        "{PAGES}/$name".IO.spurt: page($path, text-of($root.add($path)), $output);
    }
    "data".IO.mkdir;
    INDEX-DATA.IO.spurt: index-data(@paths);

    note "{@paths.elems} pages, {$with-output} with output";
    note "pages with no example behind them: {%written.keys.sort.join(', ')}" if %written;
}
