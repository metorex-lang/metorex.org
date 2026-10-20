#!/usr/bin/env raku

# Writes the MRI C API functions a metorex build exports into
# content/docs/c-extensions.md, between its two marker comments. Functions named
# `rb_metorex_` are metorex's own and are left out.
#
#   bin/c-api.raku [--binary=../metorex/target/debug/metorex]

constant START-MARKER = '<!-- c-api-functions start -->';
constant END-MARKER = '<!-- c-api-functions end -->';

# A family with fewer functions than this is listed under "Other".
constant SMALLEST-FAMILY = 4;

sub exported-functions(Str $binary --> List) {
    my @options = $*KERNEL.name eq 'darwin' ?? <-g -U> !! <-g --defined-only>;
    my $listing = run 'nm', |@options, $binary, :out;

    $listing.out.lines
        .map(*.words)
        .grep({ .elems == 3 && .[1] eq 'T' })
        .map({ .[2].subst(/^ '_'/, '') })
        .grep({ / ^ [ 'rb_' | 'ruby_' | 'st_' ] / && !/ ^ 'rb_metorex_' / })
        .unique
        .sort
        .List
}

# The prefix a function shares with its relatives: `rb_str_` for
# `rb_str_new`, `ruby_` for `ruby_init`.
sub family(Str $name --> Str) {
    $name ~~ / ^ ('rb_' <-[_]>+ '_') / ?? ~$0 !! $name ~~ / ^ (<-[_]>+ '_') / ?? ~$0 !! $name
}

sub section(@functions --> Str) {
    my %families = @functions.classify(&family);
    my @small = %families.keys.grep({ %families{$_}.elems < SMALLEST-FAMILY });
    my @other = @small.map({ |%families{$_} }).sort;
    %families{@small}:delete;

    my @lines = "{@functions.elems} functions.", '';
    for %families.keys.sort -> $prefix {
        @lines.push: "**`{$prefix}`**: " ~ %families{$prefix}.map({ "`$_`" }).join(', '), '';
    }
    @lines.push: '**Other**: ' ~ @other.map({ "`$_`" }).join(', ') if @other;

    @lines.join("\n")
}

sub MAIN(Str :$binary = '../metorex/target/debug/metorex', Str :$page = 'content/docs/c-extensions.md') {
    my $text = $page.IO.slurp;
    my $start = $text.index(START-MARKER) // die "no {START-MARKER} in $page";
    my $end = $text.index(END-MARKER) // die "no {END-MARKER} in $page";

    my $before = $text.substr(0, $start + START-MARKER.chars);
    my $after = $text.substr($end);
    $page.IO.spurt: "$before\n\n{section(exported-functions($binary))}\n\n$after";
}
