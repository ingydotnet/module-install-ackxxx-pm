package Module::Install::AckXXX;
use strict;
use warnings;
use 5.008003;

use Module::Install::Base;

use vars qw($VERSION @ISA);
BEGIN {
    $VERSION = '0.10';
    @ISA     = 'Module::Install::Base';
}

sub ack_xxx {
    my $self = shift;
    return unless $self->is_admin;

    require Capture::Tiny;
    sub ack { system "ack '^\\s*use XXX\\b'"; }
    my $output = Capture::Tiny::capture_merged(\&ack);
    $self->_report($output) if $output;
}

sub _report {
    my $self = shift;
    my $output = shift;
    chomp ($output);
    print <<"...";

*** AUTHOR WARNING ***
*** Found usage of XXX.pm in this code:
$output

...
}

1;

=encoding utf8

=head1 NAME

Module::Install::AckXXX - Warn Author About XXX.pm

=head1 SYNOPSIS

    use inc::Module::Install;

    name     'Foo';
    all_from 'lib/Foo.pm';

    ack_xxx;

    WriteAll;

=head1 DESCRIPTION

If you are the module author, this module runs the command:

    system "ack '^\\s*use XXX\\b'";

whenever you run:

    perl Makefile.PL

so you will remember to remove or comment out usage of the L<XXX>
debugging module, before releasing your module.

=head1 AUTHOR

Ingy döt Net <ingy@cpan.org>

=head1 COPYRIGHT

Copyright (c) 2010. Ingy döt Net.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
