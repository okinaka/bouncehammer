# $Id: SystemFull.pm,v 1.3 2010/03/01 23:41:59 ak Exp $
# -Id: SystemFull.pm,v 1.1 2009/08/29 07:33:28 ak Exp -
# -Id: SystemFull.pm,v 1.1 2009/05/04 05:17:05 ak Exp -
# Copyright (C) 2009,2010 Cubicroot Co. Ltd.
# Kanadzuchi::Mail::Why::
                                                                      
  #####                  ##                ######         ###  ###    
 ###     ##  ##  ##### ###### ####  ##  ## ##      ##  ##  ##   ##    
  ###    ##  ## ##       ##  ##  ## ###### ####    ##  ##  ##   ##    
   ###   ##  ##  ####    ##  ###### ###### ##      ##  ##  ##   ##    
    ###   #####     ##   ##  ##     ##  ## ##      ##  ##  ##   ##    
 #####      ##  #####     ### ####  ##  ## ##       ##### #### ####   
         ####                                                         
package Kanadzuchi::Mail::Why::SystemFull;

#  ____ ____ ____ ____ ____ ____ ____ ____ ____ 
# ||L |||i |||b |||r |||a |||r |||i |||e |||s ||
# ||__|||__|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
#
use base 'Kanadzuchi::Mail::Why';

#  ____ ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ 
# ||G |||l |||o |||b |||a |||l |||       |||v |||a |||r |||s ||
# ||__|||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|
#
# Regular expressions of 'Mail system full'
$Patterns = [
	qr(requested mail action aborted: exceeded storage allocation)o,	# MS Exchange
];

1;
__END__