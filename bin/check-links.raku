#!/usr/bin/env raku

# Checks that every internal link and asset reference in the built site under
# public/ names a file the build wrote. With clean URLs, `/cli` is served from
# public/cli.html and `/docs/` from public/docs/index.html or public/docs.html.
# A link written with the site's own base-url from blogin.json counts as
# internal. Prints each missing target with the pages that link to it, and
# exits 1 when there is one.
#
#   bin/check-links.raku [--public=public] [--base-url=https://metorex.org]

sub html-files(IO::Path $root --> List) {
    my @found;
    my @directories = $root;
    while @directories {
        for @directories.shift.dir -> $entry {
            if $entry.d { @directories.push: $entry }
            elsif $entry.extension eq 'html' { @found.push: $entry }
        }
    }
    @found.sort.List
}

# Whether the build wrote a file the path `$target` is served from.
sub served(IO::Path $root, Str $target --> Bool) {
    my $path = $target.subst(/ <[?#]> .* $ /, '').subst(/ '/' + $ /, '');
    return True if $path eq '';
    my $file = $root.add($path.substr(1));
    $file.f || "$file.html".IO.f || $file.add('index.html').f
}

sub configured-base-url(--> Str) {
    'blogin.json'.IO.slurp.match(/ '"base-url"' \s* ':' \s* '"' (<-["]>+) '"' /)[0].Str
}

sub MAIN(Str :$public = 'public', Str :$base-url = configured-base-url()) {
    my $root = $public.IO;
    my %linked-from;
    for html-files($root) -> $page {
        my $page-path = '/' ~ $page.relative($root);
        for $page.slurp.match(/ <|w> [ 'href' | 'src' ] '=' (<["']>) (<-["']>*) $0 /, :g) -> $reference {
            my $target = ~$reference[1];
            $target = $target.substr($base-url.chars) if $target.starts-with($base-url);
            next unless $target.starts-with('/') && !$target.starts-with('//');
            %linked-from{$target}.push: $page-path unless served($root, $target);
        }
    }

    for %linked-from.keys.sort -> $target {
        my @pages = %linked-from{$target}.unique;
        say "$target is missing, linked from {@pages.head(3).join(', ')}{@pages > 3 ?? " and {@pages - 3} more" !! ''}";
    }
    say "{html-files($root).elems} pages checked, {%linked-from.elems} missing targets";
    exit 1 if %linked-from;
}
