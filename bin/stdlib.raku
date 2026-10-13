#!/usr/bin/env raku

# Writes the table of MRI's default and bundled gems into content/stdlib.md,
# between its two marker comments. Each library is required under MRI and
# under metorex, and the table says whether each one loaded and where from.
#
#   bin/stdlib.raku [--binary=../metorex/target/debug/metorex] [--ruby=ruby]

constant START-MARKER = '<!-- stdlib-table start -->';
constant END-MARKER = '<!-- stdlib-table end -->';

# How long one `require` may run before it counts as not loading.
constant SECONDS-PER-REQUIRE = 20;

# Prints where the library was found ("startup" when it was loaded before the
# program began), then whether a file named exactly as required was loaded,
# or else the error's first line.
constant PROBE = q:to/RUBY/.lines.map(*.trim).join('; ');
    before = $LOADED_FEATURES.dup
    begin
      fresh = require ARGV[0]
      added = $LOADED_FEATURES - before
      on_disk_as_written = ->(feature) { !File.exist?(feature) || Dir.children(File.dirname(feature)).include?(File.basename(feature)) }
      exact = added.any? { |feature| on_disk_as_written.(feature) && %w[rb bundle so].any? { |extension| feature == "#{ARGV[0]}.#{extension}" || feature.end_with?("/#{ARGV[0]}.#{extension}") } }
      found = if !fresh then "startup" elsif added.any? { |feature| feature.start_with?("<metorex>/") } then "carried" else "disk" end
      puts "#{found} #{exact ? "exact" : "inexact"}"
    rescue LoadError, StandardError, ScriptError => problem
      puts "error #{problem.class}: #{problem.message.lines.first.to_s.chomp}"
    end
    RUBY

sub run-ruby(Str $program, *@arguments --> Str) {
    my $process = run $program, '-e', |@arguments, :out, :err;
    $process.out.slurp(:close).trim
}

sub default-gems(Str $ruby --> List) {
    run-ruby($ruby, 'Gem::Specification.select(&:default_gem?).each { |spec| puts spec.name }').lines.sort.List
}

sub bundled-gems(Str $ruby --> List) {
    my $version = run-ruby($ruby, 'print RUBY_VERSION');
    my $url = "https://raw.githubusercontent.com/ruby/ruby/v$version/gems/bundled_gems";
    my $listing = run 'curl', '-sfL', $url, :out;
    my @names = $listing.out.slurp(:close).lines.grep({ .trim && !.starts-with('#') }).map(*.words[0]);
    die "no bundled gems at $url" unless @names;
    @names.sort.List
}

# The outcome of requiring `$feature`, with the run cut off after
# SECONDS-PER-REQUIRE, as PROBE prints it.
sub required(Str $program, Str $feature --> Str) {
    my $process = run 'perl', '-e', "alarm {SECONDS-PER-REQUIRE}; exec \@ARGV", $program,
        '--disable=did_you_mean', '-e', PROBE, $feature, :out, :err, :cwd($*TMPDIR);
    my $printed = $process.out.slurp(:close).lines.grep(/^ [carried | disk | startup | error]/).tail // '';
    $process.err.slurp(:close);
    $printed || 'error stopped without finishing'
}

# The name a gem is required by: the first spelling MRI loads a file of that
# exact name for, which a filesystem that ignores case would otherwise blur.
sub feature-name(Str $ruby, Str $gem --> Str) {
    my @spellings = $gem, $gem.subst('-', '/', :g), $gem.tc, "$gem/$gem";
    @spellings.unique.first({
        my @outcome = required($ruby, $_).words;
        @outcome[0] eq 'startup' || @outcome[1] eq 'exact'
    }) // $gem
}

sub cell(Str $outcome --> Str) {
    given $outcome {
        when /^ carried / { 'Loads, carried in the binary' }
        when /^ disk /    { 'Loads, from disk' }
        when /^ startup / { 'Loads, loaded at startup' }
        default        { 'Does not load: ' ~ .subst(/^ 'error '/, '').subst('|', '\|', :g) }
    }
}

sub rows(Str $ruby, Str $binary, Str $kind, @gems --> List) {
    @gems.map(-> $gem {
        my $feature = feature-name($ruby, $gem);
        my $under-mri = required($ruby, $feature);
        "| $gem | $kind | `$feature` | {cell(required($binary, $feature))} | "
            ~ ($under-mri.starts-with('error') ?? cell($under-mri) !! 'Loads') ~ ' |'
    }).List
}

sub MAIN(Str :$binary = '../metorex/target/debug/metorex', Str :$ruby = 'ruby', Str :$page = 'content/stdlib.md') {
    my $binary-path = $binary.IO.absolute;
    my @rows = |rows($ruby, $binary-path, 'default', default-gems($ruby)),
               |rows($ruby, $binary-path, 'bundled', bundled-gems($ruby));
    my $loading = @rows.grep(*.split(' | ')[3].starts-with('Loads')).elems;
    my @lines = "{@rows.elems} libraries, of which $loading load under Metorex.", '',
        '| Library | Kind | Required as | Metorex | MRI |', '| :-- | :-- | :-- | :-- | :-- |', |@rows;

    my $text = $page.IO.slurp;
    my $start = $text.index(START-MARKER) // die "no {START-MARKER} in $page";
    my $end = $text.index(END-MARKER) // die "no {END-MARKER} in $page";
    my $before = $text.substr(0, $start + START-MARKER.chars);
    my $after = $text.substr($end);
    $page.IO.spurt: "$before\n\n{@lines.join("\n")}\n\n$after";
}
