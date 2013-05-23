# $Id: aubyKDDI.pm,v 1.3 2010/10/05 11:29:51 ak Exp $
# Copyright (C) 2009,2010 Cubicroot Co. Ltd.
# Kanadzuchi::Mail::Bounced::JP::
                                                        
               ##            ##  ## ####   ####  ####   
  ####  ##  ## ##     ##  ## ## ##  ## ##  ## ##  ##    
     ## ##  ## #####  ##  ## ####   ##  ## ##  ## ##    
  ##### ##  ## ##  ## ##  ## ####   ##  ## ##  ## ##    
 ##  ## ##  ## ##  ##  ##### ## ##  ## ##  ## ##  ##    
  #####  ##### #####     ##  ##  ## ####   ####  ####   
                      ####                              
package Kanadzuchi::Mail::Bounced::JP::aubyKDDI;
use base 'Kanadzuchi::Mail::Bounced';
use strict;
use warnings;

#  ____ ____ ____ ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____ ____ 
# ||I |||n |||s |||t |||a |||n |||c |||e |||       |||M |||e |||t |||h |||o |||d |||s ||
# ||__|||__|||__|||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__|||__||
# |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
#
sub is_filtered
{
	# +-+-+-+-+-+-+-+-+-+-+-+
	# |i|s|_|f|i|l|t|e|r|e|d|
	# +-+-+-+-+-+-+-+-+-+-+-+
	#
	# @Description	Bounced by domain(addr) filter?
	# @Param	<None>
	# @Return	(Integer) 1 = is filtered recipient
	#		(Integer) 0 = is not filtered recipient.
	my $self = shift();
	my $stat = $self->{'deliverystatus'} || return(0);
	my $subj = 'filtered';
	my $isfi = 0;

	if( defined($self->{'reason'}) && length($self->{'reason'}) )
	{
		$isfi = 1 if( $self->{'reason'} eq $subj );
	}
	else
	{
		if( $subj eq Kanadzuchi::RFC3463->causa($stat) )
		{
			$isfi = 1;
		}
	}
	return($isfi);
}

sub is_userunknown
{
	# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	# |i|s|_|u|s|e|r|u|n|k|n|o|w|n|
	# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+
	#
	# @Description	Whether addr is unknown or not
	# @Param	<None>
	# @Return	(Integer) 1 = is unknown user
	#		(Integer) 0 = is not unknown user.
	# @See		http://www.ietf.org/rfc/rfc2822.txt
	my $self = shift();
	my $stat = $self->{'deliverystatus'} || return(0);
	my $subj = 'userunknown';
	my $isuu = 0;
	my $rxuu = qr{User unknown};

	if( defined($self->{'reason'}) && length($self->{'reason'}) )
	{
		$isuu = 1 if( $self->{'reason'} eq $subj );
	}
	else
	{
		if( $subj eq Kanadzuchi::RFC3463->causa($stat) )
		{
			# au by KDDI
			#  Status: 5.1.1
			#  Diagnostic-Code: SMTP; 550 <***@ezweb.ne.jp>: User unknown
			$isuu = 1;
		}
		elsif( $stat eq '5.0.0' )
		{
			#  Final-Recipient: rfc822; ***@ezweb.ne.jp
			#  Action: failed
			#  Status: 5.0.0
			$isuu = 1;
		}
		elsif( $self->{'diagnosticcode'} =~ $rxuu )
		{
			$isuu = 1;
		}
	}
	return($isuu);
}

1;
__END__
