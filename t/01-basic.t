#!/usr/bin/env perl

use strict;
use warnings FATAL => "all";
use Test::More tests => 11;
use Regexp::Common qw(VATIN);

ok "DE123456789" =~ /^$RE{VATIN}{DE}$/;
ok "DE123456789" =~ /^$RE{VATIN}{any}$/;
ok "DE12345678" !~ /^$RE{VATIN}{DE}$/;
ok "DE1234567890" !~ /^$RE{VATIN}{any}$/;

ok "GBGD123" =~ $RE{VATIN}{GB};
ok "GBGD1234" =~ $RE{VATIN}{GB};     # pattern needs line anchors:
ok "GBGD1234" !~ /^$RE{VATIN}{GB}$/; # <--
ok "GBGD123" =~ /^$RE{VATIN}{GB}$/; # <--

ok "GBGD1234" !~ /^$RE{VATIN}{IT}$/;    # Italy!
ok "NL999999999B99" =~ /^$RE{VATIN}{NL}$/; # Netherlands!
ok "ESA9999999B" =~ /^$RE{VATIN}{ES}$/; # Spain!
