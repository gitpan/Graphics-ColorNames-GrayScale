package Graphics::ColorNames::GrayScale;

=head1 NAME

Graphics::ColorNames::GrayScale - grayscale colors for Graphics::ColorNames

=head1 SYNOPSIS

  require Graphics::ColorNames::GrayScale;

  $NameTable = Graphics::ColorNames::GrayScale->NamesRgbTable();
  $RgbColor  = $NameTable->{gray80};

=head1 DESCRIPTION

This module provides grayscale colors for L<Graphics::ColorNames>.
The following are valid colors:

  Format  Example  Description

  grayHH  grey80   Gray value in hexidecimal (HH between 00 and ff)
  grayDDD gray128  Gray value in decimal (DDD between 000 and 255)
  grayP%  gray50%  Gray value in percentage (P between 0 and 100)

Besides C<gray>, on can also use the following colors:

  red
  green
  blue
  yellow
  cyan
  purple

Lower values are darker, higher values are brighter.

=head1 AUTHOR

Robert Rothenberg <rrwo at cpan.org>

=head1 LICENSE

Copyright (c) 2004 Robert Rothenberg. All rights reserved.
This program is free software; you can redistribute it and/or
modify it under the same terms as Perl itself.

=cut

require 5.006;

use strict;
use warnings;

our $VERSION = '1.00';

my %RgbColors   = ( );

# This is really inefficient. It makes better sense memory-wise to
# have a subroutine which parses the key and returns a value.  But
# that's a modification for a future version of Graphics::ColorNames.

sub NamesRgbTable() {
  unless (keys %RgbColors) {
    for my $i (0..255) {
      my $rgb = ($i << 16) | ($i << 8) | $i;
      my $dec = sprintf('%03d',$i);
      my $hex = sprintf('%02x',$i);
      my $pct = int(($i / 255) * 100) . '%';

      $RgbColors{"gray$dec"} = $rgb;
      $RgbColors{"gray$hex"} = $rgb;
      $RgbColors{"gray$pct"} = $rgb,
	unless (exists $RgbColors{"gray$pct"});

      $RgbColors{"red$dec"} = ($rgb & 0xff0000);
      $RgbColors{"red$hex"} = ($rgb & 0xff0000);
      $RgbColors{"red$pct"} = ($rgb & 0xff0000),
	unless (exists $RgbColors{"red$pct"});

      $RgbColors{"green$dec"} = ($rgb & 0x00ff00);
      $RgbColors{"green$hex"} = ($rgb & 0x00ff00);
      $RgbColors{"green$pct"} = ($rgb & 0x00ff00),
	unless (exists $RgbColors{"green$pct"});

      $RgbColors{"blue$dec"} = ($rgb & 0x0000ff);
      $RgbColors{"blue$hex"} = ($rgb & 0x0000ff);
      $RgbColors{"blue$pct"} = ($rgb & 0x0000ff),
	unless (exists $RgbColors{"blue$pct"});

      $RgbColors{"yellow$dec"} = ($rgb & 0xffff00);
      $RgbColors{"yellow$hex"} = ($rgb & 0xffff00);
      $RgbColors{"yellow$pct"} = ($rgb & 0xffff00),
	unless (exists $RgbColors{"yellow$pct"});

      $RgbColors{"cyan$dec"} = ($rgb & 0x00ffff);
      $RgbColors{"cyan$hex"} = ($rgb & 0x00ffff);
      $RgbColors{"cyan$pct"} = ($rgb & 0x00ffff),
	unless (exists $RgbColors{"cyan$pct"});

      $RgbColors{"purple$dec"} = ($rgb & 0xff00ff);
      $RgbColors{"purple$hex"} = ($rgb & 0xff00ff);
      $RgbColors{"purple$pct"} = ($rgb & 0xff00ff),
	unless (exists $RgbColors{"purple$pct"});

    }
  }
  return \%RgbColors;
}

1;

