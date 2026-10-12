#!/usr/bin/env raku

# Checks assets/css/style.css against the theme rules:
# every hex color sits in the :root token block, and body text, muted text,
# and links meet WCAG AA contrast against both backgrounds in both modes.

constant MINIMUM-CONTRAST = 4.5;

sub token-block(Str $css --> Str) {
    $css ~~ / ':root' \s* '{' (<-[}]>*) '}' / or die "no :root block in the stylesheet";
    ~$0
}

sub tokens(Str $block --> Hash) {
    my %tokens;

    for $block.match(/ '--' (<[\w-]>+) \s* ':' \s* 'light-dark(' \s* ('#' <xdigit>**6) \s* ',' \s* ('#' <xdigit>**6) \s* ')' /, :g) -> $match {
        %tokens{~$match[0]} = { light => ~$match[1], dark => ~$match[2] };
    }

    %tokens
}

sub channel(Str $hex-pair --> Real) {
    my $value = :16($hex-pair) / 255;

    $value <= 0.04045 ?? $value / 12.92 !! (($value + 0.055) / 1.055) ** 2.4
}

sub luminance(Str $hex --> Real) {
    my ($red, $green, $blue) = $hex.substr(1).comb(2).map(&channel);

    0.2126 * $red + 0.7152 * $green + 0.0722 * $blue
}

sub contrast(Str $foreground, Str $background --> Real) {
    my ($lighter, $darker) = (luminance($foreground), luminance($background)).sort.reverse;

    ($lighter + 0.05) / ($darker + 0.05)
}

sub MAIN(Str :$stylesheet = 'assets/css/style.css') {
    my $css = $stylesheet.IO.slurp;
    my $block = token-block($css);
    my %tokens = tokens($block);
    my @failures;

    my $outside = $css.subst($block, '');
    for $outside.match(/ '#' <xdigit> ** 3..8 <!before <[\w-]>> /, :g) -> $stray {
        @failures.push: "hex color $stray outside the :root token block";
    }

    for <fg muted accent> X <bg bg-elevated> -> ($foreground, $background) {
        for <light dark> -> $mode {
            my $ratio = contrast(%tokens{$foreground}{$mode}, %tokens{$background}{$mode});
            my $line = sprintf '%-5s --%-6s on --%-11s %5.2f:1', $mode, $foreground, $background, $ratio;

            say $line;
            @failures.push: "$line is below {MINIMUM-CONTRAST}:1" if $ratio < MINIMUM-CONTRAST;
        }
    }

    if @failures {
        note "\n" ~ @failures.join("\n");
        exit 1;
    }

    say "\ntheme ok";
}
