# $Id: Smartphone.pm,v 1.1.2.3 2013/04/15 04:20:53 ak Exp $
# Copyright (C) 2011,2013 Cubicroot Co. Ltd.
# Kanadzuchi::Mail::Group::PT::
                                                                        
  #####                        ##          ##                           
 ###     ##  ##  ####  ##### ###### #####  ##      ####  #####   ####   
  ###    ######     ## ##  ##  ##   ##  ## #####  ##  ## ##  ## ##  ##  
   ###   ######  ##### ##      ##   ##  ## ##  ## ##  ## ##  ## ######  
    ###  ##  ## ##  ## ##      ##   #####  ##  ## ##  ## ##  ## ##      
 #####   ##  ##  ##### ##       ### ##     ##  ##  ####  ##  ##  ####   
                                    ##                                  
package Kanadzuchi::Mail::Group::PT::Smartphone;
use base 'Kanadzuchi::Mail::Group';
use strict;
use warnings;

#  ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ ____ 
# ||C |||l |||a |||s |||s |||       |||M |||e |||t |||h |||o |||d |||s ||
# ||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
#
# Major company's smaprtphone domains in Portugal/Portuguese Republic
sub communisexemplar { return qr{[.]com\z}; }
sub nominisexemplaria
{
	my $class = shift;
	return {
		'optimus' => [
			# Optimus; http://optimus.pt/
			qr{\Aoptimus[.]blackberry[.]com\z},
		],
		'tmn' => [
			# TMN; http://www.tmn.pt/
			qr{\Atmn[.]blackberry[.]com\z},
		],
	};
}

sub classisnomina
{
	my $class = shift;
	return {
		'optimus'	=> 'Generic',
		'tmn'		=> 'Generic',
	};
}

1;
__END__
