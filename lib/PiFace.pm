package PiFace;

use 5.016003;
use strict;
use warnings;
require Exporter;

our @ISA = qw(Exporter);
our %EXPORT_TAGS = (
	'all'      => [ qw(pfio_init pfio_deinit pfio_inited pfio_digital_read pfio_digital_write pfio_read_input pfio_read_output pfio_write_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number) ],
	'base'     => [ qw(pfio_init pfio_deinit pfio_inited pfio_digital_read pfio_digital_write) ],
	'advanced' => [ qw(pfio_init pfio_deinit pfio_inited pfio_read_input pfio_read_output pfio_write_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number) ],
	'read_base'=> [ qw(pfio_init pfio_deinit pfio_inited pfio_digital_read) ],
	'read_adv' => [ qw(pfio_init pfio_deinit pfio_inited pfio_read_input pfio_read_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number) ],
	'write_base'=>[ qw(pfio_init pfio_deinit pfio_inited pfio_digital_write) ],
	'write_adv'=> [ qw(pfio_init pfio_deinit pfio_inited pfio_write_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number) ]
);

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );
our @EXPORT = qw();
our $VERSION = '0.01';

require XSLoader;
XSLoader::load('PiFace', $VERSION);

# Preloaded methods go here.

1;
__END__

=head1 NAME

PiFace - Perl extension for PiFace native C library

=head1 SYNOPSIS

  use PiFace ':base';
  pfio_init(); # be sure to do the proper error checking
  pfio_digital_write (5, 1); # turns on pin 5

=head1 DESCRIPTION

This module provides a convenient wrapper around PiFace's native library. You can use almost all the functions the C library provides.
Please check L<the function list|https://raw.github.com/thomasmacpherson/piface/master/c/src/piface/pfio.h> for more details.

=head2 EXPORT

None by default. There are some export tags which can be used with C<use PiFace ':tag'>.

=over

=item all

Exports all the functions.

=item base

Exports the basic read/write functions (pfio_init pfio_deinit pfio_inited pfio_digital_read pfio_digital_write).

=item advanced

Exports advanced functions (pfio_init pfio_deinit pfio_inited pfio_read_input pfio_read_output pfio_write_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number).

=item read_base

Exports just basic read only functions (pfio_init pfio_deinit pfio_inited pfio_digital_read).

=item read_adv

Exports advanced read only functions (pfio_init pfio_deinit pfio_inited pfio_read_input pfio_read_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number).

=item write_base

Exports just basic write only functions (pfio_init pfio_deinit pfio_inited pfio_digital_write).

=item write_adv

Exports advanced write only functions (pfio_init pfio_deinit pfio_inited pfio_write_output pfio_get_pin_bit_mask pfio_get_lowest_pin_number).

=back



=head1 SEE ALSO

L<The official PiFace repository|https://github.com/thomasmacpherson/piface>

=head1 AUTHOR

Robertof, E<lt>robertof.public@gmail.comE<gt>

=head1 CAVEATS

This is just a XS wrapper around the deprecated PiFace's C API. It should be migrated to the wiringPi library, since it's PiFace-compatible.

Also the documentation for this Perl library is poorly written (due to time shortages), and the tests are missing. If you have any doubts, please contact me.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Robertof

This library is released under the BSD 2-clause license.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met: 

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution. 

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies, 
either expressed or implied, of the FreeBSD Project.


=cut
